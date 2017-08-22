$(function () {
    //关于轮播插件的参数设置
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false,
        loop: true
    });
});
new Vue({
    el: '#app',
    data: function () {
        return {
            Search: {
                pageNum: 1,
                pageSize: 10,
                cityId: 0,
                checkInDate: '',
                checkOutDate: '',
                maxRoomPerson: 1
            },
            SearchCityName: '城市',

            CityList: [],
        }
    },
    created: function () {
        this.getCityList();
    },
    methods: {
        onSearch: function () {
            if (this.Search.cityId > 0 && this.Search.checkInDate && this.Search.checkOutDate) {
                location = "/hotel/list?cityid=" + this.Search.cityId +
                    "&checkindate=" + this.Search.checkInDate +
                    "&checkoutdate=" + this.Search.checkOutDate +
                    "&maxroomperson=" + this.Search.maxRoomPerson;
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
