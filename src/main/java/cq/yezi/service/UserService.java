package cq.yezi.service;

import cq.yezi.api.CqApiProvider;
import cq.yezi.api.model.UserLoginEntity;
import cq.yezi.api.model.UserLoginResult;
import cq.yezi.model.LoginUser;
import cq.yezi.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户
 */
@Service
public class UserService {
    private CqApiProvider cqApiProvider;

    @Autowired
    public void setCqApiProvider(CqApiProvider cqApiProvider) {
        this.cqApiProvider = cqApiProvider;
    }

    /**
     * 用户登录
     *
     * @param loginUser the entity
     * @return the user
     */
    public User userLogin(LoginUser loginUser) {
        UserLoginEntity entity = new UserLoginEntity();
        entity.setLoginName(loginUser.getLoginName());
        entity.setPassword(loginUser.getPassword());
        UserLoginResult result = cqApiProvider.userLogin(entity);
        return null;
    }
}
