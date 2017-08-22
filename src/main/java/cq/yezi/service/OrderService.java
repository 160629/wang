package cq.yezi.service;

import cq.yezi.api.CqApiProvider;
import cq.yezi.api.model.HotelOrderEntity;
import cq.yezi.api.model.ResultModel;
import cq.yezi.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 订单
 */
@Service
public class OrderService {
    private CqApiProvider cqApiProvider;

    @Autowired
    public void setCqApiProvider(CqApiProvider cqApiProvider) {
        this.cqApiProvider = cqApiProvider;
    }

    /**
     * 创建订单
     *
     * @param order the order
     * @return the long
     */
    public long addOrder(Order order) {
        HotelOrderEntity entity = new HotelOrderEntity();

        ResultModel result = cqApiProvider.addHotelOrder(entity);
        return result.getId();
    }
}
