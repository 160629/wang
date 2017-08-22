new Vue({
    el: '#app',
    data: function () {
        return {
            HotelList: [],
            Search: {
                pageNum: 1,
                pageSize: 10,
                cityId: 0,
                checkInDate: '',
                checkOutDate: '',
                maxRoomPerson: 1
            },
            TotalPage: 0,
            SearchCityName: '',

            CityList: [],
        }
    },
    created: function () {
        this.Search.cityId = parseInt($("#hiddenCityId").val());
        this.SearchCityName = $("#hiddenCityName").val();
        this.Search.checkInDate = $("#hiddenCheckInDate").val();
        this.Search.checkOutDate = $("#hiddenCheckOutDate").val();
        this.Search.maxRoomPerson = parseInt($("#hiddenMaxRoomPerson").val());
        if (!(this.Search.checkInDate && this.Search.checkOutDate)) {
            var nowDate = new Date();
            this.Search.checkInDate = nowDate.format("yyyy-MM-dd");
            nowDate = nowDate.addDate(1);
            this.Search.checkOutDate = nowDate.format("yyyy-MM-dd");
        }
        this.getCityList();
        this.getHotelList();
    },
    methods: {
        onSearch: function () {
            if (this.Search.checkInDate && this.Search.checkOutDate) {
                this.getHotelList();
            }
        },
        getCityList: function () {
            var _self = this;
            var loading = loadingShow();
            $.post('/home/citylist', function (data) {
                _self.CityList = data;
                loading.loadingHide();
            }).error(function (error) {
                loading.loadingHide();
            });
        },
        getHotelList: function () {
            var _self = this;
            var loading = loadingShow();
            $.post('/hotel/get_list', this.Search, function (data) {
                _self.HotelList = data;
                //_self.TotalPage = data.totalPage;
                loading.loadingHide();
            }).error(function (error) {
                loading.loadingHide();
            });
        },
        showCitys: function () {
            $(".target").toggle();
        },
        changeCity: function (city) {
            this.SearchCityName = city.cityName;
            this.Search.cityId = city.cityId;
            $(".target").hide();
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
        onSubNum: function () {
            if (this.Search.maxRoomPerson > 1) {
                this.Search.maxRoomPerson--;
            }
        },
        onAddNum: function () {
            if (this.Search.maxRoomPerson < 100) {
                this.Search.maxRoomPerson++;
            }
        }
    }
});