let store_id_val
let date_val;
let total_profit_val = [
    ['날짜', '매출액']
];

let total_menu_val = [
    ['메뉴명', '판매량']
]

let total_count_val = [
    ['날짜', '오더수']
]

$(() => {
    let dateEl = $("#profitCurrentDate")
    dateEl.attr("placeholder", moment().add(-1, "day").format("YYYY/MM/DD"));
    date_val = moment().add(-1, "day").format("YYYYMMDD")

    $("#profitDateSelectBtn").bootstrapMaterialDatePicker({
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
    }).on("change", (e, momentObj) => {
        dateEl.val(momentObj.format("YYYY/MM/DD"))
        date_val = momentObj.format("YYYYMMDD")

        ajaxCall();
    })
})

function makeGraphValue(data) {
    $("#profit__empty").addClass("d-none");
    $("#profit__graph__wrapper").removeClass("d-none")

    let sorted_data_template = {order_total_price: 0, order_total_count: 0}
    let sorted_menu_data = {}
    let sorted_total_data = {}

    for (let profit of data) {
        let key_date = profit.updated_at.substr(5, 5).replace("-", "/")

        if (!sorted_total_data.hasOwnProperty(key_date)) {
            sorted_total_data[key_date] = {...sorted_data_template}
        }

        sorted_total_data[key_date].order_total_price += parseInt(profit.order_total_price)
        sorted_total_data[key_date].order_total_count += 1

        let menu_split_arr = profit.menu_list.split(",")

        for (let menu of menu_split_arr) {
            if (!sorted_menu_data.hasOwnProperty(menu.trim())) {
                sorted_menu_data[menu.trim()] = 1
            } else {
                sorted_menu_data[menu.trim()] += 1
            }
        }
    }


    let new_total_menu_val = [['메뉴명', '판매량']]
    for (let key in sorted_menu_data) {
        new_total_menu_val.push([key, sorted_menu_data[key]])
    }
    total_menu_val = new_total_menu_val

    let new_total_profit_val = [['날짜', '매출액']]
    let new_total_count_val = [['날짜', '오더수']]

    for (let key in sorted_total_data) {
        new_total_profit_val.push([key, sorted_total_data[key].order_total_price])
        new_total_count_val.push([key, sorted_total_data[key].order_total_count])
    }

    total_profit_val = new_total_profit_val
    total_count_val = new_total_count_val

    loadChart()

}

function makeEmptyProfitChart() {
    $("#profit__empty").removeClass("d-none");
    $("#profit__graph__wrapper").addClass("d-none")
}

function ajaxCall() {
    $.ajax({
        method: "get",
        url: "/store/profit-list-ajax",
        data: {store_id: store_id_val, selected_date: date_val},
        dataType: "json",
        cache: false,
        success: (jsonData) => {
            if (jsonData.success) {
                makeGraphValue(jsonData.list)
            } else {
                makeEmptyProfitChart()
            }
        },
        error: (req, status, err) => {
            console.log("get profit list err : ", err)
        },
        complete: () => {
            let startDate = moment(date_val, "YYYYMMDD").add(-3, "day").format("YYYY/MM/DD")
            let endDate = moment(date_val, "YYYYMMDD").add(3, "day").format("YYYY/MM/DD")

            $("#profit_date").text(`${startDate} ~ ${endDate}`)
        }
    })
}

function loadStoreProfit(store_id, store_name) {
    $("#store_name").text(store_name);
    store_id_val = store_id;

    ajaxCall()
}

function loadChart() {
    google.charts.load('current', {'packages': ['corechart']});

    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        const animation_option = {
            startup: true,
            duration: 1000,
            easing: "out"
        };

        google.charts.load('current', {'packages': ['corechart']});

        google.charts.setOnLoadCallback(lineChart);
        google.charts.setOnLoadCallback(pieChart);
        google.charts.setOnLoadCallback(columnChart);


        function lineChart() {
            let data = google.visualization.arrayToDataTable(total_profit_val);

            let options = {
                height: 500,
                animation: animation_option
            };

            let chart = new google.visualization.LineChart(document.getElementById('chart_1'));

            chart.draw(data, options);
        }

        function pieChart() {
            let data = new google.visualization.arrayToDataTable(total_menu_val);

            let options = {
                is3D: true, height: 500, animation: animation_option
            };

            let chart = new google.visualization.PieChart(document.getElementById('chart_2'));
            chart.draw(data, options);
        }

        function columnChart() {
            let data = new google.visualization.arrayToDataTable(total_count_val);

            let options = {
                legend: {position: 'none'},
                chart: {},
                axes: {
                    x: {
                        0: {side: 'top', label: 'White to move'}
                    }
                },
                bar: {groupWidth: "90%"},
                height: 500,
                animation: animation_option
            };

            let chart = new google.visualization.ColumnChart(document.getElementById('chart_3'));
            chart.draw(data, options);
        }
    }
}

$(window).resize(function () {
    loadChart();
});
