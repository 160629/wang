package cq.yezi.controller;

import cq.yezi.filter.LoginInfo;
import cq.yezi.model.Order;
import cq.yezi.model.Room;
import cq.yezi.model.User;
import cq.yezi.service.HotelService;
import cq.yezi.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("order")
public class OrderController extends BaseController {
    private HotelService hotelService;
    private OrderService orderService;

    @Autowired
    public void setHotelService(HotelService hotelService) {
        this.hotelService = hotelService;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    /**
     * 下单页面
     *
     * @param roomId       房型id
     * @param checkInDate  入住日期
     * @param checkOutDate 退房日期
     * @return the model and view
     */
    @RequestMapping("add")
    public ModelAndView add(@RequestParam(value = "roomid", required = true) int roomId,
                            @RequestParam(value = "checkindate", required = true) @DateTimeFormat(pattern = "yyyy-MM-dd") Date checkInDate,
                            @RequestParam(value = "checkoutdate", required = true) @DateTimeFormat(pattern = "yyyy-MM-dd") Date checkOutDate) {
        ModelAndView view = new ModelAndView();
        Room room = hotelService.getRoom(roomId);

        User user = LoginInfo.getUser();

        view.addObject("Room", room);
        view.setViewName("order/add");
        return view;
    }

    /**
     * 创建订单
     *
     * @param order the order
     * @return the object
     */
    @RequestMapping(value = "add_order", method = RequestMethod.POST)
    @ResponseBody
    public Object addOrder(Order order) {
        long orderId = orderService.addOrder(order);
        return orderId;
    }

    @RequestMapping("pay_success")
    public String paySuccess() {

        return "order/pay_success";
    }

    @RequestMapping("detail")
    public String detail() {

        return "order/detail";
    }
}
