let owner_id_val;
let nameInputEl;

let alertModal;
let infoModal;

$(() => {
    alertModal = $("#alertModal")
    infoModal = $("#infoModal")

    formEl = $("#searchStaffForm");

    $("#submitBtn").on("click", (e) => submitForm(e));
    $("#resetBtn").on("click", (e) => resetForm(e));

    nameInputEl = $("input:text#search_val")
    nameInputEl.on("keyup", function () {
        $(this).removeClass("is-invalid");
    })
})

function makeStore(list) {
    const template = $(".store_template")

    $(list).each((idx, item) => {
        let clonedEl = template.clone();

        clonedEl.removeClass("store_template").removeClass("d-none");
        clonedEl.find("input").prop("id", `store_id_${item.store_id}`).prop("value", item.store_id)
            .change(function () {
                $("input:radio[name='store_id']").removeClass("is-invalid");
                $("#storeCheckFeedback").css({display: "none"})
            });
        clonedEl.find("label").prop("for", `store_id_${item.store_id}`).text(item.store_name);

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

function makeStaffTable(data) {
    $("#target-tbody").empty();

    const templateTr = $("#staff_template_tr");
    let count = 1;

    for (let staff of data) {
        let clonedTr = templateTr.clone();
        clonedTr.attr("id", `staff_${staff.user_id}`).removeClass("d-none");
        clonedTr.find(".staff_count").text(count);
        clonedTr.find(".staff_name").append(staff.user_name);
        clonedTr.find(".staff_email").text(staff.user_email);
        clonedTr.find(".staff_date").text(staff.created_at.substr(0, 11));
        clonedTr.find(".staff_register").append(`<button class="btn btn-primary btn-sm"
onclick="registerStaff('${staff.user_id}')">등록</button>`)

        $("#target-tbody").append(clonedTr);
        count++;
    }

}

function registerStaff(staff_id) {
    const header = $("meta[name='_csrf_header']").attr('content');
    const token = $("meta[name='_csrf']").attr('content');

    console.log({header})
    console.log({token})

    $.ajax({
        url: "/staff/createAction",
        // beforeSend: function (xhr) {
        //     xhr.setRequestHeader(header, token);
        // },
        method: "post",
        data: {store_id: $("input:radio[name='store_id']:checked").val(), user_id: staff_id},
        dataType: "json",
        success: (jsonData) => {
            if (jsonData.success) {
                $("#infoModal__msg").text("스태프 등록 성공하였습니다")
                infoModal.modal("show")
                $(`tr#staff_${staff_id}`).remove();
            } else {
                $("#alertModal__msg").text("스태프 등록 실패하였습니다")
                alertModal.modal("show")
            }
        },
        error: (req, status, err) => {
            console.log("register staff err : ", err)
        }
    })
}

function makeEmptyTable() {
    let tbody = $("#target-tbody");

    tbody.empty();
    tbody.append("<tr><td colspan='4' class='text-warning'>해당 매장에 등록할 직원이 존재하지 않습니다</td></tr>");
}


function submitForm(e) {
    e.preventDefault();

    let formIsValid = true;

    if (!nameInputEl.val() && nameInputEl.data("valid") === "required") {
        nameInputEl.addClass("is-invalid")
        formIsValid = false;

        console.log("Required 값이 입력되지 않았습니다")
    }

    if (!$("input:radio[name='store_id']:checked").val()) {
        $("input:radio[name='store_id']").addClass("is-invalid");
        formIsValid = false;
        $("#storeCheckFeedback").css({display: "block"})

        console.log("가게가 선택되지 않았습니다")
    }

    console.log({formIsValid});

    if (formIsValid) {
        console.log("form submit!!");

        const data = {
            store_id: $("input:radio[name='store_id']:checked").val(),
            search_val: nameInputEl.val()
        }

        $.ajax({
            url: "/staff/searchAction",
            method: "get",
            data,
            dataType: "json",
            success: (jsonData) => {
                if (jsonData.success) {
                    makeStaffTable(jsonData.list)
                } else {
                    makeEmptyTable();
                }
            },
            error: (req, status, err) => {
                console.log("search list err : ", err)
            },
            complete: () => {
                $("input:radio[name='store_id']").each((idx, el) => {
                    $(el).attr("disabled", true)
                })
            }
        })
    } else {
        $("#alertModal__msg").text("폼 전송에 실패했습니다. ")
        alertModal.modal("show");
    }
}

function resetForm(e) {
    e.preventDefault();

    nameInputEl.val("")
    nameInputEl.removeClass("is-invalid")

    $("input:radio[name='store_id']").each((idx, el) => {
        $(el).prop("disabled", false).removeClass("is-invalid")
    });

    $("#storeCheckFeedback").css({display: "none"});

    $("#target-tbody").empty();
}