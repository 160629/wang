package cq.yezi.dao;

import cq.yezi.model.HotelFacility;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 酒店设施
 */
public interface HotelFacilityMapper {
    @Select("SELECT * FROM hotel_facility")
    List<HotelFacility> getList();
}
