let owner_id_val;
let textEls;
let menuImgEl;

let resetBtn;
let formEl;
let alertModal;
let menuImgVal;

$(() => {
    owner_id_val = $("#owner_id").val();

    alertModal = $("#alertModal")

    formEl = $("#createMenuForm");
    resetBtn = $("#resetBtn");

    $("#submitBtn").on("click", (e) => submitForm(e));
    resetBtn.on("click", (e) => resetForm(e));

    textEls = $("input:text, textarea");
    textEls.each((idx, el) => {
        $(el).on("keyup", textInputChangeHandler)
    })

    menuImgEl = $("input:file#menu_image")
    menuImgEl.on("change", function () {
        imageUploadHandler(this, "#menu_preview")
    })
})

function textInputChangeHandler(e) {
    $(e.target).removeClass("is-invalid")
    if (e.target.id === "menu_price") {
        numInputChangeHandler(e)
    }
}

function numInputChangeHandler(e) {
    let splitVal = $(e.target).val().split("")

    if (e.which !== 8 && e.which !== 9 && e.which !== 37 && e.which !== 39 && (e.which < 48 || e.which > 57)) {
        $("#alertModal__msg").text("숫자만 입력 가능합니다");
        alertModal.modal("show");
        splitVal.pop()
        return $(e.target).val("")
    }
}

function imageUploadHandler(input, preview) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            $(preview).attr("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }

    menuImgVal = input.files[0].name
    $("#menu_image_name").text(menuImgVal);
    $("#menu_image").removeClass("is-invalid")
}


function makeStore(list) {
    const template = $(".store_template")

    $(list).each((idx, item) => {
        let clonedEl = template.clone();

        clonedEl.removeClass("store_template").removeClass("d-none");
        clonedEl.find("input").prop("id", `store_id_${item.store_id}`).prop("value", item.store_id)
            .change(() => {
                $("input:radio[name='store_id']").removeClass("is-invalid");
                $("#storeCheckFeedback").css({display: "none"})

            });
        clonedEl.find("label").prop("for", `store_id_${item.store_id}`).text(item.store_name);

        template.after(clonedEl)
    })
}

function makeCategory(list) {
    const template = $(".category_template")

    $(list).each((idx, item) => {
        let clonedEl = template.clone();

        clonedEl.removeClass("category_template").removeClass("d-none");
        clonedEl.find("input").prop("id", `category_id_${item.category_id}`).prop("value", item.category_id)
            .change(() => {
                $("input:radio[name='category_id']").removeClass("is-invalid");
                $("#categoryCheckFeedback").css({display: "none"})
            });
        clonedEl.find("label").prop("for", `category_id_${item.category_id}`).text(item.category_name);

        template.after(clonedEl)
    })
}

function getLoadStoreListByOwner() {
    $.ajax({
        url: "/store/store-list-ajax",
        data: {owner_id: owner_id_val},
        method: "get",
        cache: false,
        dataType: "json",
        success: (jsonData) => {
            makeStore(jsonData.list)
        },
        error: (req, status, err) => {
            console.log("get store err : ", err)
        }
    })
}

function getLoadCategoryList() {
    $.ajax({
        url: "/menu-category/list",
        method: "get",
        cache: false,
        dataType: "json",
        success: (jsonData) => {
            makeCategory(jsonData.list)
        },
        error: (req, status, err) => {
            console.log("get category err : ", err)
        }
    })
}


let formIsValid = true;

function submitForm(e) {
    e.preventDefault();

    textEls.each((idx, el) => {
        if (!$(el).val() && $(el).data("valid") === "required") {
            $(el).addClass("is-invalid")
            formIsValid = false;

            console.log("Required 값이 입력되지 않았습니다")
        }
    })

    if (!$("input:radio[name='store_id']:checked").val()) {
        $("input:radio[name='store_id']").addClass("is-invalid");
        formIsValid = false;
        $("#storeCheckFeedback").css({display: "block"})

        console.log("가게가 선택되지 않았습니다")
    }

    if (!$("input:radio[name='category_id']:checked").val()) {
        $("input:radio[name='category_id']").addClass("is-invalid");
        formIsValid = false;
        $("#categoryCheckFeedback").css({display: "block"})

        console.log("카테고리가 선택되지 않았습니다")
    }

    if (!menuImgVal) {
        $("#menu_image").addClass("is-invalid")
        formIsValid = false;

        console.log("메뉴 이미지가 입력되지 않았습니다")
    }

    if (formIsValid) {
        formEl.submit();
    } else {
        $("#alertModal__msg").text("폼 전송에 실패했습니다. ")
        alertModal.modal("show");
    }
}

function resetForm(e) {
    e.preventDefault();
    formIsValid = true;

    let resetEls = [textEls, menuImgEl]

    $(resetEls).each((idx, el) => {
        $(el).val("")
        $(el).removeClass("is-invalid")
    })
    $("input:radio[name='store_id']").removeClass("is-invalid");
    $("input:radio[name='category_id']").removeClass("is-invalid");
    $("#storeCheckFeedback").css({display: "none"});
    $("#categoryCheckFeedback").css({display: 'none'})
}