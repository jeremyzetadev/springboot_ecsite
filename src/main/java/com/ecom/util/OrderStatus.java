package com.ecom.util;

public enum OrderStatus {

    IN_PROGRESS(1, "In Progress"),
    ORDER_RECEIVED(2, "Order Received"),
    PRODUCT_PACKED(3, "Product Packed"),
    OUT_FOR_DELIVERY(4, "Out for Delivery"),
    DELVERED(5, "Delivered");

    private Integer id;

    private String name;

    private OrderStatus(Integer id, String name){
        this.id = id;
        this.name = name;
    }

    public Integer getId(){
        return id;
    }

    public void SetId(Integer id){
        this.id = id;
    }

    public String getName(){
        return name;
    }
}

