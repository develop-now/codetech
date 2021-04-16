let store_id_val;

$(() => {
    let dateEl = $("#orderCurrentDate")
    dateEl.attr("placeholder", moment().format("YYYY/MM/DD"));
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
    })
})

function loadStoreOrder(store_id, store_name) {
    store_id_val = store_id;
    console.log({store_id})

    $("#store_name").text(store_name);
}