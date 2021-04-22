function makeStatusButton(data) {
    let curr_status_id = parseInt($("input#order_status").val());

    const target = $("#statusBtn__wrapper");
    const templateBtn = $(".status__btn__template")

    for (let status of data) {
        let clonedEl = templateBtn.clone();
        let btnClass = ""

        clonedEl.removeClass("status__btn__template").removeClass("d-none")

        switch (status.order_status_id) {
            case 1:
                btnClass = "btn-secondary"
                break;
            case 2:
                btnClass = "btn-warning"
                break;
            case 3:
                btnClass = "btn-info"
                break;
            case 4:
                btnClass = "btn-primary"
                break;
            case 5:
                btnClass = "btn-success"
                break;
            case 6:
                btnClass = "btn-danger"
                break;
        }

        clonedEl.find("button").addClass(btnClass).data("status", status.order_status_id)
            .text(statusLabel("주문 ", status.status_value, ""))

        if (status.order_status_id <= curr_status_id) {
            clonedEl.find("button").addClass("disabled").prop("disabled", true)
        } else {
            clonedEl.find("button").on("click", function () {
                statusChange(status.order_status_id)
            });
        }

        target.append(clonedEl)
    }
}

function loadOrderStatus() {
    $.ajax({
        method: "get",
        url: "/order/order-status-ajax",
        dataType: "json",
        cache: false,
        success: (jsonData) => {
            if (jsonData.success) {
                makeStatusButton(jsonData.list)
            }
        },
        error: (req, status, err) => {
            console.log("get status list err : ", err)
        }
    })
}

function changeStatusLabel() {
    let current_status_value = $("#order_status_value").val()
    let changed_status_text = statusLabel("주문 ", current_status_value, "");

    $("#status_text_in_progress").text(changed_status_text)
    $("#current_status").text(changed_status_text)
}

function statusLabel(prevText, status, nextText) {
    let label_str;

    switch (status) {
        case "ordered":
            label_str = "완료";
            break;
        case "checked":
            label_str = "확인";
            break;
        case "processing":
            label_str = "조리중"
            break;
        case "completed":
            label_str = "조리완료"
            break;
        case "done":
            label_str = "픽업완료"
            break;
        case "canceled":
            label_str = "취소"
            break;
        default:
            label_str = "라벨 없음"
    }

    return prevText + label_str + nextText
}

function statusChange(status_id) {
    const header = $("meta[name='_csrf_header']").attr('content');
    const token = $("meta[name='_csrf']").attr('content');

    const order_id = $("input#order_id").val();

    $.ajax({
        url: "/order/updateAction",
        method: "post",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: {order_id, status_id: status_id},
        dataType: "json",
        success: (jsonData) => {
            if (jsonData.success) {
                $("#infoModal__msg").text("주문 상태 변경 업데이트 완료")
                $("#infoModal").modal("show");
            }
        },
        error: (req, status, err) => {
            console.log("order update action err : ", err)
        }
    })
}