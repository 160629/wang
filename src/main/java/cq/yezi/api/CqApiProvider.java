package cq.yezi.api;

import cq.yezi.api.model.HotelOrderEntity;
import cq.yezi.api.model.ResultModel;
import cq.yezi.api.model.UserLoginEntity;
import cq.yezi.api.model.UserLoginResult;
import org.springframework.stereotype.Component;

/**
 * API接口实现
 */
@Component
public class CqApiProvider extends BaseApi {

    /**
     * 用户登录
     *
     * @param entity the entity
     * @return the user login result
     */
    public UserLoginResult userLogin(UserLoginEntity entity) {
        UserLoginResult result = cqHttp("User/Login", entity, UserLoginResult.class);
        return result;
    }


    /**
     * 添加民宿订单
     *
     * @param entity the entity
     * @return the result model
     */
    public ResultModel addHotelOrder(HotelOrderEntity entity) {
        ResultModel result = cqHttp("HotelOrder/AddHotelOrder", entity, ResultModel.class);
        return result;
    }
}
