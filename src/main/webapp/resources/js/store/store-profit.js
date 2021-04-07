$(() => {
    let dateEl = $("#profitCurrentDate")
    dateEl.attr("placeholder", moment().add(-1, "day").format("YYYY/MM/DD"));

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
    }).on("change", (e, val) => {
        dateEl.val(val.format("YYYY/MM/DD"))
    })

    loadChart()
})

function loadChart() {
    google.charts.load('current', {'packages': ['corechart']});

    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        // Load Charts and the corechart package.
        google.charts.load('current', {'packages': ['corechart']});

        google.charts.setOnLoadCallback(lineChart);
        google.charts.setOnLoadCallback(pieChart);
        google.charts.setOnLoadCallback(columnChart);

        function lineChart() {
            let data = google.visualization.arrayToDataTable([
                ['날짜', '매출액'],
                ["4/2", 440000],
                ["4/3", 310000],
                ["4/4", 550000],
                ["4/5", 980000],
                ["4/6", 100000],
                ["4/7", 100000],
                ['4/8', 30000]
            ]);

            let options = {
                height: 500
            };

            let chart = new google.visualization.LineChart(document.getElementById('chart_1'));

            chart.draw(data, options);
        }

        function pieChart() {
            let data = new google.visualization.arrayToDataTable([
                ['메뉴명', '판매량'],
                ['메뉴1', 11],
                ['메뉴2', 22],
                ['메뉴3', 12],
                ['메뉴4', 22],
                ['메뉴5', 75],
                ['메뉴6', 11],
                ['메뉴7', 32],
                ['메뉴8', 2],
                ['메뉴9', 2],
                ['메뉴10', 7],
            ]);

            let options = {is3D: true, height: 500};

            let chart = new google.visualization.PieChart(document.getElementById('chart_2'));
            chart.draw(data, options);
        }

        function columnChart() {
            let data = new google.visualization.arrayToDataTable([
                ['날짜', '오더수'],
                ["4/2", 44],
                ["4/3", 31],
                ["4/4", 55],
                ["4/5", 98],
                ["4/6", 10],
                ["4/7", 10],
                ['4/8', 3]
            ]);

            let options = {
                legend: {position: 'none'},
                chart: {},
                axes: {
                    x: {
                        0: {side: 'top', label: 'White to move'}
                    }
                },
                bar: {groupWidth: "90%"},
                height: 500
            };

            let chart = new google.visualization.ColumnChart(document.getElementById('chart_3'));
            chart.draw(data, options);
        }
    }
}

$(window).resize(function () {
    loadChart();
});
