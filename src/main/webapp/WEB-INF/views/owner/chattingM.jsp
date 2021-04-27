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
        /* 여러 채팅창 간의 간격과 배열 위치*/
        .float-left {
            float: left;
            margin: 5px;
        }

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
</head>
<body>
<!-- 유저가 접속할 때마다 이 템플릿으로 채팅창을 생성한다. -->
<div class="template" style="display: none">
    <div id="frame">
        <div class="content">
            <div class="contact-profile">
                <img
                        src="${pageContext.request.contextPath}/upload${admin.user_profile}"
                        alt="나의 아바타"/>
                <p>${admin.user_name}</p>
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
                    <input type="text" id="textMessage"
                           onkeydown="if(event.keyCode === 13) return false;">
                    <button class="sendBtn" value="Send">전송</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // 서버의 admin의 서블릿으로 웹 소켓을 한다.
    var url = "ws://${url}/admin"
    var webSocket = new WebSocket(url);
    // 운영자에서의 open, close, error는 의미가 없어서 형태만 선언
    webSocket.onopen = function (message) {
    };
    webSocket.onclose = function (message) {
    };
    webSocket.onerror = function (message) {
    };

    // 서버로 부터 메시지가 오면
    webSocket.onmessage = function (message) {
        // 메시지의 구조는 JSON 형태로 만들었다.
        let node = JSON.parse(message.data);
        // 메시지의 status는 유저의 접속 형태이다.
        // visit은 유저가 접속했을 때 알리는 메시지다.
        if (node.status === "visit") {

        	// 위 템플릿 div를 취득한다.
            let form = $(".template").html();
            // div를 감싸고 속성 data-key에 unique키를 넣는다.
            form = $("<div class='float-left'></div>").attr("data-key",
                node.key).append(form);
            // body에 추가한다.
            $("body").append(form);
            // message는 유저가 메시지를 보낼 때 알려주는 메시지이다.
        } else if (node.status === "message") {
        	
            // key로 해당 div영역을 찾는다.
            let $div = $("[data-key='" + node.key + "']");

            output = '<li class="replies">'
                + '<img src="resources/upload${filename}" alt="" />'
                + '<p></p></li>'
            $(output).appendTo($('.messages ul'));

            //입력한 내용들을 문자열로 변환하기 위해 text()를 이용합니다.
            $('.messages>ul>li').last().find('p').text(node.message);

            // console영역을 찾는다.
            //let log = $div.find(".console").val();
            // 아래에 메시지를 추가한다.
            //$div.find(".console").val(
            //log + "(user) => " + node.message + "\n");

            // bye는 유저가 접속을 끊었을 때 알려주는 메시지이다.
            moveScroll();
            
        } else if (node.status === "bye") {
            // 해당 키로 div를 찾아서 dom을 제거한다.
            $("[data-key='" + node.key + "']").remove();
        }
        
    };

    // 전송 버튼을 클릭하면 발생하는 이벤트

    $(document)
        .on(
            "click",
            ".sendBtn",
            function () {
                // div 태그를 찾는다.
                let $div = $(this).closest(".float-left");
                // 메시지 텍스트 박스를 찾아서 값을 취득한다.
                let message = $div.find("#textMessage").val();
                // 유저 key를 취득한다.
                let key = $div.data("key");

                output = '<li class="sent">'
                    + '<img src="resources/upload${filename}" alt="" />'
                    + '<p></p></li>'
                $(output).appendTo($('.messages ul'));

                //입력한 내용들을 문자열로 변환하기 위해 text()를 이용합니다.
                $('.messages>ul>li').last().find('p').text(message);

                // console영역을 찾는다.
                //let log = $div.find(".console").val();
                // 아래에 메시지를 추가한다.
                //$div.find(".console").val(log + "(me) => " + message + "\n");
                // 텍스트 박스의 값을 초기화 한다.
                $div.find("#textMessage").val("");
                // 웹소켓으로 메시지를 보낸다.
                webSocket.send(key + "#####" + message);
                
                moveScroll();
            });

    // 텍스트 박스에서 엔터키를 누르면
    $(document).on(
        "keydown",
        "#textMessage",
        function () {
            // keyCode 13은 엔터이다.
            if (event.keyCode === 13) {
                // 버튼을 클릭하는 트리거를 발생한다.
                $(this).closest(".float-left").find(".sendBtn")
                    .trigger("click");
                // form에 의해 자동 submit을 막는다.
                return false;
                
            }
            moveScroll();
            return true;
        });

    function moveScroll() {
        $('.messages').scrollTop($('.messages')[0].scrollHeight)
    }


</script>
</body>
</html>