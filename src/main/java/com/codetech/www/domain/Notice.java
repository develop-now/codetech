package com.codetech.www.domain;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int      NOTICE_BOARD_NUM;       //글번호
	private int		 NOTICE_BOARD_FORM;
	
	private String   NOTICE_BOARD_NAME;
	private String   NOTICE_BOARD_SUBJECT;
	private String   NOTICE_BOARD_CONTENT;

	private int      NOTICE_BOARD_READCOUNT; //글의 조회수

	private MultipartFile uploadfile;
	
	private String   NOTICE_BOARD_FILE;      //첨부될 파일의 이름
	private String 	 NOTICE_BOARD_ORIGINAL;  // 첨부될 파일의 이름
	
	private String   NOTICE_BOARD_DATE;

	public int getNOTICE_BOARD_NUM() {
		return NOTICE_BOARD_NUM;
	}

	public void setNOTICE_BOARD_NUM(int nOTICE_BOARD_NUM) {
		NOTICE_BOARD_NUM = nOTICE_BOARD_NUM;
	}

	public int getNOTICE_BOARD_FORM() {
		return NOTICE_BOARD_FORM;
	}

	public void setNOTICE_BOARD_FORM(int nOTICE_BOARD_FORM) {
		NOTICE_BOARD_FORM = nOTICE_BOARD_FORM;
	}

	public String getNOTICE_BOARD_NAME() {
		return NOTICE_BOARD_NAME;
	}

	public void setNOTICE_BOARD_NAME(String nOTICE_BOARD_NAME) {
		NOTICE_BOARD_NAME = nOTICE_BOARD_NAME;
	}

	public String getNOTICE_BOARD_SUBJECT() {
		return NOTICE_BOARD_SUBJECT;
	}

	public void setNOTICE_BOARD_SUBJECT(String nOTICE_BOARD_SUBJECT) {
		NOTICE_BOARD_SUBJECT = nOTICE_BOARD_SUBJECT;
	}

	public String getNOTICE_BOARD_CONTENT() {
		return NOTICE_BOARD_CONTENT;
	}

	public void setNOTICE_BOARD_CONTENT(String nOTICE_BOARD_CONTENT) {
		NOTICE_BOARD_CONTENT = nOTICE_BOARD_CONTENT;
	}

	public int getNOTICE_BOARD_READCOUNT() {
		return NOTICE_BOARD_READCOUNT;
	}

	public void setNOTICE_BOARD_READCOUNT(int nOTICE_BOARD_READCOUNT) {
		NOTICE_BOARD_READCOUNT = nOTICE_BOARD_READCOUNT;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getNOTICE_BOARD_FILE() {
		return NOTICE_BOARD_FILE;
	}

	public void setNOTICE_BOARD_FILE(String nOTICE_BOARD_FILE) {
		NOTICE_BOARD_FILE = nOTICE_BOARD_FILE;
	}

	public String getNOTICE_BOARD_ORIGINAL() {
		return NOTICE_BOARD_ORIGINAL;
	}

	public void setNOTICE_BOARD_ORIGINAL(String nOTICE_BOARD_ORIGINAL) {
		NOTICE_BOARD_ORIGINAL = nOTICE_BOARD_ORIGINAL;
	}

	public String getNOTICE_BOARD_DATE() {
		return NOTICE_BOARD_DATE;
	}

	public void setNOTICE_BOARD_DATE(String nOTICE_BOARD_DATE) {
		NOTICE_BOARD_DATE = nOTICE_BOARD_DATE;
	}
}
