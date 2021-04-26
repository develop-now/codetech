<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/22
  Time: 9:28 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="login_id_for_ws" value="${user_id}" scope="session"/>
<c:set var="role_value_for_ws" value="${role}" scope="session"/>

<%
    int end = request.getRequestURL().indexOf("/", 7);
    String requestURL = request.getRequestURL().substring(7, end);
%>
<input type="hidden" name="url_value" id="url_value" value="<%=requestURL%>">

<script>
    let order_count_ws;

    $(() => {
        onOrderCountSocketOpen();
    })

    function onOrderCountSocketOpen() {
        console.log("order count socket running...");

        const url = $("#url_value").val();
        const ws_url = "ws://" + url + "/order-count"
        order_count_ws = new WebSocket(ws_url);

        order_count_ws.onopen = function () {
            const role = "${role_value_for_ws}";
            const id = "${login_id_for_ws}"
            if (role === "ROLE_STORE_OWNER")
                sendOrderNotification(id)
        }

        order_count_ws.onmessage = function (e) {
            console.log("오더 카운트 소켓 데이터 받음")
            $("#order_count_badge").text(e.data)
        }

        order_count_ws.onerror = function () {

        }
    }

    function sendOrderNotification(owner_id) {
        console.log("가게 주인용 소켓 발송!!!")

        order_count_ws.send(owner_id);
    }
</script>