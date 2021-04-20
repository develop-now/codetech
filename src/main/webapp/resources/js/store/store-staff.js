let store_id_val

let alertModal;
let infoModal;

$(() => {
    alertModal = $("#alertModal")
    infoModal = $("#infoModal")
})

function loadStoreStaff(store_id, store_name) {
    store_id_val = store_id

    $.ajax({
        method: "get",
        url: "/staff/staff-list-by-store-ajax",
        data: {store_id},
        dataType: "json",
        cache: false,
        success: (jsonData) => {
            if (jsonData.success) {
                makeStaffTable(jsonData.list, store_name)
            } else {
                makeEmptyTable(store_name)
            }
        },
        error: (req, status, err) => {
            console.log("get staff list err : ", err)
        }
    })
}

function makeEmptyTable(store_name) {
    $("#target-tbody").empty();

    $("#store_name").text(store_name);

    $("#target-tbody").append("<tr><td colspan='4' class='text-warning'>해당 매장에 직원이 존재하지 않습니다</td></tr>");
}

function expireStaff(staff_id) {
    const header = $("meta[name='_csrf_header']").attr('content');
    const token = $("meta[name='_csrf']").attr('content');

    $.ajax({
        url: "/staff/deleteAction",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        method: "post",
        data: {store_id: store_id_val, user_id: staff_id},
        dataType: "json",
        success: (jsonData) => {
            if (jsonData.success) {
                $("#infoModal__msg").text("스태프 삭제 성공하였습니다")
                infoModal.modal("show")

                $(`tr#staff_${staff_id}`).remove();
            } else {
                $("#alertModal__msg").text("스태프 삭제 실패하였습니다")
                alertModal.modal("show")
            }
        },
        error: (req, status, err) => {
            console.log("err : ", err)
        }
    })
}

function makeStaffTable(data, store_name) {
    $("#target-tbody").empty();

    $("#store_name").text(store_name);

    const templateTr = $("#staff_template_tr");
    let count = 1;

    for (let staff of data) {
        let clonedTr = templateTr.clone();
        clonedTr.attr("id", `staff_${staff.user_id}`).removeClass("d-none");
        clonedTr.find(".staff_count").text(count);
        clonedTr.find(".staff_name").text(staff.user_name);
        clonedTr.find(".staff_email").text(staff.user_email);
        clonedTr.find(".staff_date").text(staff.created_at.substr(0, 11));
        clonedTr.find(".staff_expire").append(`<button class="btn btn-danger btn-sm"
onclick="expireStaff('${staff.user_id}')">삭제</button>`)

        $("#target-tbody").append(clonedTr);
        count++;
    }
}