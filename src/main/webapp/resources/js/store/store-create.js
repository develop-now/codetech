let textEls;

let storeImgEl;
let menuImgEl;

let checkBoxes;

let formEl;

let alertModal;
let infoModal;

let storeImgVal;
let menuImgVal;

let geocoder;

$(() => {
    alertModal = $("#alertModal")
    infoModal = $("#infoModal")

    geocoder = new daum.maps.services.Geocoder();

    $("#findAddressBtn").on("click", (e) => {
        e.preventDefault();
        searchAddress()
    })

    const pickerTargetEl = ["opening_h_w_open", "opening_h_w_close", "opening_h_h_open", "opening_h_h_close"];
    pickerTargetEl.forEach(el => {
        $("#" + el).bootstrapMaterialDatePicker({
            format: 'HH:mm',
            year: false,
            date: false,
            nowButton: true,
            nowText: "현재시간",
            cancelText: "닫기",
            okText: "선택"
        }).on("change", (e, val) => {
            $(`input[name='${el}']`).val(val.format("HH:mm"))
            $(`input#${el}`).removeClass("is-invalid")
        })
    })

    formEl = $("#createStoreForm");

    $("#submitBtn").on("click", (e) => submitForm(e));
    $("#resetBtn").on("click", (e) => resetForm(e));

    textEls = $("input:text, textarea");
    textEls.each((idx, el) => {
        $(el).on("keyup", textInputChangeHandler)
    })

    checkBoxes = $("input:checkbox[name='holiday']")

    getLoadCategoryList();

    storeImgEl = $("input:file#store_image")
    menuImgEl = $("input:file#menu_image")

    storeImgEl.on("change", function () {
        imageUploadHandler(this, "#store_preview")
    })
    menuImgEl.on("change", function () {
        imageUploadHandler(this, "#menu_preview")
    })

    checkBoxes.each((iex, el) => {
        const noneHolidayEl = $("input:checkbox#noneHoliday")
        $(el).on("change", () => {
            if ($(el).val() !== "none") {
                noneHolidayEl.prop("checked", false)
            } else {
                checkBoxes.prop("checked", false)
                noneHolidayEl.prop("checked", true)
            }
            $("#holidayCheckFeedback").css({display: "none"});
            checkBoxes.removeClass("is-invalid");
        })
    })
})

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

function imageUploadHandler(input, preview) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            $(preview).attr("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }

    let imageVal = input.files[0].name

    if (preview === "#store_preview") {
        storeImgVal = imageVal
        $("#store_image_name").text(storeImgVal);
        $("#store_image").removeClass("is-invalid")
    } else if (preview === "#menu_preview") {
        menuImgVal = imageVal
        $("#menu_image_name").text(menuImgVal);
        $("#menu_image").removeClass("is-invalid")
    }
}

function textInputChangeHandler(e) {
    $(e.target).removeClass("is-invalid")
    if (e.target.id === "store_name") {
        storeNameValidation(e)
    } else if (e.target.id === "store_tel" ||
        e.target.id === "store_rnum" ||
        e.target.id === "menu_price") {
        numInputChangeHandler(e)
    }
}

let nameIsValid = false;

function storeNameValidation() {
    let storeNameEl = $("#store_name")
    let name = storeNameEl.val()

    if (name.length > 1) {
        $.ajax({
            url: "/store/storeNameCheck",
            method: "get",
            data: {name},
            dataType: "json",
            cache: false,
            success: (jsonData) => {
                if (jsonData.result === -1) {
                    storeNameEl.addClass("is-valid").removeClass("is-invalid")
                    nameIsValid = true
                } else {
                    storeNameEl.addClass("is-invalid").removeClass("is-valid")
                    storeNameEl.next().text("상호명을 사용할 수 없습니다")
                    nameIsValid = false
                }
            },
            error: (req, status, err) => {
                console.log("name check err : ", err)
            }
        })
    } else if (name.length <= 1) {
        storeNameEl.addClass("is-invalid").removeClass("is-valid")
        storeNameEl.next().text("상호명 2글자 이상 입력하세요")
    } else {
        storeNameEl.removeClass("is-valid").removeClass("is-invalid")
        storeNameEl.next().text("상호명을 입력하세요")
    }
}

let telNumIsValid = false;
let rNumIsValid = false

