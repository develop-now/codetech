$(() => {
    console.log("menu list loaded")
})

function loadStoreMenu(store_id, store_name) {
    $.ajax({
        method: "get",
        url: "/menu/menu-list-by-store-ajax",
        data: {store_id},
        dataType: "json",
        cache: false,
        success: (jsonData) => {
            if (jsonData.success) {
                makeMenuTable(jsonData.list, store_name)
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

    $("#target-tbody").append("<tr><td colspan='5' class='text-warning'>해당 매장에 메뉴가 존재하지 않습니다</td></tr>");
}

function makeMenuTable(data, store_name) {
    $("#target-tbody").empty();

    $("#store_name").text(store_name);

    const templateTr = $("#menu_template_tr");
    let count = 1;

    for (let menu of data) {
        let clonedTr = templateTr.clone();
        clonedTr.attr("id", `menu_${menu.menu_id}`).removeClass("d-none");
        clonedTr.find(".menu_count").text(count);
        clonedTr.find(".menu_link").append(`<a href="/menu/menu-read?menu_id=${menu.menu_id}">
                                                ${menu.menu_name}
                                            </a>`)
        clonedTr.find(".menu_price").text(menu.menu_price);
        clonedTr.find(".menu_image").append(`<img src="/resources/upload${menu.menu_saved_image}"
                                        class="img-thumbnail" alt="${menu.menu_original_image}"/>`)

        let td = ""
        switch (menu.menu_status_value) {
            case "active":
                td = `<td class="text-success">판매중</td>`
                break;
            case "inactive":
                td = `<td class="text-warning">판매중지</td>`
                break;
            case "soldout":
                td = `<td class="text-danger">재고없음</td>`
                break;
            default:
                td = `<td>...</td>`
        }

        clonedTr.find(".menu_status").replaceWith(td);

        $("#target-tbody").append(clonedTr);
        count++;
    }
}