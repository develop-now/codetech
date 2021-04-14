$(() => {
    console.log("staff list loaded")
})

function loadStoreStaff(store_id, store_name) {
    $.ajax({
        method: "get",
        url: "/store/staff-list-by-store-ajax",
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
            console.log("get menu list err : ", err)
        }
    })
}

function makeEmptyTable(store_name) {
    $("#target-tbody").empty();

    $("#store_name").text(store_name);

    $("#target-tbody").append("<tr><td colspan='4' class='text-warning'>해당 매장에 직원이 존재하지 않습니다</td></tr>");
}

function expireStaff(staff_id) {
    console.log("staff_id : ", staff_id)
}

function makeStaffTable(data, store_name) {
    $("#target-tbody").empty();

    $("#store_name").text(store_name);

    const templateTr = $("#staff_template_tr");
    let count = 1;

    for (let staff of data) {
        console.log({staff})
        let clonedTr = templateTr.clone();
        clonedTr.attr("id", `staff_${staff.user_id}`).removeClass("d-none");
        clonedTr.find(".staff_count").text(count);
        clonedTr.find(".staff_name").append(`<a href="/staff/staff-read?menu_id=${staff.user_id}">
                                                ${staff.user_name}
                                            </a>`)
        clonedTr.find(".staff_date").text(staff.created_at);
        clonedTr.find(".staff_expire").append(`<button class="btn btn-danger btn-danger btn-sm"
onclick="expireStaff('${staff.user_id}')">해고</button>`)

        $("#target-tbody").append(clonedTr);
        count++;
    }
}