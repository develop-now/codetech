package com.codetech.www.domain;

public class MailVO {

	private String from = "codetechhta@naver.com";
	private String to;
	private String subject = "커피테크입니다. ";
	private String content = "커피테크입니다. ";

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
