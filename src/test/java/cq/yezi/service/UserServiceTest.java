package cq.yezi.service;

import cq.yezi.model.LoginUser;
import cq.yezi.model.User;
import org.testng.annotations.Test;
import org.unitils.spring.annotation.SpringBeanByType;

/**
 * Created by LiuTao on 2017/8/4.
 */
public class UserServiceTest extends BaseServiceTest {
    @SpringBeanByType
    private UserService userService;

    @Test
    public void UserLogin() {
        LoginUser loginUser = new LoginUser();
        loginUser.setLoginName("592158189@qq.com");
        loginUser.setPassword("123456");
        User user = userService.userLogin(loginUser);
    }
}
