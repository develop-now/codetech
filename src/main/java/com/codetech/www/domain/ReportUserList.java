package com.codetech.www.domain;

public class ReportUserList {
	// USER_REPORT	
	int user_report_id;
	int report_status;
	
	String created_at;
	String updated_at;
	String report_subject;
	String report_content;
	
	// 신고 당한자
	int reported_report_count;
	
	String reported_user_profile;
	String reported_user_email;
	String reported_user_name;
	String reported_user_tel;
	String reported_user_address;
	
	// 신고자
	String reporter_user_email;
	String reporter_user_name;
	String reporter_user_tel;
	String reporter_user_address;
	
	public int getUser_report_id() {
		return user_report_id;
	}
	public void setUser_report_id(int user_report_id) {
		this.user_report_id = user_report_id;
	}
	public int getReport_status() {
		return report_status;
	}
	public void setReport_status(int report_status) {
		this.report_status = report_status;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
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
	public int getReported_report_count() {
		return reported_report_count;
	}
	public void setReported_report_count(int reported_report_count) {
		this.reported_report_count = reported_report_count;
	}
	public String getReported_user_email() {
		return reported_user_email;
	}
	public void setReported_user_email(String reported_user_email) {
		this.reported_user_email = reported_user_email;
	}
	public String getReported_user_name() {
		return reported_user_name;
	}
	public void setReported_user_name(String reported_user_name) {
		this.reported_user_name = reported_user_name;
	}
	public String getReported_user_tel() {
		return reported_user_tel;
	}
	public void setReported_user_tel(String reported_user_tel) {
		this.reported_user_tel = reported_user_tel;
	}
	public String getReported_user_address() {
		return reported_user_address;
	}
	public void setReported_user_address(String reported_user_address) {
		this.reported_user_address = reported_user_address;
	}
	public String getReporter_user_email() {
		return reporter_user_email;
	}
	public void setReporter_user_email(String reporter_user_email) {
		this.reporter_user_email = reporter_user_email;
	}
	public String getReporter_user_name() {
		return reporter_user_name;
	}
	public void setReporter_user_name(String reporter_user_name) {
		this.reporter_user_name = reporter_user_name;
	}
	public String getReporter_user_tel() {
		return reporter_user_tel;
	}
	public void setReporter_user_tel(String reporter_user_tel) {
		this.reporter_user_tel = reporter_user_tel;
	}
	public String getReporter_user_address() {
		return reporter_user_address;
	}
	public void setReporter_user_address(String reporter_user_address) {
		this.reporter_user_address = reporter_user_address;
	}
	public String getReported_user_profile() {
		return reported_user_profile;
	}
	public void setReported_user_profile(String reported_user_profile) {
		this.reported_user_profile = reported_user_profile;
	}
}
