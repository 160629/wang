package cq.yezi.dao;

import cq.yezi.model.HotelPic;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 酒店图片
 */
public interface HotelPicMapper {

    @Select("SELECT * FROM hotel_pic WHERE hotelId=#{hotelId}")
    List<HotelPic> getList(int hotelId);
}
