package cq.yezi.controller;

import cq.common.pagehelper.SearchParam;
import cq.yezi.model.City;
import cq.yezi.model.Hotel;
import cq.yezi.model.Room;
import cq.yezi.service.BasicService;
import cq.yezi.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("hotel")
public class HotelController extends BaseController {
    private HotelService hotelService;
    private BasicService basicService;

    @Autowired
    public void setHotelService(HotelService hotelService) {
        this.hotelService = hotelService;
    }

    @Autowired
    public void setBasicService(BasicService basicService) {
        this.basicService = basicService;
    }

    /**
     * 酒店列表view.
     *
     * @param cityId 城市id
     * @return the model and view
     */
    @RequestMapping("list")
    public ModelAndView list(@RequestParam(value = "cityid", required = false) Integer cityId,
                             @RequestParam(value = "checkindate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date checkInDate,
                             @RequestParam(value = "checkoutdate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date checkOutDate,
                             @RequestParam(value = "maxroomperson", required = false) Integer maxRoomPerson) {
        ModelAndView view = new ModelAndView();
        String cityName = "";
        if (cityId != null && cityId > 0) {
            City city = basicService.getCity(cityId);
            cityName = city.getCityName();
        } else {
            City city = basicService.getDefaultCity();
            cityId = city.getCityId();
            cityName = city.getCityName();
        }
        view.addObject("cityId", cityId);
        view.addObject("cityName", cityName);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (checkInDate == null)
            view.addObject("checkInDate", "");
        else {
            view.addObject("checkInDate", dateFormat.format(checkInDate));
        }
        if (checkOutDate == null)
            view.addObject("checkOutDate", "");
        else {
            view.addObject("checkOutDate", dateFormat.format(checkOutDate));
        }
        view.addObject("maxRoomPerson", maxRoomPerson != null ? maxRoomPerson : 1);
        view.setViewName("hotel/list");
        return view;
    }

    /**
     * 酒店列表查询
     *
     * @param params the param
     * @return the commodity type page list
     */
    @RequestMapping(value = "get_list", method = RequestMethod.POST)
    @ResponseBody
    public Object getHotelList(HttpServletRequest request, SearchParam params) {
        // 设置查询参数
        setSearchParamMap(request, params);
        List<Hotel> list = hotelService.getHotelList(params);
        return list;
    }

    /**
     * 酒店详情
     *
     * @param id           酒店id
     * @param checkInDate  入住日期
     * @param checkOutDate 退房日期
     * @return the string
     */
    @RequestMapping("detail")
    public ModelAndView detail(@RequestParam(value = "id", required = true) int id,
                               @RequestParam(value = "checkindate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date checkInDate,
                               @RequestParam(value = "checkoutdate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date checkOutDate) {
        ModelAndView view = new ModelAndView();
        Hotel hotel = hotelService.getHotel(id);
        view.addObject("Hotel", hotel);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (checkInDate == null)
            view.addObject("checkInDate", "");
        else {
            view.addObject("checkInDate", dateFormat.format(checkInDate));
        }
        if (checkOutDate == null)
            view.addObject("checkOutDate", "");
        else {
            view.addObject("checkOutDate", dateFormat.format(checkOutDate));
        }
        view.setViewName("hotel/detail");
        return view;
    }

    /**
     * 房型列表查询
     *
     * @param params the param
     * @return the commodity type page list
     */
    @RequestMapping(value = "get_room_list", method = RequestMethod.POST)
    @ResponseBody
    public Object getRoomList(HttpServletRequest request, SearchParam params) {
        // 设置查询参数
        setSearchParamMap(request, params);
        List<Room> list = hotelService.getRoomList(params);
        return list;
    }


    /**
     * 获取相似酒店
     *
     * @param cityId 城市id
     * @param areaId 商圈id
     * @return the similar hotel list
     */
    @RequestMapping(value = "get_similar_hotels", method = RequestMethod.POST)
    @ResponseBody
    public Object getSimilarHotelList(@RequestParam(value = "cityId", required = true) int cityId,
                                      @RequestParam(value = "areaId", required = true) int areaId) {
        List<Hotel> list = hotelService.getSimilarHotelList(cityId, areaId);
        return list;
    }
}
