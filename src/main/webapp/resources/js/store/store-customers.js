let page_val = 1;
let customer_total_count = 0;
let order_key_val = "order_count"
let store_id_val;

$(() => {
    $("#loadMoreBtn").on("click", () => loadMoreComment())
    $("input:radio").each((idx, el) => {
        $(el).on("change", function () {
            order_key_val = this.value

            let data = {
                store_id: store_id_val, page: page_val, order_key: order_key_val
            }

            ajaxCall("/store/customer-list-ajax", data)
        })
    })
})

function loadMoreComment() {
    page_val++;

    let data = {
        store_id: store_id_val, page: page_val, order_key: order_key_val
    }
    ajaxCall("/store/customer-list-ajax", data)
}

function ajaxCall(url, data) {
    $.ajax({
        method: "get",
        url,
        data,
        dataType: "json",
        cache: false,
        success: (jsonData) => {
            if (jsonData.success) {
                makeCustomerTable(jsonData)
            } else {
                makeEmptyTable()
            }
        },
        error: (req, status, err) => {
            console.log("get customer list err : ", err)
        }
    })
}

function loadStoreCustomer(store_id, store_name) {
    store_id_val = store_id;
    page_val = 1;

    let data = {
        store_id, page: page_val, order_key: order_key_val
    }

    $("#store_name").text(store_name);

    ajaxCall("/store/customer-list-ajax", data)
}

function makeCustomerTable(data) {
    customer_total_count = data.listCount;

    $("#customer_count").text(data.listCount);

    $("#target-tbody").empty();

    const templateTr = $("#customer_template_tr");

    let count = data.listCount;

    for (let customer of data.list) {
        let clonedTr = templateTr.clone();
        clonedTr.attr("id", `customer_${customer.customer_id}`).removeClass("d-none");
        clonedTr.find(".customer_count").text(`${count--}`);
        clonedTr.find(".customer_name").append(customer.customer_name);
        clonedTr.find(".customer_order_count").append(customer.order_count);

        $("#target-tbody").append(clonedTr);
    }

    makeLoadMoreBtn()
}

function makeEmptyTable() {
    $("#customer_count").text("0");
    const target = $("#target-tbody")
    target.empty();
    target.append("<tr><td colspan='3' class='text-warning'>해당 매장에 단골이 존재하지 않습니다</td></tr>");
}

function makeLoadMoreBtn() {
    let customer_count = $("tbody tr").length
    const loadMoreWrapper = $("#loadMore--wrapper");
    const loadMoreBtn = $("#loadMoreBtn");

    if (customer_total_count > customer_count) {
        loadMoreWrapper.removeClass("d-none")
        loadMoreBtn.attr("disabled", false)
    } else {
        loadMoreWrapper.addClass("d-none")
        loadMoreBtn.attr("disabled", true)
    }
}