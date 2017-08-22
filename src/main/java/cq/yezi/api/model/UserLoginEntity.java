package cq.yezi.api.model;

import java.io.Serializable;

/**
 * 用户登录参数
 */
public class UserLoginEntity implements Serializable {
    private int loginNameType = 1;
    private String loginName;
    private String password;

    public int getLoginNameType() {
        return loginNameType;
    }

    public void setLoginNameType(int loginNameType) {
        this.loginNameType = loginNameType;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
