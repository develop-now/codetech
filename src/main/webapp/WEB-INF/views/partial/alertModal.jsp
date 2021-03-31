<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/16
  Time: 7:47 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="alertMsg" value="${alert}"/>

<script>
    $(() => {
        const alertMsg = "${alertMsg}"

        if (alertMsg) {
            const alertModal = $("#alertModal")
            alertModal.find("#alertModal__msg").text(alertMsg);
            alertModal.modal("show");
        }
    })
</script>

<!-- alert modal start -->
<div
        class="modal fade"
        id="alertModal"
        tabindex="-1"
        aria-labelledby="alertModalLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-danger" id="alertModalLabel">
                    경고
                </h5>
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-left" id="alertModal__msg">경고메세지</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- alert modal end -->