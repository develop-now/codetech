$(() => {
    $(".store_status_value").each((idx, el) => {
        let storeId = $(el).data("store_id")
        let status_val = $(el).data("store_status_value");
        let switchInputEl = $(`#statusSwitch_${storeId}`);

        if (status_val === 'active') {
            switchInputEl.prop("checked", true)
            switchInputEl.next().text("비활성화하기")
        } else if (status_val === 'inactive') {
            switchInputEl.prop("checked", false)
            switchInputEl.next().text("활성화하기")
        }

        switch (status_val) {
            case 'active':
                $(el).addClass("text-success").text("영업중")
                break;
            case 'inactive':
                $(el).addClass("text-warning").text("영업안함")
                break;
            case 'pending':
                $(el).addClass("text-info").text("승인 대기중")
                break;
            case 'suspending':
                $(el).addClass("text-success").text("영업정지")
                break;
            default:
                $(el).text("...")
        }
    })
})

function changeStatus(store_id) {
    const confirmResult = confirm("정말로 변경하시겠습니까?")
    const statusEl = $(`#store_status_value_${store_id}`)
    const targetEl = $(`#statusSwitch_${store_id}`)
    const targetEl_val = targetEl.val();
    let changed_val = targetEl_val === "active" ? "inactive" : "active"
    if (confirmResult) {
        $.ajax({
            url: "/store/store-status-change-ajax",
            method: "get",
            data: {store_id, status_value: changed_val},
            dataType: "json",
            cache: false,
            success: (resData) => {
                if (resData.success) {
                    $("#infoModal__msg").text("가게 상태를 성공적으로 변경하였습니다.")
                    $("#infoModal").modal("show");

                    statusEl
                        .text(targetEl_val === "active" ? "영업안함" : "영업중")
                        .data("store_status_value", changed_val)

                    targetEl.val(changed_val)

                    if (changed_val === 'active') {
                        statusEl.removeClass('text-warning').addClass("text-success")
                        targetEl.next().text("비활성화하기")
                    } else if (changed_val === 'inactive') {
                        statusEl.removeClass('text-success').addClass("text-warning")
                        targetEl.next().text("활성화하기")
                    }
                }
            },
            error: (req, status, err) => {
                console.log("delete store err : ", err)
            }
        })

    } else {
        targetEl.prop("checked", !targetEl.prop("checked"))
    }
}