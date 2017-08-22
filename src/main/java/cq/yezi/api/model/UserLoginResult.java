package cq.yezi.api.model;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 用户登录返回信息
 */
public class UserLoginResult extends ResultModel {
    private String token;

    public String getToken() {
        return token;
    }

    @JsonProperty(value = "Token")
    public void setToken(String token) {
        this.token = token;
    }
}
