<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>民宿详情</title>
    <link rel="stylesheet" type="text/css" href="${stcCurrentDomain}/static/css/reset.min.css${stcVersion }"/>
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/common.css${stcVersion }"/>
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/detail.css${stcVersion }"/>
    <style>
        [v-cloak] {
            display: none;
        }
    </style>
</head>

<body>
<div class="wrapper">

    <%@include file="../header.jsp" %>

    <div class="main">
        <!-- 页面导航部分-->
        <div class="currentPosition">
            <h2>
                <a href="/hotel/list" class="warn">搜索列表</a>
                <a href="javascript:void(0)" class="slash">/</a>
                <a href="javascript:void(0)">民宿详情</a>
            </h2>
        </div>
        <!-- 页面导航部分-->
        <div class="mainContent clearfix">

            <!-- 主体第一部分-->
            <div class="details">
                <div class="clearfix">
                    <h2 class="f-l hotelName commodityTitle">${Hotel.hotelName}</h2>
                    <div class="f-r unitPrice">
                        <span class="price">￥${Hotel.price}</span>
                        <span class="unit">/晚 起</span>
                        <a href="#checkRoomType" role="button" class="orderBtn checkDetailBtn">查看房型</a>
                    </div>
                </div>

                <div class="features">
                    <p class="commoditySubTitle">${Hotel.subTitle}</p>
                </div>

                <div class="roomAddress clearfix">
                    <a href="javascript:void(0)" class="businessCirle">${Hotel.areaName}</a>
                    <a href="javascript:void(0)" class="addressDetail">${Hotel.hotelAddress}</a>
                    <a href="#checkMap" class="checkMap lightBlue">查看地图</a>
                </div>

                <!--轮播图-->
                <div class="silder clearfix">
                    <div class="sliderWrapper f-l" id="sliderWrapper">
                        <ul class="clearfix sliderUl">
                            <c:forEach var="picItem" items="${Hotel.hotelPicList}">
                                <li>
                                    <img src="${yeziImgDomain}${picItem.pic}" alt=""/>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="thumbnailWrapper f-l">
                        <div class="prveStep">
                            <img src="${stcCurrentDomain}/static/image/detail/order_detail_arrow_up.png" alt="">
                        </div>
                        <div class="ulWrapper">
                            <ul class="">
                                <c:forEach var="picItem" items="${Hotel.hotelPicList}" varStatus="i">
                                    <c:choose>
                                        <c:when test="${i.first}">
                                            <li class="active">
                                                <img src="${yeziImgDomain}${picItem.pic}" alt=""/>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <img src="${yeziImgDomain}${picItem.pic}" alt=""/>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="nextStep">
                            <img src="${stcCurrentDomain}/static/image/detail/order_detail_arrow_down.png" alt="">
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--轮播图结束-->
            </div>
            <!-- 主体第一部分结束-->

            <!-- 首次下单优惠提示-->
            <%-- <div class="newCustomer">
                 <span class="giftIcon"></span>
                 <span>首次下单使用优惠码 XXX，可减免房费 XX 元。</span>
             </div>--%>
            <!-- 首次下单优惠提示-->

            <!--房间介绍-->
            <div class="description clearfix">
                <div class="f-l roomTitle">
                    <p>房间介绍</p>
                </div>
                <div class="f-r content">
                    <p>${Hotel.hotelInfo.replaceAll("\\r\\n","<br />")}</p>
                </div>
            </div>
            <!--房间介绍-->

            <div id="app">
                <!--房型列表,优惠套餐,搜索框-->
                <div id="checkRoomType" class="clearfix choseWrap">
                    <!-- 点击房型列表 和 优惠套餐 分别显示不同的内容-->
                    <ul class="buttonWrap f-l">
                        <li class="f-l roomLists actived" action="roomList">房型列表</li>
                        <%--<li class="f-l discountPackage " action="discountPackage">优惠套餐</li>--%>
                        <li class="clear"></li>
                    </ul>
                    <!-- 点击房型列表 和 优惠套餐 分别显示不同的内容-->

                    <!-- 选择入住时间和退房时间-->
                    <div class="f-r checkStates ">
                        <div class="f-l timePickWrap datePicker">
                            <div class="clearfix" v-on:click="showDate">
                                <div class="f-l checkIn">
                                    <label>入住时间</label>
                                    <input type="text" v-bind:value="Search.checkInDate" readonly/>
                                </div>
                                <div class="f-r checkOut">
                                    <label>退房时间</label>
                                    <input type="text" v-bind:value="Search.checkOutDate" readonly/>
                                </div>
                            </div>
                            <yezi-calendar-component v-bind:check-in-date="Search.checkInDate"
                                                     v-bind:check-out-date="Search.checkOutDate"
                                                     v-on:listen-checkin-event="onCheckInDate"
                                                     v-on:listen-checkout-event="onCheckOutDate">
                            </yezi-calendar-component>
                        </div>
                        <div class="f-r ">
                            <input type="button" class="searchBtn" value="搜索" v-on:click="onSearch">
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- 选择入住时间和退房时间-->
                </div>
                <!--房型列表,优惠套餐,搜索框结束-->

                <div class="roomContent">
                    <!--点击房型列表显示内容-->
                    <div class="listContent" action="roomList" v-cloak>
                        <ul class="listTitle clearfix">
                            <li class="roomInfo">房间信息</li>
                            <li class="facilities">房间设施</li>
                            <li class="counts">入住人数</li>
                            <li class="charge">费用</li>
                        </ul>

                        <ul v-for="item in RoomList" class="listConten clearfix">
                            <li class="roomInfo">
                                <div class="f-l ">
                                    <a href="">
                                        <img v-bind:src="'${yeziImgDomain}'+item.roomPic" alt="">
                                    </a>
                                </div>

                                <div class="describe f-l">
                                    <h2 class="roomType">{{item.roomName}}</h2>
                                    <div class="roomDetail">
                                        <p>房型：{{item.typeName}}</p>
                                        <p>{{item.roomDesc}}</p>
                                        <p>{{item.roomBed}}</p>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li class="facilities">
                                <div>
                                    <div v-for="rfItem in item.roomFacilityList" class="clearfix facility">
                                        <span class="facilityIcon f-l"
                                              v-bind:class="'facilityIcon'+rfItem.facilityId"></span>
                                        <span class="IconCont f-l">{{rfItem.facilityName}}</span>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li class="counts">
                                <p style="line-height:2.2rem;">最多{{item.roomPerson}}人</p>
                            </li>
                            <li class="charge f-r">
                                <div class="chargeContainer">
                                    <div class="unitPrice">
                                        <span class="unit">均价</span>
                                        <span class="price">￥{{item.roomPrice}}</span>
                                    </div>
                                    <div v-if="item.hasVacantRoom">
                                        <a href="javascript:;" class="bookBtn" role="button"
                                           v-on:click="goto(item.roomId)">立即预订</a>
                                    </div>
                                    <div v-else>
                                        <a href="javascript:void(0)" class="noRoomBtn" role="button">无房</a>
                                    </div>
                                </div>
                            </li>
                        </ul>

                    </div>
                    <!--点击房型列表显示内容-->

                    <!--点击优惠套餐显示内容-->
                    <%--<div class="discountContent" action="discountPackage" >
                        <div class="packageCon clearfix">

                            <div class="f-l">
                                <img src="${stcCurrentDomain}/static/image/detail/img_img_12.png" alt="">
                                <div>
                                    <p>情侣双人房</p>
                                </div>
                            </div>

                            <div class="addIconWrap f-l">
                                <span class="addIcon"></span>
                            </div>

                            <div class="f-l packageMain active" action="travelSteward" style="">
                                <img src="${stcCurrentDomain}/static/image/detail/img_img_13.png" alt="">
                                <div>
                                    <label for="travelSteward" class="checkbox checked ">
                                        <span class="checkIcon "></span>
                                        <input type="checkbox" id="travelSteward" class="" checked>日本旅行管家
                                    </label>
                                </div>
                            </div>

                            <div class="addIconWrap f-l">
                                <span class="addIcon"></span>
                            </div>

                            <div class=" packageMain f-l" action="experience">
                                <img src="${stcCurrentDomain}/static/image/detail/img_img_14.png" alt="">
                                <div>
                                    <label for="experience" class="checkbox">
                                        <span class="checkIcon"></span>
                                        <input type="checkbox" id="experience">当地旅行体验
                                    </label>
                                </div>
                            </div>

                            <div class="equalIconWrap f-l">
                                <span class="equalIcon"></span>
                            </div>

                            <div class=" TotalPriceWrap">
                                <div class="TotalPrice ">
                                    <span>总价：</span>
                                    <span>1699</span>
                                </div>
                                <div>
                                    <a href="/order/add" class="warnBtn bookBtn" role="button" >立即预订</a>
                                </div>
                            </div>

                        </div>

                        <div class="service">

                            <div class="serviceDetail clearfix">
                                <p class="f-l">服务详情</p>
                                <p class="f-r">费用</p>
                            </div>

                            <div class="searveContent">
                                <!-- 点击日本旅行管家显示内容块-->
                                <div class="serviceCon" action="travelSteward">
                                    <span class="triangleIcon"></span>
                                    <div class="clearfix">
                                        <div class="f-l">
                                            <div class="f-l serviceImg">
                                                <img src="${stcCurrentDomain}/static/image/detail/img_img_15.png" alt="">
                                            </div>

                                            <div class="f-l serveContent">
                                                <h2 class="serviceName">全程旅行管家 VIP 超赞套餐</h2>
                                                <p class="validity ">日本5年内不限次使用</p>
                                                <div class="checkDetail">
                                                    <a href="" class="lightBlue">查看详情</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="f-r choseSerivece">
                                            <div class="unitPrice">
                                                <span class="price">￥999</span>
                                                <span class="unit">/晚 起</span>
                                            </div>
                                            <div>
                                                <input type="button" class="choseBtn " value="选择">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                        <div class="f-l">
                                            <div class="f-l serviceImg">
                                                <img src="${stcCurrentDomain}/static/image/detail/img_img_16.png" alt="">
                                            </div>

                                            <div class="f-l serveContent">
                                                <h2 class="serviceName">全程旅行管家 VIP 超赞套餐</h2>
                                                <p class="validity ">日本5年内不限次使用</p>
                                                <div class="checkDetail">
                                                    <a href="" class="lightBlue">查看详情</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="f-r choseSerivece">
                                            <div class="unitPrice">
                                                <span class="price">￥999</span>
                                                <span class="unit">/晚 起</span>
                                            </div>
                                            <div>
                                                <input type="button" class="choseBtn" value="选择">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 点击日本旅行管家显示内容块-->


                                <!-- 点击当地旅行体验显示内容块-->
                                <div class="serviceCon" action="experience" >
                                    <span class="triangleIcon"></span>
                                    <div class="clearfix">
                                        <div class="f-l">
                                            <div class="f-l serviceImg">
                                                <img src="${stcCurrentDomain}/static/image/detail/img_img_15.png" alt="">
                                            </div>

                                            <div class="f-l serveContent">
                                                <h2 class="serviceName">全程旅行管家 VIP 超赞套餐</h2>
                                                <p class="validity ">日本5年内不限次使用</p>
                                                <div class="checkDetail">
                                                    <a href="" class="lightBlue">查看详情</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="f-r choseSerivece">
                                            <div class="unitPrice">
                                                <span class="price">￥999</span>
                                                <span class="unit">/晚 起</span>
                                            </div>
                                            <div>
                                                <input type="button" class="choseBtn" value="选择">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                        <div class="f-l">
                                            <div class="f-l serviceImg">
                                                <img src="${stcCurrentDomain}/static/image/detail/img_img_16.png" alt="">
                                            </div>

                                            <div class="f-l serveContent">
                                                <h2 class="serviceName">全程旅行管家 VIP 超赞套餐</h2>
                                                <p class="validity ">日本5年内不限次使用</p>
                                                <div class="checkDetail">
                                                    <a href="" class="lightBlue">查看详情</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="f-r choseSerivece">
                                            <div class="unitPrice">
                                                <span class="price">￥999</span>
                                                <span class="unit">/晚 起</span>
                                            </div>
                                            <div>
                                                <input type="button" class="choseBtn" value="选择">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 点击当地旅行体验显示内容块-->
                            </div>
                        </div>

                    </div>--%>
                    <!--点击优惠套餐显示内容-->
                </div>
            </div>

            <!--住宿位置,退款政策,预定须知-->
            <div class="positionWrap" id="checkMap">
                <div class="clearfix container position">
                    <div class="f-l leftPanel">住宿位置</div>
                    <div class="f-r rightPanel">
                        <iframe src="http://map.baidu.com/" frameborder="0"></iframe>
                    </div>
                </div>
            </div>

            <div class="clearfix container refundPolicy">
                <div class="f-l leftPanel">退款政策</div>
                <div class="f-r rightPanel">
                    <div class="clearfix aboutRefund">
                        <div class="f-l">
                            <span>全额退款</span>
                        </div>
                        <div class="f-l Twentydays">
                            <input type="button" value="前20天">
                            <span>退70%</span>
                        </div>
                        <div class="f-l Tendays">
                            <input type="button" value="前10天">
                            <span>退70%</span>
                        </div>
                    </div>
                    <div class="refundRate">
                        <img src="${stcCurrentDomain}/static/image/detail/img_time.png" alt="">
                        <span>入住时间</span>
                    </div>
                </div>
            </div>

            <div class="clearfix container reservationNote">
                <div class="f-l leftPanel">预定须知</div>
                <div class="f-r rightPanel">
                    <p>${Hotel.reservationInstruction.replaceAll("\\r\\n","<br />")}</p>
                </div>
            </div>


            <div class="similar">
                <div class="similarTitle">
                    <h2>相似民宿</h2>
                </div>
                <div id="appSimilarHotel">
                    <ul class="clearfix" v-cloak>
                        <li v-for="item in SimilarHotelList" class="">
                            <a v-bind:href="'/hotel/detail?id='+item.hotelId">
                                <img v-bind:src="'${yeziImgDomain}'+item.hotelPic" alt="">
                                <div class="price clearfix">
                                    <span class="currentPrice unitPrice f-l">
                                        <span class="price">¥{{item.price}}</span>
                                        <span class="unit">/ 晚</span>
                                        <%--<span class="originalPrice">999</span>--%>
                                    </span>
                                </div>
                                <div class="roomName commodityTitle">
                                    <p class="commodityTitle">{{item.hotelName}}</p>
                                </div>
                                <div class="roomDetail commoditySubTitle">
                                    <p class="commoditySubTitle">{{item.subTitle}}</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%@include file="../footer.jsp" %>
    <input id="hiddenHotelId" type="hidden" value="${Hotel.hotelId}"/>
    <input id="hiddenCheckInDate" type="hidden" value="${checkInDate}"/>
    <input id="hiddenCheckOutDate" type="hidden" value="${checkOutDate}"/>
    <input id="hiddenCityId" type="hidden" value="${Hotel.cityId}"/>
    <input id="hiddenAreaId" type="hidden" value="${Hotel.areaId}"/>

    <%@include file="../calendar.jsp" %>
</div>

<script type="text/javascript" src="${stcCommonDomain}/jquery/jquery-1.11.3.min.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCommonDomain}/controls/cq-datedata.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCommonDomain}/vue2.0/vue.min.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/common.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/vue.yezi-calendar.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/hotel/detail.js${stcVersion }"></script>
</body>
</html>
