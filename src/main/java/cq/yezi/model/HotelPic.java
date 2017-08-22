package cq.yezi.model;

/**
 * 酒店图片
 */
public class HotelPic extends BaseMo {
    private int pId;
    private int hotelId;
    private String pic;

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
}
