$(() => {
    if ($(".card").length > 1)
        $("#replyModalOpenBtn").attr("disabled", true).addClass("disabled")

    $("#replyModalOpenBtn").on("click", () => {
        $("#replyModal").modal("show")
    })

    $("#replySubmit").on("click", (e) => {
        e.preventDefault();

        let replyEl = $("#comment_content")

        if (!replyEl.val()) {
            replyEl.addClass("is-invalid")
        } else {
            replyEl.removeClass("is-invalid")

            $("#replyForm").submit()
        }

    })
})

function updateComment(comment_id) {
    console.log("update comment : " + comment_id)
}

function deleteComment(comment_id) {
    console.log("delete comment : " + comment_id)
}