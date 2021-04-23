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

import java.util.List;

@Repository
public class OrderCountHandler extends TextWebSocketHandler {
    private static final Logger logger = LoggerFactory.getLogger(OrderCountHandler.class);

    @Autowired
    private StoreService storeService;

    @Autowired
    private OrderService orderService;


    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

    }


    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

    }


    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("[OrderCountHandler] STORE OWNER ID : " + message.getPayload());

        int owner_id = Integer.parseInt(message.getPayload());
        List<Store> stores = storeService.getStoreListByOwner(owner_id);

        if (stores.size() > 0) {
            int store_total_order = 0;

            for (Store s : stores) {
                store_total_order += orderService.getNewOrderCountByStore(s.getStore_id());
            }

            session.sendMessage(new TextMessage(Integer.toString(store_total_order)));
        }
    }
}
