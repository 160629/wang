$(function () {
    //轮播相关的js
    //关键函数：通过控制i ，来显示图片
    var index = 0;
    var length = $(".sliderUl li").length;
    var i = 1;

    //遮罩层
    var str = '<div class="maskWrap"><div class="mask"></div><p class="maskCon"></P></div>';
    //默认第一个图片显示遮罩层和数字
    var firstImg = $(".thumbnailWrapper li").eq(0);
    firstImg.append(str);
    firstImg.find(".maskCon").html(i + " / " + length);

    function showImg(i) {

        $(".sliderUl li").eq(i).stop(true, true).fadeIn(800);
        $(".sliderUl li").eq(i).siblings().hide();
        $(".thumbnailWrapper li").eq(i).addClass("active");
        $(".thumbnailWrapper li").eq(i).append(str);
        $(".thumbnailWrapper li").eq(i).find(".maskCon").html(i + 1 + " / " + length);
        $(".thumbnailWrapper li").eq(i).siblings().removeClass("active");
        $(".thumbnailWrapper li").eq(i).siblings().find(".maskWrap").remove();
    }

    function slideNext() {
        if (index >= 0 && index < length - 1) {
            ++index;
            showImg(index);
        } else {
            return false;
        }
        if (i < 0 || i > length - 4) {
            return false;
        }
        var liHeight = $(".thumbnailWrapper ul li").outerHeight();
        $(".thumbnailWrapper ul").animate({"top": "-=" + liHeight + "px"}, 200);
        i++;
    }

    function slideFront() {
        if (index >= 1) {
            --index;
            showImg(index);
        }
        if (i < 2 || i > length + 4) {
            return false;
        }
        var liHeight = $(".thumbnailWrapper ul li").outerHeight();
        $(".thumbnailWrapper ul").animate({"top": "+=" + liHeight + "px"}, 200);
        i--;
    }

    $(".nextStep").click(function () {
        slideNext();
    })
    $(".prveStep").click(function () {
        slideFront();
    })
    $(".thumbnailWrapper ul li").click(function () {
        index = $(".thumbnailWrapper ul li").index(this);
        showImg(index);
    });
});

new Vue({
    el: '#app',
    data: function () {
        return {
            RoomList: [],
            Search: {
                pageNum: 1,
                pageSize: 10,
                hotelId: 0,
                checkInDate: '',
                checkOutDate: '',
                maxRoomPerson: 0
            }
        }
    },
    created: function () {
        this.Search.hotelId = parseInt($("#hiddenHotelId").val());
        if ($("#hiddenCheckInDate").val() && $("#hiddenCheckOutDate").val()) {
            this.Search.checkInDate = $("#hiddenCheckInDate").val();
            this.Search.checkOutDate = $("#hiddenCheckOutDate").val();
        } else {
            var nowDate = new Date();
            this.Search.checkInDate = nowDate.format("yyyy-MM-dd");
            nowDate = nowDate.addDate(1);
            this.Search.checkOutDate = nowDate.format("yyyy-MM-dd");
        }
        this.getRoomList();
    },
    methods: {
        onSearch: function () {
            if (this.Search.checkInDate && this.Search.checkOutDate) {
                this.getRoomList();
            }
        },
        getRoomList: function () {
            var _self = this;
            var loading = loadingShow();
            $.post('/hotel/get_room_list', this.Search, function (data) {
                _self.RoomList = data;
                loading.loadingHide();
            }).error(function (error) {
                loading.loadingHide();
            });
        },
        showDate: function () {
            $(".timePickers").toggle();
        },
        onCheckInDate: function (date) {
            this.Search.checkInDate = date;
        },
        onCheckOutDate: function (date) {
            this.Search.checkOutDate = date;
        },
        goto: function (roomId) {
            location = "/order/add?roomid=" + roomId +
                "&checkindate=" + this.Search.checkInDate +
                "&checkoutdate=" + this.Search.checkOutDate;
        }
    }
});

new Vue({
    el: '#appSimilarHotel',
    data: function () {
        return {
            CityId: 0,
            AreaId: 0,
            SimilarHotelList: []
        }
    },
    created: function () {
        this.CityId = parseInt($("#hiddenCityId").val());
        this.AreaId = parseInt($("#hiddenAreaId").val());
        this.getSimilarHotelList();
    },
    methods: {
        getSimilarHotelList: function () {
            var _self = this;
            $.post('/hotel/get_similar_hotels', {cityId: this.CityId, areaId: this.AreaId}, function (data) {
                _self.SimilarHotelList = data;
            }).error(function (error) {
            });
        }
    }
});
