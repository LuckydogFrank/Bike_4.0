package com.webike.enums;

public enum BikeStateEnum {
    AVAILABLE("未借"),
    BORROWED("已借"),
    REPAIR("需维修"),
    BREAKDOWN("报废");

    private String state;

    public String getState() {
        return state;
    }

    BikeStateEnum(String state) {
        this.state = state;
    }
}
