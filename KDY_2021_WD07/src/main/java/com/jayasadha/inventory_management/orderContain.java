package com.jayasadha.inventory_management;

public class orderContain {
	
	private int iteID;
	private int orderID;
	private int returnCount;
	private int quantity;
	
	
	public orderContain(int iteID, int orderID, int returnCount, int quantity) {
		super();
		this.iteID = iteID;
		this.orderID = orderID;
		this.returnCount = returnCount;
		this.quantity = quantity;
		
	}

	public int getItemID() {
		return iteID;
	}

	public int getOrderID() {
		return orderID;
	}

	public int getReturnCount() {
		return returnCount;
	}

	public int getQuantity() {
		return quantity;
	}
	
	
	

}
