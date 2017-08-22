package cq.yezi.model;

/**
 * 空房
 */
public class VacantRoom {
    private int roomId;
    private int remainingNum;

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getRemainingNum() {
        return remainingNum;
    }

    public void setRemainingNum(int remainingNum) {
        this.remainingNum = remainingNum;
    }
}
