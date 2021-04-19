package com.codetech.www.domain;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int      notice_id;       		// 글번호
	private int		 notice_status;			// 공지/이벤트/점검
	
	private String   notice_subject;
	private String   notice_content;

	private int      notice_readcount;		//글의 조회수

	private MultipartFile uploadfile;
	
	private String notice_saved_image; 		// 첨부될 파일의 이름
	private String notice_original_image;	// 첨부될 파일의 이름
	
	private String   notice_date;

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public int getNotice_status() {
		return notice_status;
	}

	public void setNotice_status(int notice_status) {
		this.notice_status = notice_status;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public int getNotice_readcount() {
		return notice_readcount;
	}

	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getNotice_saved_image() {
		return notice_saved_image;
	}

	public void setNotice_saved_image(String notice_saved_image) {
		this.notice_saved_image = notice_saved_image;
	}

	public String getNotice_original_image() {
		return notice_original_image;
	}

	public void setNotice_original_image(String notice_original_image) {
		this.notice_original_image = notice_original_image;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
}
