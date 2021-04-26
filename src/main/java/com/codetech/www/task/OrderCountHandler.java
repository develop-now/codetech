package com.codetech.www.task;

import com.codetech.www.domain.Store;
import com.codetech.www.service.OrderService;
import com.codetech.www.service.StoreService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Repository
public class OrderCountHandler extends TextWebSocketHandler {
    private static final Logger logger = LoggerFactory.getLogger(OrderCountHandler.class);


    List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
    Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();


    @Autowired
    private StoreService storeService;

    @Autowired
    private OrderService orderService;

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        logger.error(session.getId() + " 에러 발생: " + exception.getMessage());
    }


    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String senderId = getMemberId(session);
        if (senderId != null) { // 로그인 값이 있는 경우만
            logger.info(senderId + " 연결 종료됨");
            users.remove(senderId);
            sessions.remove(session);
        }
    }

    private String getMemberId(WebSocketSession session) {
        Map<String, Object> httpSession = session.getAttributes();
        return (String) httpSession.get("user_idS");
    }


    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String senderId = getMemberId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
        if (senderId != null) { // 로그인 값이 있는 경우만
            logger.info(senderId + " 연결 됨");
            users.put(senderId, session); // 로그인중 개별유저 저장
        }
    }


    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String senderId = getMemberId(session);
        String target = message.getPayload();
        logger.info("socket target: "+ target);
        WebSocketSession targetSession = users.get(target);
        logger.info("socket targetSession: "+ targetSession);

        logger.info("[OrderCountHandler] STORE OWNER ID : " + message.getPayload());

        int owner_id = Integer.parseInt(message.getPayload());
        List<Store> stores = storeService.getStoreListByOwner(owner_id);

        int store_total_order = 0;

        if (stores.size() > 0 && targetSession != null) {
            for (Store s : stores) {
                store_total_order += orderService.getNewOrderCountByStore(s.getStore_id());
            }

            TextMessage tmpMsg = new TextMessage(Integer.toString(store_total_order));
            targetSession.sendMessage(tmpMsg);
            logger.info("## ORDER COUNT MESSAGE SEND!");
        }

    }
}
