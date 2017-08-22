package cq.yezi.dao;

import cq.yezi.model.Room;
import cq.yezi.model.VacantRoom;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;
import java.util.Map;

import static cq.yezi.dao.RoomProvider.ROOMTABLE;

/**
 * 房型
 */
public interface RoomMapper {
    /**
     * 获取房型列表
     *
     * @param params the params
     * @return the list
     */
    @SelectProvider(type = RoomProvider.class, method = "selectList")
    List<Room> getList(Map<String, String> params);

    /**
     * 获取房型有无空房
     *
     * @param params the params
     * @return the room remaining num
     */
    @SelectProvider(type = RoomProvider.class, method = "selectRoomRemainingNumList")
    List<VacantRoom> getRoomRemainingNum(Map<String, String> params);

    /**
     * 获取房型信息
     *
     * @param roomId 房型id
     * @return 房型信息
     */
    @Select("SELECT r.*,t.typeName FROM " + ROOMTABLE + " r INNER JOIN room_type t ON t.typeId=r.roomType WHERE r.roomId = #{roomId}")
    @Results({@Result(column = "hotelId", property = "hotelId"),
            @Result(column = "hotelId", property = "hotel", many = @Many(select = "cq.yezi.dao.HotelMapper.getHotel", fetchType = FetchType.LAZY))})
    Room getRoom(int roomId);
}
