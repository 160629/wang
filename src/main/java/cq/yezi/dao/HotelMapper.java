package cq.yezi.dao;

import cq.yezi.model.Hotel;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;
import java.util.Map;

import static cq.yezi.dao.HotelProvider.HOTELTABLE;

/**
 * 酒店
 */
public interface HotelMapper {

    /**
     * 获取酒店列表
     *
     * @param params the params
     * @return the list
     */
    @SelectProvider(type = HotelProvider.class, method = "selectPageList")
    List<Hotel> getList(Map<String, String> params);

    /**
     * 获取酒店详情
     *
     * @param id 酒店id
     * @return 酒店信息 hotel
     */
    @Select("SELECT h.*,a.areaName FROM " + HOTELTABLE + " h INNER JOIN area a ON a.areaId=h.areaId WHERE h.hotelId = #{id}")
    @Results({@Result(column = "hotelId", property = "hotelId"),
            @Result(column = "hotelId", property = "hotelPicList", many = @Many(select = "cq.yezi.dao.HotelPicMapper.getList", fetchType = FetchType.LAZY))})
    Hotel getHotel(@Param("id") int id);


    /**
     * 获取相似酒店
     *
     * @param cityId 城市id
     * @param areaId 商圈id
     * @return the similar list
     */
    @Select("SELECT * FROM hotel WHERE cityId=#{cityId} AND areaId=#{areaId} ORDER BY price LIMIT 3")
    List<Hotel> getSimilarList(@Param("cityId") int cityId, @Param("areaId") int areaId);
}
