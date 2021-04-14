package com.codetech.www.task;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.codetech.www.domain.Cart;

import oracle.jdbc.proxy.annotation.OnError;


@Controller
@ServerEndpoint(value = "/chatting") 
public class EchoHandler {
	
	public static final List<Cart> sessionList = new ArrayList<Cart>();
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	public EchoHandler() {
		logger.info("웹소켓(서버) 개체생성");
	}

	/*
	 * @OnOpen는 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어왔을 때 실행하는 메소드 입니다.
	 * 
	 * javax.websocket.Session: 접속자마다 한개의 세션이 생성되어 데이터 통신수단으로 사용되며 접속자마다 구분됩니다.
	 */

	@OnOpen
	public void onOpen2(Session session) {
		logger.info("Open session id:" + session.getId());
		logger.info("session 쿼리 스트링 : " + session.getQueryString());
		
		//id=admin&filename=/2020-1-6-/bbs2020163195410.png
		String queryString = session.getQueryString();
		String id=queryString.substring(queryString.indexOf("=")+1, queryString.indexOf("&"));
		String filename = queryString.substring(queryString.indexOf("/"));
		Cart cart = new Cart();
		cart.setSession(session);
		cart.setFilename(filename);
		cart.setId(id);
		sessionList.add(cart);
		
		String message = id + "님이 입장하셨습니다.in";
		sendAllSessionToMessage(session, message);
	}
	
	
	//보낸 사람 정보(id와 파일 이름) 구하기
	private String getinfo(Session self) {
		String information = "";
		synchronized (sessionList) {
			for(Cart cart : EchoHandler.sessionList) {
				Session s = cart.getSession();
				if(self.getId().equals(s.getId())) {
					information = cart.getId() + "&" + cart.getFilename();
					//보낸 사람의 정보 : 1234&2019-7-6/bbs201932423.png
					logger.info("보낸 사람의 정보 = " + information);
					break;
				}
			}
		} //synchronized end
		return information;
	}

	private void sendAllSessionToMessage(Session self, String message) {
		String info = getinfo(self);
		
		synchronized (sessionList) {
			try {
				for (Cart cart : EchoHandler.sessionList) {
					Session s = cart.getSession();
					if (!self.getId().equals(s.getId())) { //나를 제외한 사람에게 보냅니다.
						//admin&2019-7-6/bbs2019823472.png&admin님이 들어오셨습니다.
						logger.info("나를 제외한 모든 사람에게 보내는 메시지 : " + info + "&" + message);
						s.getBasicRemote().sendText(info + "&" + message);
					}
				}
			} catch (Exception e) {
				logger.info("sendAllSessionToMessage 오류 " + e.getMessage());
			}
			
		} //synchronized

	}

	/*
	 * @OnMessage는 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드입니다.
	 */

	@OnMessage
	public void onMessage(String message, Session session) {
		logger.info("Message : " + message);
		sendAllSessionToMessage(session, message);
	
	}

	@OnError
	public void onError(Throwable e, Session session) {
		e.printStackTrace();
		logger.info("error입니다");
		remove(session); 
	}

	// @OnClose는 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드입니다.
	 @OnClose
	public void onClose(Session session) {
		logger.info("Session " + session.getId() + " has ended");
		sessionList.remove(session);
	}
	 
	 private void remove(Session session) {
		 synchronized (sessionList) {
			 for(int i = 0; i < sessionList.size(); i++) {
				 Session s = sessionList.get(i).getSession();
				 if(session.getId().contentEquals(s.getId()) ) { //나와 세션 아이디가 같은 cart를 제거합니다.
					 sessionList.remove(i);
					 return;
				 }
			 }
		 }
	 }
}
