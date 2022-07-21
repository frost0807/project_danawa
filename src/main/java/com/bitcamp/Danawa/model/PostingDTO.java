package com.bitcamp.Danawa.model;

import java.sql.Timestamp;
import java.util.Calendar;

import lombok.Data;

@Data
public class PostingDTO {
	private int id;
	private int itemId;
	private String title;
	private String content;
	private String postImagePath;
	private Calendar writtenDate;
	
	public void setWrittenDate(Timestamp writtenDate) {
		this.writtenDate=Calendar.getInstance();
		this.writtenDate.setTime(writtenDate);
	}
}
