package cq.yezi.dao;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

/**
 * 房型
 */
public class RoomProvider {
    public static final String ROOMTABLE = "room";

    /**
     * 分页查询
     *
     * @param params
     * @return Sql
     */
    public String selectList(final Map<String, String> params) {
        String sql = new SQL() {
            {
                SELECT("r.*,t.typeName");
                FROM(ROOMTABLE + " r");
                INNER_JOIN("room_type t ON t.typeId=r.roomType");
                WHERE("r.status = 1");
                if (!StringUtils.isBlank(params.get("hotelId"))) {
                    WHERE("r.hotelId = #{hotelId}");
                }
                if (!StringUtils.isBlank(params.get("checkInDate")) && !StringUtils.isBlank(params.get("checkOutDate"))) {
                    WHERE("r.priceDateStart<=#{checkInDate} AND r.priceDateEnd>=#{checkOutDate}");
                }
                //ORDER_BY(" id desc ");
            }
        }.toString();
        return sql;
    }

    /**
     * 获取有无空房
     *
     * @param params the params
     * @return the string
     */
    public String selectRoomRemainingNumList(final Map<String, String> params) {
        String sql = new SQL() {
            {
                SELECT("rn.roomId,(rn.num-IFNULL(orn.num,0)) AS remainingNum");
                FROM("(SELECT r.roomId,COUNT(r.roomId) AS num FROM room AS r INNER JOIN room_number AS n ON r.roomId=n.roomId WHERE r.hotelId=#{hotelId} AND n.status=1 AND r.priceDateStart<=#{checkInDate} AND r.priceDateEnd>=#{checkOutDate} GROUP BY r.roomId) AS rn");
                LEFT_OUTER_JOIN("(SELECT roomId,COUNT(roomId) AS num FROM order_room_number WHERE hotelId=#{hotelId} AND status=1 AND checkDay>=#{checkInDate} AND checkDay<=#{checkOutDate} GROUP BY roomId) AS orn ON rn.roomId=orn.roomId");
            }
        }.toString();
        return sql;
    }
}
