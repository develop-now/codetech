<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
    <script
            src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script
            src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <meta charset='UTF-8'>
    <meta name="robots" content="noindex">
    <link rel="shortcut icon" type="image/x-icon"
          href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico"/>
    <link rel='stylesheet prefetch'
          href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
    <link rel='stylesheet prefetch'
          href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/owner/chat.css">
    <style>
        #frame .content {
            width: 100%
        }

        sup {
            position: relative;
            top: -10px;
            right: -95%;
            font-size: 3px;
        }

        .inout {
            text-align: center;
        }
    </style>
    <title>chatting for store</title>
</head>

<body>
<div id="frame">
    <div class="content">
        <div class="contact-profile">
            <img
                    src="${pageContext.request.contextPath}/upload${store.store_saved_image}"
                    alt="나의 아바타"/>
            <p>${store.store_name}</p>
            <div class="social-media">
                <i class="fa fa-facebook" aria-hidden="true"></i> <i
                    class="fa fa-twitter" aria-hidden="true"></i> <i
                    class="fa fa-instagram" aria-hidden="true"></i>
            </div>
        </div>
        <div class="messages" id="messageTextArea">
            <ul>

            </ul>
        </div>
        <div class="message-input">
            <div class="wrap">
                <input type="text" id="textMessage" onkeydown="return enter()"/>
                <button class="exit" value="Send" onclick="sendMessage()">전송</button>
            </div>
        </div>
    </div>
</div>

<script>
    //ws = new WebSocket("ws://localhost:8088/mychat/boot.do?id=${name}&filename=${filename}");
    var url = "ws://${url}/chatting?id=${store.store_id}&filename=${store.store_saved_image}"
    var webSocket = new WebSocket(url);

    // 콘솔 텍스트 영역
    var messageTextArea = document.getElementById("messageTextArea");

    // 접속이 끊기는 경우는 브라우저를 닫는 경우이기 떄문에 이 이벤트는 의미가 없음.
    webSocket.onclose = function (message) {
    };

    // 서버로부터 메시지 도착
    webSocket.onmessage = function (message) {

        output = '<li class="replies">'
            + '<img src="resources/upload${filename}" alt="" />'
            + '<p></p></li>'
        $(output).appendTo($('.messages ul'));

        $('.messages>ul>li').last().find('p').text(message.data);

        moveScroll();

    };

    // 서버로 메시지를 발송
    function sendMessage() {

        let message = document.getElementById("textMessage");

        output = '<li class="sent">'
            + '<img src="resources/upload${filename}" alt="" />'
            + '<p></p></li>'
        $(output).appendTo($('.messages ul'));

        $('.messages>ul>li').last().find('p').text(message.value);

        webSocket.send(message.value);

        $('.message-input input').val('');

        moveScroll();

    }

    function enter() {
        if (event.keyCode === 13) {
            sendMessage();
            return false;
        }
        return true;
    }

    function moveScroll() {
        $('.messages').scrollTop($('.messages')[0].scrollHeight)
    }
</script>
</body>
</html>