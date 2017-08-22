package cq.yezi.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 房型
 */
public class Room {
    //
    private int roomId;
    //
    private int hotelId;
    //
    private String roomName;
    //
    private String roomPic;
    //
    private String roomBed;
    //
    private String roomPerson;
    //
    private BigDecimal roomPrice;
    //
    private int roomType;
    private String typeName;
    //
    private int roomCount;
    //
    private String roomDesc;
    //
    private String roomFacility;
    private List<HotelFacility> roomFacilityList;
    // 1=正常，2=删除
    private byte status;
    //
    private String weekPriceStr;
    //
    private Date priceDateStart;
    //
    private Date priceDateEnd;
    // 最大入住人数
    private int maxRoomPerson;
    //是否有空房
    private boolean hasVacantRoom;

    private Hotel hotel;

    /**
     * @param roomId
     */
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    /**
     * @return
     */
    public int getRoomId() {
        return this.roomId;
    }

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
     * @param roomName
     */
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    /**
     * @return
     */
    public String getRoomName() {
        return this.roomName;
    }

    /**
     * @param roomPic
     */
    public void setRoomPic(String roomPic) {
        this.roomPic = roomPic;
    }

    /**
     * @return
     */
    public String getRoomPic() {
        return this.roomPic;
    }

    /**
     * @param roomBed
     */
    public void setRoomBed(String roomBed) {
        this.roomBed = roomBed;
    }

    /**
     * @return
     */
    public String getRoomBed() {
        return this.roomBed;
    }

    /**
     * @param roomPerson
     */
    public void setRoomPerson(String roomPerson) {
        this.roomPerson = roomPerson;
    }

    /**
     * @return
     */
    public String getRoomPerson() {
        return this.roomPerson;
    }

    /**
     * @param roomPrice
     */
    public void setRoomPrice(BigDecimal roomPrice) {
        this.roomPrice = roomPrice;
    }

    /**
     * @return
     */
    public BigDecimal getRoomPrice() {
        return this.roomPrice;
    }

    /**
     * @param roomType
     */
    public void setRoomType(int roomType) {
        this.roomType = roomType;
    }

    /**
     * @return
     */
    public int getRoomType() {
        return this.roomType;
    }

    /**
     * @param roomCount
     */
    public void setRoomCount(int roomCount) {
        this.roomCount = roomCount;
    }

    /**
     * @return
     */
    public int getRoomCount() {
        return this.roomCount;
    }

    /**
     * @param roomDesc
     */
    public void setRoomDesc(String roomDesc) {
        this.roomDesc = roomDesc;
    }

    /**
     * @return
     */
    public String getRoomDesc() {
        return this.roomDesc;
    }

    /**
     * @param roomFacility
     */
    public void setRoomFacility(String roomFacility) {
        this.roomFacility = roomFacility;
    }

    /**
     * @return
     */
    public String getRoomFacility() {
        return this.roomFacility;
    }

    /**
     * @param status 1=正常，2=删除
     */
    public void setStatus(byte status) {
        this.status = status;
    }

    /**
     * @return 1=正常，2=删除
     */
    public byte getStatus() {
        return this.status;
    }

    /**
     * @param weekPriceStr
     */
    public void setWeekPriceStr(String weekPriceStr) {
        this.weekPriceStr = weekPriceStr;
    }

    /**
     * @return
     */
    public String getWeekPriceStr() {
        return this.weekPriceStr;
    }

    /**
     * @param priceDateStart
     */
    public void setPriceDateStart(Date priceDateStart) {
        this.priceDateStart = priceDateStart;
    }

    /**
     * @return
     */
    public Date getPriceDateStart() {
        return this.priceDateStart;
    }

    /**
     * @param priceDateEnd
     */
    public void setPriceDateEnd(Date priceDateEnd) {
        this.priceDateEnd = priceDateEnd;
    }

    /**
     * @return
     */
    public Date getPriceDateEnd() {
        return this.priceDateEnd;
    }

    /**
     * @param maxRoomPerson 最大入住人数
     */
    public void setMaxRoomPerson(int maxRoomPerson) {
        this.maxRoomPerson = maxRoomPerson;
    }

    /**
     * @return 最大入住人数
     */
    public int getMaxRoomPerson() {
        return this.maxRoomPerson;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public List<HotelFacility> getRoomFacilityList() {
        return roomFacilityList;
    }

    public void setRoomFacilityList(List<HotelFacility> roomFacilityList) {
        this.roomFacilityList = roomFacilityList;
    }

    public boolean isHasVacantRoom() {
        return hasVacantRoom;
    }

    public void setHasVacantRoom(boolean hasVacantRoom) {
        this.hasVacantRoom = hasVacantRoom;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }
}
