$(() => {

})

function changeStatusLabel() {
    let targetEl = $("#current_status")
    let current_status_value = parseInt(targetEl.text());
    let changed_status_text = statusLabel("주문 ", current_status_value, "");

    $("#status_text").text(changed_status_text)
    targetEl.text(changed_status_text)
}

function statusLabel(prevText, status, nextText) {
    let label_str = ""
    switch (status) {
        case 1:
            label_str = "완료";
            break;
        case 2:
            label_str = "확인";
            break;
        case 3:
            label_str = "조리중"
            break;
        case 4:
            label_str = "조리완료"
            break;
        case 5:
            label_str = "픽업완료"
            break;
        case 6:
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

    const order_id = $("#order_id").val();

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