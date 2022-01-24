package com.jayasadha.inventory_management;



public class Shop {

	
	private int  itID;
	private String itName;
	private String itPrice;
	private String itImage;
	private int  itemID;
	private String itemBrand;
	private String itemCategory;
	

	
    
	public Shop(int itID, String itName, String itPrice,String itImage,int itemID,String itemBrand, String itemCategory) {
		
		this.itID = itID;
		this.itName = itPrice;
		this.itPrice = itPrice;
		this.itImage = itImage;
		this.itemID = itemID;
	}
	
	
	public int getitID() {
		return itID;
	}


	public String getitName() {
		return itName;
	}


	public String getitPrice() {
		return itPrice;
	}
	
	public String getitImage() {
		return itImage;
	}


	public int getItemID() {
		return itemID;
	}

	public String getItemBrand() {
		return itemBrand;
	}


	public String getItemCategory() {
		return itemCategory;
	}





}
