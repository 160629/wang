<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="${stcCurrentDomain}/static/css/reset.min.css${stcVersion }"/>
    <link rel="stylesheet" href="${stcCommonDomain}/controls/swiper/swiper.min.css${stcVersion }">
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/common.css${stcVersion }"/>
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/index.css${stcVersion }"/>
</head>

<body>
<div class="wrapper">

    <%@include file="../header.jsp" %>

    <!--主体部分-->
    <div class="main">

        <!-- banner部分开始-->
        <div class="banner">

            <!--轮播部分-->
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="${stcCurrentDomain}/static/image/index/img_bg_1.png" alt=""/>
                    </div>
                    <div class="swiper-slide">
                        <img src="${stcCurrentDomain}/static/image/index/img_bg_2.png" alt=""/>
                    </div>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
                <!-- Add Arrows -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
            <!--轮播部分结束-->

            <!--搜索框开始-->
            <div class="searchContainer">
                <div id="app" class="searchWrap clearfix">
                    <!-- 左侧带边框部分-->
                    <div class="search-condition f-l">

                        <!-- 选择目的地，默认是橘色，值改变时颜色变成黑色-->
                        <div class="destination f-l">
                            <a href="javascript:void(0)" class="choseDest" v-on:click="showCitys"
                               v-text="SearchCityName"></a>
                            <div class="target">
                                <span class="TargetTriangle triangle"></span>
                                <ul class="targetUl">
                                    <li v-for="item in CityList" v-on:click="changeCity(item)">{{item.cityName}}</li>
                                </ul>
                            </div>
                        </div>

                        <!-- 选择入住和退房时间 ，默认是橘色，值改变时颜色变成黑色-->
                        <div class="datePicker f-l">
                            <div class="pickerWrap" v-on:click="showDate">
                                <input type="text" v-bind:value="Search.checkInDate||'入住日'" readonly
                                       class="checkinInput"/>
                                <a href="javascript:void(0)" class="boundary"> - </a>
                                <input type="text" v-bind:value="Search.checkOutDate||'退房日'" readonly
                                       class="checkoutInput"/>
                            </div>
                            <yezi-calendar-component v-bind:check-in-date="Search.checkInDate"
                                                     v-bind:check-out-date="Search.checkOutDate"
                                                     v-on:listen-checkin-event="onCheckInDate"
                                                     v-on:listen-checkout-event="onCheckOutDate">
                            </yezi-calendar-component>
                        </div>

                        <!-- 选择有几位客户，默认是橘色，值改变时颜色变成黑色-->
                        <div class="CountChange f-r">
                            <label class="f-l countLabel">入住人数</label>
                            <div class="f-r">
                                <a href="javascript:void(0)" class="reduceIcon f-l" v-on:click="onSubNum"></a>
                                <input type="text" class="f-l counts" v-bind:value="Search.maxRoomPerson" readonly/>
                                <a href="javascript:void(0)" class="addIcon f-r" v-on:click="onAddNum"></a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- 左侧带边框部分结束-->

                    <!-- 右侧搜索按钮-->
                    <div class="search-btn f-r">
                        <!-- 首页点击搜索，跳转到列表页-->
                        <button class="searchButton" v-bind:class="{active:Search.cityId > 0 && Search.checkInDate && Search.checkOutDate}" v-on:click="onSearch">
                            <span class="searchIcon"></span>
                        </button>
                    </div>
                    <!-- 右侧搜索按钮结束-->
                </div>
            </div>
            <!--搜索框结束-->

        </div>
        <!-- banner部分结束-->

        <!-- 主体内容部分-->
        <div class="mainContent">
            <!-- 酒店优势-->
            <div class="advantages clearfix">
                <div class="roomAdvantage">
                    <div class="goodness">
                        <h2>安心可靠</h2>
                    </div>
                    <div class="description">
                        <p>口袋地陪专注日本自由行</p>
                        <div class="imgdecor"></div>
                    </div>
                </div>
                <div class="roomAdvantage">
                    <div class="goodness">
                        <h2>舒适洁净</h2>
                    </div>
                    <div class="description">
                        <p>口袋地陪专注日本自由行</p>
                        <div class="imgdecor"></div>
                    </div>
                </div>
                <div class="roomAdvantage">
                    <div class="goodness">
                        <h2>出行服务</h2>
                    </div>
                    <div class="description">
                        <p>口袋地陪专注日本自由行</p>
                        <div class="imgdecor"></div>
                    </div>
                </div>
            </div>
            <!--酒店优势结束 -->
            <div class="boundry"></div>
            <!-- 热门城市开始-->
            <div class="hotCity">
                <div class="title">
                    <h2>热门城市</h2>
                </div>
                <div>
                    <ul class="clearfix">
                        <li class="">
                            <a href="/hotel/list?cityid=4">
                                <img src="${stcCurrentDomain}/static/image/index/home_city_tokoy.png" alt=""/>
                            </a>
                        </li>
                        <li class="">
                            <a href="/hotel/list?cityid=2">
                                <img src="${stcCurrentDomain}/static/image/index/home_city_daban.png" alt=""/>
                            </a>
                        </li>
                        <li class="">
                            <a href="/hotel/list?cityid=5">
                                <img src="${stcCurrentDomain}/static/image/index/home_city_jingdu.png" alt=""/>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 热门城市结束-->

            <!--精品民宿开始-->
            <div class="boutique">
                <div class="title">
                    <h2>精品民宿</h2>
                </div>
                <div>
                    <ul class="clearfix">
                        <li class="">
                            <a href="/hotel/detail?id=16" class="linkPage">
                                <img src="" alt=""/>

                                <div class="hotelPrice clearfix">
                                        <span class="currentPrice unitPrice f-l">
                                        <span class="price">¥699</span>
                                        <span class="unit">/晚</span>
                                        <span class="originalPrice ">999</span>
                                        </span>
                                </div>
                                <div class="roomName">
                                    <p class="commodityTitle">鹤清名古屋鹤清</p>
                                </div>
                                <div class="roomDetail">
                                    <p class="commoditySubTitle">适合小情侣的私密小屋</p>
                                </div>
                            </a>
                        </li>
                        <li class="">
                            <a href="/hotel/detail?id=16" class="linkPage">
                                <img src="" alt=""/>
                                <div class="hotelPrice clearfix">
                                        <span class="currentPrice unitPrice f-l">
                                        <span class="price">¥1099</span>
                                        <span class="unit">/晚</span>
                                        </span>
                                </div>
                                <div class="roomName">
                                    <p class="commodityTitle">艾爾小公寓雙人間</p>
                                </div>
                                <div class="roomDetail">
                                    <p class="commoditySubTitle">森系原创设计师作品”</p>
                                </div>
                            </a>
                        </li>
                        <li class="">
                            <a href="/hotel/detail?id=16" class="linkPage">
                                <img src="" alt=""/>
                                <div class="hotelPrice clearfix">
                                        <span class="currentPrice unitPrice f-l">
                                        <span class="price">¥890</span>
                                        <span class="unit">/晚</span>
                                        </span>
                                </div>
                                <div class="roomName">
                                    <p class="commodityTitle">KKI小公寓</p>
                                </div>
                                <div class="roomDetail">
                                    <p class="commoditySubTitle">森系原创设计师作品”</p>
                                </div>
                            </a>
                        </li>
                        <li class="">
                            <a href="/hotel/detail?id=16" class="linkPage">
                                <img src="" alt=""/>
                                <div class="hotelPrice clearfix">
                                        <span class="currentPrice unitPrice f-l">
                                        <span class="price">¥890</span>
                                        <span class="unit">/晚</span>
                                        <span class="originalPrice">999</span>
                                        </span>
                                </div>
                                <div class="roomName">
                                    <p class="commodityTitle">法租界独门花园Loft古典新中式洋楼</p>
                                </div>
                                <div class="roomDetail">
                                    <p class="commoditySubTitle">适合小情侣的私密小屋</p>
                                </div>
                            </a>
                        </li>
                        <li class="">
                            <a href="/hotel/detail?id=16" class="linkPage">
                                <img src="" alt=""/>
                                <div class="hotelPrice clearfix">
                                        <span class="currentPrice unitPrice f-l">
                                        <span class="price">¥1099</span>
                                        <span class="unit">/晚</span>
                                        </span>
                                </div>
                                <div class="roomName">
                                    <p class="commodityTitle">Japanese style room wt garden view</p>
                                </div>
                                <div class="roomDetail">
                                    <p class="commoditySubTitle">森系原创XXXXXXXXXXXXXXXX</p>
                                </div>
                            </a>
                        </li>
                        <li class="">
                            <a href="/hotel/detail?id=16" class="linkPage">
                                <img src="" alt=""/>
                                <div class="hotelPrice clearfix">
                                        <span class="currentPrice unitPrice f-l">
                                        <span class="price">¥890</span>
                                        <span class="unit">/晚</span>
                                        </span>
                                </div>
                                <div class="roomName">
                                    <p class="commodityTitle">大阪桥IO木屋</p>
                                </div>
                                <div class="roomDetail">
                                    <p class="commoditySubTitle">森系原创设计师作品”</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--精品民宿结束-->
        </div>
        <!--主体内容结束-->
    </div>
    <!--主体部分结束-->

    <%@include file="../footer.jsp" %>
    <%@include file="../calendar.jsp" %>
</div>
<script type="text/javascript" src="${stcCommonDomain}/jquery/jquery-1.11.3.min.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCommonDomain}/controls/swiper/swiper.min.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCommonDomain}/controls/cq-datedata.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCommonDomain}/vue2.0/vue.min.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/common.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/vue.yezi-calendar.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/home/index.js${stcVersion }"></script>
</body>
</html>
