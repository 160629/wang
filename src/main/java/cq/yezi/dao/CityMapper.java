package cq.yezi.dao;

import cq.yezi.model.City;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 城市
 */
public interface CityMapper {
    /**
     * 获取城市列表
     *
     * @return 城市列表 list
     */
    @Select("SELECT * FROM city")
    List<City> getList();

    /**
     * 获取城市
     *
     * @param id 城市id
     * @return 城市
     */
    @Select("SELECT * FROM city WHERE cityId= #{id}")
    City getCity(@Param("id") int id);

    /**
     * 获取默认城市（酒店列表专用）
     *
     * @return 城市
     */
    @Select("SELECT * FROM city LIMIT 1")
    City getDefaultCity();
}