function numInputChangeHandler(e) {
    let splitVal = $(e.target).val().split("")

    if (e.which !== 8 && e.which !== 9 && e.which !== 37 && e.which !== 39 && (e.which < 48 || e.which > 57)) {
        $("#alertModal__msg").text("숫자만 입력 가능합니다");
        alertModal.modal("show");
        splitVal.pop()
        return $(e.target).val("")
    }

    if (e.target.id === "store_tel") {
        if (splitVal.length > 3 && splitVal[3] !== '-') {
            splitVal.splice(3, 0, '-')
        } else if (splitVal.length > 8 && splitVal[8] !== '-') {
            splitVal.splice(8, 0, '-')
        }

        if (splitVal.length > 13) {
            $(e.target).next().text("전화번호는 11자리 이상 넘어갈수 없습니다.")
            $(e.target).addClass("is-invalid")
        } else {
            telNumIsValid = true;
            $(e.target).val(splitVal.join(""))
        }
    } else if (e.target.id === "store_rnum") {
        if (splitVal.length > 3 && splitVal[3] !== '-') {
            splitVal.splice(3, 0, '-')
        } else if (splitVal.length > 6 && splitVal[6] !== '-') {
            splitVal.splice(6, 0, '-')
        }

        if (splitVal.length > 12) {
            $(e.target).next().text("사업자번호는 12자리 이상 넘어갈수 없습니다.")
            $(e.target).addClass("is-invalid")
        } else {
            rNumIsValid = true
            $(e.target).val(splitVal.join(""))
        }
    }
}


function submitForm(e) {
    e.preventDefault();

    let formIsValid = true;

    textEls.each((idx, el) => {
        if (!$(el).val() && $(el).data("valid") === "required") {
            $(el).addClass("is-invalid")
            formIsValid = false;

            console.log("Required 값이 입력되지 않았습니다")
        }
    })

    if (!checkBoxes.is(":checked")) {
        $("#holidayCheckFeedback").css({display: 'block'})
        checkBoxes.addClass("is-invalid");

        formIsValid = false;

        console.log("휴일이 입력되지 않았습니다")
    }

    if (!$("input:radio[name='category_id']:checked").val()) {
        $("input:radio[name='category_id']").addClass("is-invalid");
        formIsValid = false;
        $("#categoryCheckFeedback").css({display: "block"})

        console.log("카테고리가 선택되지 않았습니다")
    }

    if (!storeImgVal) {
        $("#store_image").addClass("is-invalid")
        formIsValid = false

        console.log("가게 이미지가 입력되지 않았습니다")
    }

    if (!menuImgVal) {
        $("#menu_image").addClass("is-invalid")
        formIsValid = false;

        console.log("메뉴 이미지가 입력되지 않았습니다")
    }


    if (formIsValid && telNumIsValid && rNumIsValid && nameIsValid) {
        formEl.submit();
    } else {
        $("#alertModal__msg").text("폼 전송에 실패했습니다. ")
        alertModal.modal("show");
    }
}

function resetForm(e) {
    e.preventDefault();
    formIsValid = true;

    let resetEls = [textEls, storeImgEl, menuImgEl]

    $(resetEls).each((idx, el) => {
        $(el).val("")
        $(el).removeClass("is-invalid")
    })

    checkBoxes.prop("checked", false)
    $("input:radio[name='category_id']").removeClass("is-invalid");
    $("input:checkbox#noneHoliday").prop("checked", true)
    $("#holidayCheckFeedback").css({display: "none"});
    $("#categoryCheckFeedback").css({display: 'none'})
}

function searchAddress() {
    new daum.Postcode({
        oncomplete: function (data) {
            const addr = data.address;

            const addrArr = addr.split(" ");

            let siData = ""
            let guData = ""
            let dongData = ""
            let etcData = ""

            siData = addrArr[0];
            dongData = data.bname;
            let lastIndex = 1;

            for (let i = 1; i < addrArr.length; i++) {
                switch (addrArr[i].slice(-1)) {
                    case "시":
                        siData += ` ${addrArr[i]} `
                        break;
                    case "구":
                        guData += ` ${addrArr[i]} `
                        lastIndex = i
                        break;
                }
            }

            let etc_addr_arr = addrArr.slice(lastIndex + 1, addrArr.length)
            etcData = etc_addr_arr.join(" ");

            $("#store_address_si").val(siData).removeClass("is-invalid");
            $("#store_address_gu").val(guData).removeClass("is-invalid");
            $("#store_address_dong").val(dongData).removeClass("is-invalid")
            $("#store_address_etc").val(etcData).removeClass("is-invalid")

            geocoder.addressSearch(data.address, function (results, status) {
                if (status === daum.maps.services.Status.OK) {

                    const result = results[0];
                    const coords = new daum.maps.LatLng(result.y, result.x);

                    console.log("result : ", result)
                    console.log("coords : ", coords)

                    $("#store_address_lat").val(result.y)
                    $("#store_address_lon").val(result.x)
                }
            })

        }
    }).open();
}
