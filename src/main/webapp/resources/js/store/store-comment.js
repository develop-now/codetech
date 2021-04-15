let store_id_val
let limit_val = 10;
let search_word_val;
let isSearch_val = false;

let alertModal;
let infoModal;

$(() => {
    alertModal = $("#alertModal")
    infoModal = $("#infoModal")

    $("#SearchBtn").on("click", () => searchAction());
    $("#resetBtn").on("click", () => resetAction());

})

function ajaxCall(url, data, isSearch) {
    $.ajax({
        method: "get",
        url,
        data,
        dataType: "json",
        cache: false,
        success: (jsonData) => {
            if (jsonData.success) {
                makeCommentTable(jsonData)

                if (isSearch) {
                    makeSearchPagination(jsonData)
                } else {
                    makePagination(jsonData)
                }
            } else {
                makeEmptyTable()
            }
        },
        error: (req, status, err) => {
            console.log("get comment list err : ", err)
        }
    })
}

function resetAction() {
    isSearch_val = false;
    search_word_val = "";
    $("#search_value").val("");

    getStoreCommentList(1);
}

function searchAction() {
    const search_value = $("input:text#search_value").val()
    if (!search_value) {
        $("#alertModal__msg").text("검색어를 입력해주세요");
        $("#alertModal").modal("show");
    } else {
        isSearch_val = true;
        search_word_val = search_value;
        getStoreSearchCommentList(1, search_value)
    }
}

function limitChange(change_limit_value) {
    limit_val = change_limit_value;

    if (!isSearch_val) {
        getStoreCommentList(1);
    } else {
        getStoreSearchCommentList(1, search_word_val)
    }
}

// 처음 로딩되거나 가게 리스트를 바꿀때 실행하는  메소드
function loadStoreComment(store_id, store_name) {
    store_id_val = store_id;

    let data = {
        store_id, page: 1, limit: limit_val
    }

    $("#store_name").text(store_name);

    ajaxCall("/comment/comment-list-by-store-ajax", data, false)
}

function getStoreCommentList(page) {
    let data = {
        store_id: store_id_val, page: page, limit: limit_val
    }

    ajaxCall("/comment/comment-list-by-store-ajax", data, false)
}

function getStoreSearchCommentList(page, search_val) {
    let data = {
        store_id: store_id_val, page: page, limit: limit_val, search_val
    }

    ajaxCall("/comment/comment-list-by-store-ajax", data, true)
}

function makeEmptyTable() {
    $("#comment_count").text("0");
    const target = $("#target-tbody")
    target.empty();
    target.append("<tr><td colspan='5' class='text-warning'>해당 매장에 리뷰가 존재하지 않습니다</td></tr>");
}

function commentReply(comment_id) {
    location.href = "/comment/comment-read?comment_id=" + comment_id
}

function makeCommentTable(data) {
    $("#comment_count").text(data.listCount);

    $("#target-tbody").empty();

    const templateTr = $("#comment_template_tr");
    let count = data.listCount - (data.page - 1) * data.limit;

    for (let comment of data.list) {
        let clonedTr = templateTr.clone();
        clonedTr.attr("id", `comment_${comment.comment_id}`).removeClass("d-none");
        clonedTr.find(".comment_count").text(`${count--}`);
        clonedTr.find(".comment_writer").append(comment.comment_writer_value);
        clonedTr.find(".comment_content").text(comment.comment_content.length > 30 ?
            comment.comment_content.substr(0, 30) + "..." : comment.comment_content);
        clonedTr.find(".comment_date").text(comment.created_at.substr(0, 11));

        let disabled = comment.comment_lev === 1 ? "disabled" : "";

        clonedTr.find(".comment_reply").append(`<button class="btn btn-info btn-sm ${disabled}"
onclick="commentReply('${comment.comment_id}')">답변</button>`)

        $("#target-tbody").append(clonedTr);
    }
}

function makeSearchPagination(data) {
    const pagination = $('.pagination');
    pagination.empty();

    let digit = '이전&nbsp;'
    let href = "";

    if (data.page > 1) {
        href = `javascript:getStoreSearchCommentList(${data.page - 1}, '${search_word_val}')`;
    }
    pagination.append(setPaging(href, digit));

    for (let i = data.startPage; i <= data.endPage; i++) {
        digit = i;
        href = "";
        if (i !== data.page) {
            href = `javascript:getStoreSearchCommentList(${i}, '${search_word_val}')`;
        }
        pagination.append(setPaging(href, digit));
    }

    digit = '&nbsp;다음&nbsp;';
    href = "";
    if (data.page < data.maxPage) {
        href = `javascript:getStoreSearchCommentList(${data.page + 1}, '${search_word_val}')`;
    }
    setPaging(href, digit);

    pagination.append(setPaging(href, digit));
}


function makePagination(data) {
    const pagination = $('.pagination');
    pagination.empty();

    let digit = '&nbsp;이전&nbsp;';
    let href = "";

    if (data.page > 1) {
        href = `javascript:getStoreCommentList(${data.page - 1})`
    }

    pagination.append(setPaging(href, digit));

    for (let i = data.startPage; i <= data.endPage; i++) {
        digit = i;
        href = "";
        if (i !== data.page) {
            href = `javascript:getStoreCommentList(${i})`
        }
        pagination.append(setPaging(href, digit));
    }

    digit = '&nbsp;다음&nbsp;';
    href = "";

    if (data.page < data.maxPage) {
        href = `javascript:getStoreCommentList(${data.page + 1})`
    }

    pagination.append(setPaging(href, digit));
}

function setPaging(href, digit) {
    let disabled = ""
    if (!href) {
        disabled = "disabled";
    }

    return $(`<li class="page-item ${disabled}"><a href="${href}" class="page-link">${digit}</a></li>`)
}