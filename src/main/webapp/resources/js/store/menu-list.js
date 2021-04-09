$(() => {
    console.log("menu list loaded")
})

function changeStore(storeName) {
    console.log("storeName : ", storeName)
    $(".store-menu__wrapper").each((idx, el) => {
        if (storeName === "view_all_store") {
            $(el).removeClass("d-none")
        } else {
            if ($(el).attr("id") !== storeName) {
                $(el).addClass("d-none").removeClass("d-block")
            } else {
                $(el).addClass("d-block").removeClass("d-none")
            }
        }
    })
}