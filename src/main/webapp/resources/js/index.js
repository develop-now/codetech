$(() => {
    $("#logoutBtn").on("click", (e) => {
        e.preventDefault();
        $("#logoutForm").submit()
    })
})