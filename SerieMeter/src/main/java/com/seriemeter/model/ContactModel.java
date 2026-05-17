package com.seriemeter.model;

public class ContactModel {
	private int feedbackNo;
	private String name;
	private String email;
	private String message;

	// Constructors
	public ContactModel() {
	}

	public ContactModel(String name, String email, String message) {
		this.name = name;
		this.email = email;
		this.message = message;
	}

	// Getters and Setters
	public int getFeedbackNo() {
		return feedbackNo;
	}

	public void setFeedbackNo(int feedbackNo) {
		this.feedbackNo = feedbackNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}