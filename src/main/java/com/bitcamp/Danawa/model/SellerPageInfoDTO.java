package com.bitcamp.Danawa.model;

import lombok.Data;

@Data
public class SellerPageInfoDTO {
	private int id;
	private int postingId;
	private int itemId;
	private int price;
	private int deliveryCharge;
	private String siteUrl;
	private String logoUrl;
}