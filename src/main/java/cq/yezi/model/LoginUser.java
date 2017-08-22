package cq.yezi.model;

import javax.validation.constraints.Size;

/**
 * 用户登录
 */
public class LoginUser {
    //登录名
    @Size(min = 1, message = "请输入邮箱")
    private String loginName;
    //密码
    @Size(min = 1, message = "请输入密码")
    private String password;
    //是否记住账号
    private boolean autoLogin;
    //登录成功后跳转的URL
    private String gobackURL;

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

    public boolean getAutoLogin() {
        return autoLogin;
    }

    public void setAutoLogin(boolean autoLogin) {
        this.autoLogin = autoLogin;
    }

    public String getGobackURL() {
        return gobackURL;
    }

    public void setGobackURL(String gobackURL) {
        this.gobackURL = gobackURL;
    }
}
