package com.codetech.www.domain;

public class Report {
	/*common report table*/
	private String report_subject;
	private String report_content;
	private String created_at;
	private String updated_at;
	private int report_status;
	private int reporter;
	private String store_name;
	private String user_name;
	
	/*store_report*/
	private int store_report_id;
	private int reported_store;
	
	/*user_report*/
	private int user_report_id;
	private int reported_user;
	
	
	
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getReport_subject() {
		return report_subject;
	}
	public void setReport_subject(String report_subject) {
		this.report_subject = report_subject;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at.substring(0, 10);
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	public int getReport_status() {
		return report_status;
	}
	public void setReport_status(int report_status) {
		this.report_status = report_status;
	}
	public int getReporter() {
		return reporter;
	}
	public void setReporter(int reporter) {
		this.reporter = reporter;
	}
	public int getStore_report_id() {
		return store_report_id;
	}
	public void setStore_report_id(int store_report_id) {
		this.store_report_id = store_report_id;
	}
	public int getReported_store() {
		return reported_store;
	}
	public void setReported_store(int reported_store) {
		this.reported_store = reported_store;
	}
	public int getUser_report_id() {
		return user_report_id;
	}
	public void setUser_report_id(int user_report_id) {
		this.user_report_id = user_report_id;
	}
	public int getReported_user() {
		return reported_user;
	}
	public void setReported_user(int reported_user) {
		this.reported_user = reported_user;
	}
	
	
	
}
