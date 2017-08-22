package cq.yezi.service;

import cq.common.pagehelper.SearchParam;
import cq.yezi.dao.HotelFacilityMapper;
import cq.yezi.dao.HotelMapper;
import cq.yezi.dao.RoomMapper;
import cq.yezi.model.Hotel;
import cq.yezi.model.HotelFacility;
import cq.yezi.model.Room;
import cq.yezi.model.VacantRoom;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 酒店信息
 */
@Service
public class HotelService {
    private HotelMapper hotelMapper;
    private RoomMapper roomMapper;
    private HotelFacilityMapper facilityMapper;

    @Autowired
    public void setHotelMapper(HotelMapper hotelMapper) {
        this.hotelMapper = hotelMapper;
    }

    @Autowired
    public void setRoomMapper(RoomMapper roomMapper) {
        this.roomMapper = roomMapper;
    }

    @Autowired
    public void setFacilityMapper(HotelFacilityMapper facilityMapper) {
        this.facilityMapper = facilityMapper;
    }

    /**
     * 获取酒店列表
     *
     * @param params the params
     * @return the list
     */
    public List<Hotel> getHotelList(SearchParam params) {
        List<Hotel> list = hotelMapper.getList(params.getParams());
        return list;
    }

    /**
     * 获取酒店详情
     *
     * @param id 酒店id
     * @return 酒店信息
     */
    public Hotel getHotel(int id) {
        return hotelMapper.getHotel(id);
    }

    /**
     * 获取房型列表
     *
     * @param params the params
     * @return the list
     */
    public List<Room> getRoomList(SearchParam params) {
        List<Room> list = roomMapper.getList(params.getParams());
        if (list.size() > 0) {
            List<HotelFacility> facilityList = facilityMapper.getList();
            List<VacantRoom> remainingNumList = roomMapper.getRoomRemainingNum(params.getParams());
            for (Room room : list) {
                //加载房间设施列表
                String[] rfArray = room.getRoomFacility().split(",");
                if (rfArray.length > 0 && !StringUtils.isBlank(rfArray[0])) {
                    int[] rfIdArray = new int[rfArray.length];
                    for (int i = 0; i < rfArray.length; i++) {
                        try {
                            rfIdArray[i] = Integer.parseInt(rfArray[i]);
                        } finally {
                        }
                    }
                    List<HotelFacility> roomFacilityList = new ArrayList<HotelFacility>();
                    for (HotelFacility facility : facilityList) {
                        if (ArrayUtils.contains(rfIdArray, facility.getFacilityId()))
                            roomFacilityList.add(facility);
                    }
                    room.setRoomFacilityList(roomFacilityList);
                }
                //设置是否有空房
                for (VacantRoom vacantRoom : remainingNumList) {
                    if (vacantRoom.getRoomId() == room.getRoomId() && vacantRoom.getRemainingNum() > 0)
                        room.setHasVacantRoom(true);
                    else
                        room.setHasVacantRoom(false);
                }
            }
        }
        return list;
    }

    /**
     * 获取相似酒店
     *
     * @param cityId 城市id
     * @param areaId 商圈id
     * @return the similar list
     */
    public List<Hotel> getSimilarHotelList(int cityId, int areaId) {
        List<Hotel> list = hotelMapper.getSimilarList(cityId, areaId);
        return list;
    }

    /**
     * 获取房型信息
     *
     * @param roomId 房型id
     * @return 房型信息
     */
    public Room getRoom(int roomId) {
        return roomMapper.getRoom(roomId);
    }
}
