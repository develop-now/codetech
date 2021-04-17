$(() => {
    if ($(".comment__action__wrapper").length >= 1)
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
    $(`#updateModal_${comment_id}`).modal("show");
}

function deleteComment(comment_id) {
    $(`#deleteModal_${comment_id}`).modal("show");
}

function submitUpdate(comment_id) {
    let updateEl = $(`#update_comment_content_${comment_id}`)

    if (!updateEl.val()) {
        updateEl.addClass("is-invalid")
    } else {
        updateEl.removeClass("is-invalid")

        $(`#updateForm_${comment_id}`).submit()
    }

}

function submitDelete(comment_id) {
    const confirmResult = confirm("정말로 삭제 하시겠습니까?")

    if (confirmResult) {
        $(`#deleteForm_${comment_id}`).submit()
    }
}