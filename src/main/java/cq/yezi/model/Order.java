package cq.yezi.model;

import cq.common.enums.PayPlatform;

import java.math.BigDecimal;

/**
 * 订单
 */
public class Order extends BaseMo {
    //用户Id
    private long userId;
    //姓
    private String firstName;
    //名
    private String lastName;
    //邮箱
    private String email;
    //手机
    private String mobile;
    //是否加人 0不加人，非0为所加人数
    private int extraPeopleNum;
    //是否有儿童
    private boolean isAllowChildren;
    //酒店Id
    private int hotelId;
    //房型Id
    private int roomId;
    //清洁费
    private BigDecimal cleaningFee;
    //订单总金额
    private BigDecimal orderPrice;
    //支付方式
    private PayPlatform paymentMethod;

    /**
     * Gets user id.
     *
     * @return the user id
     */
    public long getUserId() {
        return userId;
    }

    /**
     * Sets user id.
     *
     * @param userId the user id
     */
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /**
     * Gets first name.
     *
     * @return the first name
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets first name.
     *
     * @param firstName the first name
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Gets last name.
     *
     * @return the last name
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets last name.
     *
     * @param lastName the last name
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Gets email.
     *
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets email.
     *
     * @param email the email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets mobile.
     *
     * @return the mobile
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * Sets mobile.
     *
     * @param mobile the mobile
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 是否加人
     *
     * @return 0不加人，非0为所加人数
     */
    public int getExtraPeopleNum() {
        return extraPeopleNum;
    }

    /**
     * 是否加人
     *
     * @param extraPeopleNum 0不加人，非0为所加人数
     */
    public void setExtraPeopleNum(int extraPeopleNum) {
        this.extraPeopleNum = extraPeopleNum;
    }

    /**
     * 是否有儿童
     *
     * @return boolean
     */
    public boolean isAllowChildren() {
        return isAllowChildren;
    }

    /**
     * 是否有儿童
     *
     * @param allowChildren boolean
     */
    public void setAllowChildren(boolean allowChildren) {
        isAllowChildren = allowChildren;
    }

    /**
     * Gets hotel id.
     *
     * @return the hotel id
     */
    public int getHotelId() {
        return hotelId;
    }

    /**
     * Sets hotel id.
     *
     * @param hotelId the hotel id
     */
    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    /**
     * Gets room id.
     *
     * @return the room id
     */
    public int getRoomId() {
        return roomId;
    }

    /**
     * Sets room id.
     *
     * @param roomId the room id
     */
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    /**
     * 清洁费
     *
     * @return 清洁费
     */
    public BigDecimal getCleaningFee() {
        return cleaningFee;
    }

    /**
     * 清洁费
     *
     * @param cleaningFee 清洁费
     */
    public void setCleaningFee(BigDecimal cleaningFee) {
        this.cleaningFee = cleaningFee;
    }

    /**
     * 订单总金额
     *
     * @return 订单总金额
     */
    public BigDecimal getOrderPrice() {
        return orderPrice;
    }

    /**
     * 订单总金额
     *
     * @param orderPrice 订单总金额
     */
    public void setOrderPrice(BigDecimal orderPrice) {
        this.orderPrice = orderPrice;
    }

    /**
     * 支付方式
     *
     * @return 支付方式
     */
    public PayPlatform getPaymentMethod() {
        return paymentMethod;
    }

    /**
     * 支付方式
     *
     * @param paymentMethod 支付方式
     */
    public void setPaymentMethod(PayPlatform paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}
