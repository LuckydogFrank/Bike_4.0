package com.webike.enums;

/**角色枚举
 */
public enum RoleEnum {

    SUPER_MANAGER("管理员"),
    MANAGER("用户");

    private String massage;

    public String getMassage() {
        return massage;
    }


    RoleEnum(String massage){
        this.massage = massage;
    }

}
