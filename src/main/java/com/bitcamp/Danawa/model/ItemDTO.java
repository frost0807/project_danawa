package com.bitcamp.Danawa.model;

import lombok.Data;

@Data
public class ItemDTO {
	private int id;
	private String name;
	private String specification;
	private String imagePath;
	private int categoryId;
}
