package cq.yezi.controller;

import cq.yezi.model.Order;
import org.testng.annotations.Test;
import org.unitils.spring.annotation.SpringBeanByType;

import static org.testng.Assert.assertNotNull;

/**
 * Created by LiuTao on 2017/8/4.
 */
public class OrderControllerTest extends BaseControllerTest {
    @SpringBeanByType
    private OrderController controller;

    @Test
    public void addOrder() {
        request.setRequestURI("/order/add_order");
        request.setMethod("POST");
        Order order = new Order();
        //order.setName("Test1");

        // 向控制发起请求
        Object o = controller.addOrder(order);
        assertNotNull(o);
    }
}
