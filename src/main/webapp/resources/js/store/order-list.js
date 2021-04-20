let store_id_val = 0;
let date_val;
let status_id_val = 0;
let order_key_val = "order_date"
let page_val = 1;
let order_total_count = 0;

$(() => {
    $("#loadMoreBtn").on("click", () => loadMoreOrder())
    $("#updateOrder").on("click", () => updateAction())

    let dateEl = $("#orderCurrentDate")
    dateEl.attr("placeholder", moment().format("YYYY/MM/DD"));
    date_val = moment().format("YYYYMMDD")

    $("#orderDateSelectBtn").bootstrapMaterialDatePicker({
        format: 'YYYY/MM/DD',
        year: true,
        date: true,
        time: false,
        nowButton: true,
        minDate: moment("20200101", "YYYYMMDD"),
        maxDate: moment(),
        nowText: "오늘",
        cancelText: "닫기",
        okText: "선택"
    }).on("change", (e, val) => {
        dateEl.val(val.format("YYYY/MM/DD"))
        date_val = val.format("YYYYMMDD")

        ajaxCall();
    })

    $("input:radio#order_all").on("change", function () {
        status_id_val = $(this).val();
        ajaxCall()
    })

    $("input:radio[name='customer_order_key']").on("change", function () {
        order_key_val = $(this).val();
        ajaxCall()
    })
})

function statusLabel(prevText, status, nextText) {
    let label_str = ""
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

function makeStatusInModal(data) {
    let targetElinModal = $("#status_target_in_modal");
    let templateEl = $(".status_template_in_modal");

    for (let status of data) {
        let clonedEl = templateEl.clone();
        clonedEl.removeClass("status_template_in_modal").removeClass("d-none");
        clonedEl.find("input").attr("id", `status_in_modal_${status.order_status_id}`)
            .attr("checked", false).val(status.order_status_id)
        clonedEl.find("label").attr("for", `status_in_modal_${status.order_status_id}`).text(statusLabel("주문 ", status.status_value, ""));

        targetElinModal.append(clonedEl)
    }

}

function makeStatusInput(data) {
    let targetEl = $("#status_target");
    let templateEl = $(".status_template");

    for (let status of data) {
        let clonedEl = templateEl.clone();
        clonedEl.removeClass("status_template");
        clonedEl.find("input").attr("id", status.status_value)
            .attr("checked", false).val(status.order_status_id).on("change", function () {
            status_id_val = $(this).val();
            ajaxCall()
        })
        clonedEl.find("label").attr("for", status.status_value).text(statusLabel("주문 ", status.status_value, "만 보기"));

        targetEl.append(clonedEl)
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
                makeStatusInput(jsonData.list)
                makeStatusInModal(jsonData.list)
            }
        },
        error: (req, status, err) => {
            console.log("get status list err : ", err)
        }
    })
}

function loadMoreOrder() {
    page_val++;

    ajaxCall();
}

function resetAction() {
    store_id_val = 0;
    status_id_val = 0
    $("input#order_all").attr("checked", true)
    order_key_val = "order_date"
    $("input#order_date").attr("checked", true)
    page_val = 1;
    order_total_count = 0;
}

function loadStoreOrder(store_id, store_name) {
    resetAction()

    $("#store_name").text(store_name);

    store_id_val = store_id;

    ajaxCall();
}

function makeEmptyTable() {
    $("#order_count").text("0");
    const target = $("#target-tbody")
    target.empty();
    target.append("<tr><td colspan='6' class='text-warning'>해당 매장에 주문이 존재하지 않습니다</td></tr>");
}

function makeLoadMoreBtn() {
    let customer_count = $("tbody tr").length
    const loadMoreWrapper = $("#loadMore--wrapper");
    const loadMoreBtn = $("#loadMoreBtn");

    if (order_total_count > customer_count) {
        loadMoreWrapper.removeClass("d-none")
        loadMoreBtn.attr("disabled", false)
    } else {
        loadMoreWrapper.addClass("d-none")
        loadMoreBtn.attr("disabled", true)
    }
}

function makeOrderTable(data) {
    order_total_count = data.listCount;
    $("#order_count").text(data.listCount);
    $("#target-tbody").empty();

    const templateTr = $("#order_template_tr");
    let count = data.listCount;

    for (let order of data.list) {
        let clonedTr = templateTr.clone();
        clonedTr.attr("id", `order_${order.order_id}`).removeClass("d-none");
        clonedTr.find(".order_count").text(`${count--}`);
        clonedTr.find(".order_id").text(order.order_id);
        clonedTr.find(".order_user").text(order.order_user_name);
        clonedTr.find(".order_date").text(order.created_at.substr(0, 19));
        clonedTr.find(".order_status").text(statusLabel("", order.order_status_value, ""));
        clonedTr.find(".order_action").append(`<button class="btn btn-sm btn-info" onclick="orderStatusChange('${order.order_id}', '${order.order_status}')">변경</button>`);
        clonedTr.find(".order_read").append(`<a role="button" class="btn btn-sm btn-primary" href="/order/order-read?order_id=${order.order_id}">보기</a>`);

        $("#target-tbody").append(clonedTr);
    }

    makeLoadMoreBtn()
}

function orderRead(order_id) {
    console.log("read order" + order_id)
}

function updateAction() {
    const header = $("meta[name='_csrf_header']").attr('content');
    const token = $("meta[name='_csrf']").attr('content');

    const prev_val = $("#orderUpdateForm input#prev_status_id").val()
    const selected_val = $("input:radio[name='order_change_status']:checked").val()
    const order_id = $("input[name='order_id']").val()

    if (prev_val === selected_val) {
        $("#alertModal__msg").text("같은 상태값을 입력할 수 없습니다")

        $("#statusChangeModal").modal("hide")
        $("#alertModal").modal("show");
    } else {
        $.ajax({
            url: "/order/updateAction",
            method: "post",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {order_id, status_id: selected_val},
            dataType: "json",
            success: (jsonData) => {
                if (jsonData.success) {
                    $("#infoModal__msg").text("상태 변경 업데이트 완료")

                    $("#statusChangeModal").modal("hide")
                    $("#infoModal").modal("show");
                }
            },
            error: (req, status, err) => {
                console.log("order update action err : ", err)
            },
            complete: () => {
                ajaxCall()
            }
        })
    }
}

function orderStatusChange(order_id, status_id) {
    $("#orderUpdateForm input#order_id").val(order_id)
    $("#orderUpdateForm input#prev_status_id").val(status_id)
    $("#orderUpdateForm input[name='order_id']").val(order_id)

    $("#orderUpdateForm input:radio[name='order_change_status']").each((idx, el) => {
        if ($(el).val() < status_id) {
            $(el).prop("disabled", true)
        } else if ($(el).val() === status_id) {
            $(el).prop("checked", true)
            $(el).prop("disabled", true)
        } else {
            $(el).prop("checked", false)
            $(el).prop("disabled", false)
        }
    })

    $("#statusChangeModal").modal("show")
}

function ajaxCall() {
    let data = {
        store_id: store_id_val,
        selected_date: date_val,
        status_id: status_id_val,
        order_key: order_key_val,
        page: page_val
    }

    $.ajax({
        method: "get",
        url: "/order/order-list-ajax",
        data,
        dataType: "json",
        cache: false,
        success: (jsonData) => {
            if (jsonData.success) {
                makeOrderTable(jsonData)
            } else {
                makeEmptyTable()
            }
        },
        error: (req, status, err) => {
            console.log("get order list err : ", err)
        }
    })
}