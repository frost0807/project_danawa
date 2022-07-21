package com.bitcamp.Danawa.model;

import lombok.Data;

@Data
public class BusinessUserDTO {
	private int id;
	private int userId;
	private String name;
	private String nickname;
	private String email;
	private String company;
	private String representative;
	private String corporateNumber;
	private String phone;
}