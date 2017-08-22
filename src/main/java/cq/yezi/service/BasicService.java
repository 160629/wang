package cq.yezi.service;

import cq.yezi.dao.CityMapper;
import cq.yezi.model.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 基础服务
 */
@Service
public class BasicService {
    private CityMapper cityMapper;

    @Autowired
    public void setCityMapper(CityMapper cityMapper) {
        this.cityMapper = cityMapper;
    }

    /**
     * 获取城市列表
     *
     * @return 城市列表
     */
    public List<City> getCityList() {
        return cityMapper.getList();
    }

    /**
     * 获取城市
     *
     * @param id 城市id
     * @return 城市
     */
    public City getCity(int id) {
        return cityMapper.getCity(id);
    }

    /**
     * 获取默认城市（酒店列表专用）
     *
     * @return 城市
     */
    public City getDefaultCity() {
        return cityMapper.getDefaultCity();
    }
}
