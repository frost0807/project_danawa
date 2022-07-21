package com.bitcamp.Danawa.model;

import lombok.Data;

@Data
public class CategoryDTO {
	private int id;
	private String mainCategory;
	private String largeCategory;
	private String middleCategory;
	private String subCategory;
	private String specification;
}