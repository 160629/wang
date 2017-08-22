package cq.yezi.model;

/**
 * 城市
 */
public class City extends BaseMo {
    private int cityId;
    private String cityName;

    /**
     * 城市id
     *
     * @return the 城市id
     */
    public int getCityId() {
        return cityId;
    }

    /**
     * 城市id
     *
     * @param cityId 城市id
     */
    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    /**
     * 城市名称
     *
     * @return 城市名称
     */
    public String getCityName() {
        return cityName;
    }

    /**
     * 城市名称
     *
     * @param cityName 城市名称
     */
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
}
