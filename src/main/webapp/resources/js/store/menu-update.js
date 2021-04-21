let owner_id_val;
let category_val;
let menuImgVal;
let menuStatusVal;

let textEls;
let menuImgEl;

let submitBtn;
let resetBtn;
let formEl;
let alertModal;

$(() => {
    owner_id_val = $("#owner_id").val();
    category_val = $("#category_name").val();
    menuImgVal = $("#prev_image").val();
    menuStatusVal = $("#menu_status").val();

    alertModal = $("#alertModal")

    formEl = $("#updateMenuForm");
    submitBtn = $("#submitBtn");
    resetBtn = $("#resetBtn");

    submitBtn.on("click", (e) => submitForm(e));
    resetBtn.on("click", (e) => resetForm(e));

    textEls = $("input:text, textarea").not("#store_name");
    textEls.each((idx, el) => {
        $(el).on("keyup", textInputChangeHandler)
    })

    menuImgEl = $("input:file#menu_image")
    menuImgEl.on("change", function () {
        imageUploadHandler(this, "#menu_preview")
    })

    $("input:radio[name='menu_status_value']").each((idx, el) => {
        if ($(el).prop("id") === `menu_${menuStatusVal}`) {
            $(el).prop("checked", true)
        }
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

    const prevImgVal = $("#prev_image").val();
    menuImgVal = input.files[0].name
    $("#menu_image_name").text(menuImgVal);
    $("#menu_image").removeClass("is-invalid")

    if (prevImgVal !== menuImgVal) {
        $("#image_changed").val(true);
        $("#infoModal__msg").text("이미지가 변경되었습니다")
        $("#infoModal").modal("show")
    }
}

function makeCategory(list) {
    const template = $(".category_template")

    $(list).each((idx, item) => {
        let clonedEl = template.clone();

        clonedEl.removeClass("category_template").removeClass("d-none");
        clonedEl.find("input").prop("id", `category_id_${item.category_id}`).prop("value", item.category_id)
            .attr("checked", category_val == item.category_name ? true : false)
            .change(() => {
                $("input:radio[name='category_id']").removeClass("is-invalid");
                $("#categoryCheckFeedback").css({display: "none"})
            });
        clonedEl.find("label").prop("for", `category_id_${item.category_id}`).text(item.category_name);

        template.after(clonedEl)
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

    if (!$("input:radio[name='category_id']:checked").val()) {
        $("input:radio[name='category_id']").addClass("is-invalid");
        formIsValid = false;
        $("#categoryCheckFeedback").css({display: "block"})

        console.log("카테고리가 선택되지 않았습니다")
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

    $("input:radio[name='category_id']").removeClass("is-invalid");
    $("#storeCheckFeedback").css({display: "none"});
    $("#categoryCheckFeedback").css({display: 'none'})
}