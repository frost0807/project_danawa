package com.bitcamp.Danawa.model;

import lombok.Data;

@Data
public class UserDTO {
	private int id;
	private int type;
	private String username;
	private String password;
}
