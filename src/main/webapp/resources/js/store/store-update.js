let textEls;
let storeImgEl;

let checkBoxes;

let formEl;

let alertModal;
let infoModal;

let storeImgVal;

$(() => {
    alertModal = $("#alertModal")
    infoModal = $("#infoModal")

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

    formEl = $("#updateStoreForm");

    $("#submitBtn").on("click", (e) => submitForm(e));
    $("#resetBtn").on("click", (e) => resetForm(e));

    textEls = $("input:text, textarea").not("#store_name");

    textEls.each((idx, el) => {
        $(el).on("keyup", textInputChangeHandler)
    })

    checkBoxes = $("input:checkbox[name='holiday']")

    storeImgEl = $("input:file#store_image")
    storeImgEl.on("change", function () {
        imageUploadHandler(this, "#store_preview")
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

function imageUploadHandler(input, preview) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            $(preview).attr("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
    const prevImgVal = $("#prev_image").val();
    storeImgVal = input.files[0].name
    $("#store_image_name").text(storeImgVal);
    $("#store_image").removeClass("is-invalid")

    if (prevImgVal !== storeImgVal) {
        $("#image_changed").val(true);
        $("#infoModal__msg").text("이미지가 변경되었습니다")
        $("#infoModal").modal("show")
    }
}

function textInputChangeHandler(e) {
    $(e.target).removeClass("is-invalid")
    if (e.target.id === "store_tel" ||
        e.target.id === "store_rnum") {
        numInputChangeHandler(e)
    }
}

let telNumIsValid = true;
let rNumIsValid = true;

function numInputChangeHandler(e) {
    let splitVal = $(e.target).val().split("")

    if (e.which !== 8 && e.which !== 9 && e.which !== 37 && e.which !== 39 && (e.which < 48 || e.which > 57)) {
        if (e.target.id === "store_tel") {
            telNumIsValid = false;
        } else if (e.target.id === "store_rnum") {
            rNumIsValid = false;
        }

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

    if (!checkBoxes.is(":checked")) {
        $("#holidayCheckFeedback").css({display: 'block'})
        checkBoxes.addClass("is-invalid");

        formIsValid = false;

        console.log("휴일이 입력되지 않았습니다")
    }

    if (formIsValid && telNumIsValid && rNumIsValid) {
        formEl.submit();
    } else {
        $("#alertModal__msg").text("폼 전송에 실패했습니다. ")
        alertModal.modal("show");
    }
}

function resetForm(e) {
    e.preventDefault();
    formIsValid = true;

    let resetEls = [textEls, storeImgEl]

    $(resetEls).each((idx, el) => {
        $(el).val("")
        $(el).removeClass("is-invalid")
    })

    checkBoxes.prop("checked", false)
    $("input:checkbox#noneHoliday").prop("checked", true)
    $("#holidayCheckFeedback").css({display: "none"});
}
