package cq.yezi.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 酒店
 */
public class Hotel extends BaseMo {
    //
    private int hotelId;
    //
    private String hotelPic;
    //
    private String hotelName;
    //
    private byte cityId;
    //
    private String subTitle;
    //
    private byte areaId;
    //
    private String areaName;
    //
    private String hotelAddress;
    //
    private byte selfManage;
    //
    private String hotelInfo;
    //
    private String hotelFacility;
    //
    private String reservationInstruction;
    //
    private String refundRule;
    //
    private String map;
    //
    private byte status;
    //
    private Date addTime;
    // 酒店可用房间数量
    private int roomNumberCount;
    //
    private BigDecimal price;
    // 纬度
    private BigDecimal lat;
    // 精度
    private BigDecimal lon;
    // 宜居人数
    private String residentNumber;
    // 推荐理由
    private String recommendReason;
    //
    private String extraId;
    // 老酒店id
    private int oid;
    // 清洁公司
    private int outsourcerId;

    private List<HotelPic> hotelPicList;

    /**
     * @param hotelId
     */
    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    /**
     * @return
     */
    public int getHotelId() {
        return this.hotelId;
    }

    /**
     * @param hotelPic
     */
    public void setHotelPic(String hotelPic) {
        this.hotelPic = hotelPic;
    }

    /**
     * @return
     */
    public String getHotelPic() {
        return this.hotelPic;
    }

    /**
     * @param hotelName
     */
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    /**
     * @return
     */
    public String getHotelName() {
        return this.hotelName;
    }

    /**
     * @param cityId
     */
    public void setCityId(byte cityId) {
        this.cityId = cityId;
    }

    /**
     * @return
     */
    public byte getCityId() {
        return this.cityId;
    }

    /**
     * @param subTitle
     */
    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    /**
     * @return
     */
    public String getSubTitle() {
        return this.subTitle;
    }

    /**
     * @param areaId
     */
    public void setAreaId(byte areaId) {
        this.areaId = areaId;
    }

    /**
     * @return
     */
    public byte getAreaId() {
        return this.areaId;
    }

    /**
     * @param hotelAddress
     */
    public void setHotelAddress(String hotelAddress) {
        this.hotelAddress = hotelAddress;
    }

    /**
     * @return
     */
    public String getHotelAddress() {
        return this.hotelAddress;
    }

    /**
     * @param selfManage
     */
    public void setSelfManage(byte selfManage) {
        this.selfManage = selfManage;
    }

    /**
     * @return
     */
    public byte getSelfManage() {
        return this.selfManage;
    }

    /**
     * @param hotelInfo
     */
    public void setHotelInfo(String hotelInfo) {
        this.hotelInfo = hotelInfo;
    }

    /**
     * @return
     */
    public String getHotelInfo() {
        return this.hotelInfo;
    }

    /**
     * @param hotelFacility
     */
    public void setHotelFacility(String hotelFacility) {
        this.hotelFacility = hotelFacility;
    }

    /**
     * @return
     */
    public String getHotelFacility() {
        return this.hotelFacility;
    }

    /**
     * @param reservationInstruction
     */
    public void setReservationInstruction(String reservationInstruction) {
        this.reservationInstruction = reservationInstruction;
    }

    /**
     * @return
     */
    public String getReservationInstruction() {
        return this.reservationInstruction;
    }

    /**
     * @param refundRule
     */
    public void setRefundRule(String refundRule) {
        this.refundRule = refundRule;
    }

    /**
     * @return
     */
    public String getRefundRule() {
        return this.refundRule;
    }

    /**
     * @param map
     */
    public void setMap(String map) {
        this.map = map;
    }

    /**
     * @return
     */
    public String getMap() {
        return this.map;
    }

    /**
     * @param status
     */
    public void setStatus(byte status) {
        this.status = status;
    }

    /**
     * @return
     */
    public byte getStatus() {
        return this.status;
    }

    /**
     * @param addTime
     */
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    /**
     * @return
     */
    public Date getAddTime() {
        return this.addTime;
    }

    /**
     * @param roomNumberCount 酒店可用房间数量
     */
    public void setRoomNumberCount(int roomNumberCount) {
        this.roomNumberCount = roomNumberCount;
    }

    /**
     * @return 酒店可用房间数量
     */
    public int getRoomNumberCount() {
        return this.roomNumberCount;
    }

    /**
     * @param price
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * @return
     */
    public BigDecimal getPrice() {
        return this.price;
    }

    /**
     * @param lat 纬度
     */
    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    /**
     * @return 纬度
     */
    public BigDecimal getLat() {
        return this.lat;
    }

    /**
     * @param lon 精度
     */
    public void setLon(BigDecimal lon) {
        this.lon = lon;
    }

    /**
     * @return 精度
     */
    public BigDecimal getLon() {
        return this.lon;
    }

    /**
     * @param residentNumber 宜居人数
     */
    public void setResidentNumber(String residentNumber) {
        this.residentNumber = residentNumber;
    }

    /**
     * @return 宜居人数
     */
    public String getResidentNumber() {
        return this.residentNumber;
    }

    /**
     * @param recommendReason 推荐理由
     */
    public void setRecommendReason(String recommendReason) {
        this.recommendReason = recommendReason;
    }

    /**
     * @return 推荐理由
     */
    public String getRecommendReason() {
        return this.recommendReason;
    }

    /**
     * @param extraId
     */
    public void setExtraId(String extraId) {
        this.extraId = extraId;
    }

    /**
     * @return
     */
    public String getExtraId() {
        return this.extraId;
    }

    /**
     * @param oid 老酒店id
     */
    public void setOid(int oid) {
        this.oid = oid;
    }

    /**
     * @return 老酒店id
     */
    public int getOid() {
        return this.oid;
    }

    /**
     * @param outsourcerId 清洁公司
     */
    public void setOutsourcerId(int outsourcerId) {
        this.outsourcerId = outsourcerId;
    }

    /**
     * @return 清洁公司
     */
    public int getOutsourcerId() {
        return this.outsourcerId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public List<HotelPic> getHotelPicList() {
        return hotelPicList;
    }

    public void setHotelPicList(List<HotelPic> hotelPicList) {
        this.hotelPicList = hotelPicList;
    }
}
