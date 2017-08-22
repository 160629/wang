package cq.yezi.dao;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

/**
 * 酒店
 */
public class HotelProvider {
    public static final String HOTELTABLE = "hotel";

    /**
     * 分页查询
     *
     * @param params
     * @return Sql
     */
    public String selectPageList(final Map<String, String> params) {
        String sql = new SQL() {
            {
                SELECT("h.*,a.areaName");
                FROM(HOTELTABLE + " h");
                INNER_JOIN("area a ON a.areaId=h.areaId");
                WHERE("h.status = 1");
                WHERE("h.cityId = #{cityId}");
                if (!StringUtils.isBlank(params.get("checkInDate")) && !StringUtils.isBlank(params.get("checkOutDate")) && !StringUtils.isBlank(params.get("maxRoomPerson"))) {
                    WHERE("h.hotelId IN (SELECT rn.hotelId FROM " +
                            "(SELECT r.hotelId,r.roomId,COUNT(r.roomId) AS num FROM room AS r INNER JOIN room_number AS n ON r.roomId=n.roomId LEFT JOIN hotel AS h ON r.hotelId=h.hotelId " +
                            "   WHERE h.cityId=#{cityId} AND n.status=1 AND r.maxRoomPerson>=#{maxRoomPerson} AND r.priceDateStart<=#{checkInDate} AND r.priceDateEnd>=#{checkOutDate} GROUP BY r.roomId) AS rn " +
                            "LEFT JOIN " +
                            "(SELECT roomId,COUNT(roomId) AS num FROM order_room_number WHERE cityId=#{cityId} AND status=1 AND checkDay>=#{checkInDate} AND checkDay<=#{checkOutDate} GROUP BY roomId) AS orn ON rn.roomId=orn.roomId " +
                            "WHERE rn.num>IFNULL(orn.num,0) " +
                            "GROUP BY rn.hotelId)");
                }
                //ORDER_BY(" id desc ");
            }
        }.toString();
        return sql;
    }

}
