<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/16
  Time: 7:48 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="infoMsg" value="${info}"/>

<script>
    $(() => {
        const infoMsg = "${infoMsg}"

        if (infoMsg) {
            const infoModal = $("#infoModal")
            infoModal.find("#infoModal__msg").text(infoMsg);
            infoModal.modal("show");
        }
    })
</script>
<!-- info modal start -->
<div
        class="modal fade"
        id="infoModal"
        tabindex="-1"
        aria-labelledby="infoModalLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-info" id="infoModalLabel">
                    정보
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
                <p class="text-left" id="infoModal__msg">정보 메세지</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- info modal end -->