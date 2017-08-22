<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>列表</title>
    <link rel="stylesheet" type="text/css" href="${stcCurrentDomain}/static/css/reset.min.css${stcVersion }"/>
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/common.css${stcVersion }"/>
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/list.css${stcVersion }"/>
    <style>
        [v-cloak] {
            display: none;
        }
    </style>
</head>

<body>
<div class="wrapper">

    <%@include file="../header.jsp" %>

    <!--主体部分开始-->
    <div id="app" class="main">
        <!--搜索框 部分开始-->
        <div class="searchContainer">
            <div class="searchWrap clearfix">
                <div class="search-condition f-l">
                    <!-- 选择目的地-->
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
                    <!-- 选择目的地结束-->
                    <!-- 选择入住退房时间-->
                    <div class="datePicker f-l">
                        <div class="pickerWrap" v-on:click="showDate">
                            <input type="text" v-bind:value="Search.checkInDate" readonly class="checkinInput"/>
                            <a href="javascript:void(0)" class="boundary"> - </a>
                            <input type="text" v-bind:value="Search.checkOutDate" readonly class="checkoutInput"/>
                        </div>
                        <yezi-calendar-component v-bind:check-in-date="Search.checkInDate"
                                                 v-bind:check-out-date="Search.checkOutDate"
                                                 v-on:listen-checkin-event="onCheckInDate"
                                                 v-on:listen-checkout-event="onCheckOutDate">
                        </yezi-calendar-component>
                    </div>
                    <!-- 选择入住退房时间-->
                    <!-- 选择住房人数-->
                    <div class="CountChange f-r">
                        <label class="f-l countLabel">入住人数</label>
                        <div class="f-r">
                            <a href="javascript:void(0)" class="reduceIcon f-l" v-on:click="onSubNum"></a>
                            <input type="text" class="f-l counts" v-bind:value="Search.maxRoomPerson" readonly/>
                            <a href="javascript:void(0)" class="addIcon f-r" v-on:click="onAddNum"></a>
                        </div>
                    </div>

                </div>
                <div class="search-btn f-r">
                    <button class="searchButton" v-bind:class="{active:Search.checkInDate && Search.checkOutDate}" v-on:click="onSearch">
                        <span class="searchIcon"></span>
                    </button>
                </div>
            </div>
        </div>
        <!--搜索框结束-->
        <!--具体商品列表 部分-->
        <div class="mainContent" v-cloak>
            <!-- 商品列表-->
            <div v-for="item in HotelList" class="roomlist clearfix">
                <a v-bind:href="'/hotel/detail?id=' + item.hotelId + '&checkindate=' + Search.checkInDate + '&checkoutdate=' + Search.checkOutDate"
                   class="linkPage" target="_blank">
                    <%--<div class="aboutPolicy">关于活动政策的描述...</div>--%>
                    <div class="f-l roomImg">
                        <img v-bind:src="'${yeziImgDomain}'+item.hotelPic" alt=""/>
                    </div>
                    <div class="f-l details">
                        <h2 class="proListTitle">{{item.hotelName}}</h2>
                        <p class="proListSubTitle">{{item.subTitle}}</p>
                        <div class="roomAddress clearfix">
                            <span class="businessCirle">{{item.areaName}}</span>
                            <span class="adress">{{item.hotelAddress}}</span>
                        </div>
                        <%--<div class="checkFont">
                            <p class="cancelFree">可免费取消</p>
                        </div>--%>
                        <div class="priceAndCount clearfix">
                            <div class="f-l roomOnly">仅剩{{item.roomNumberCount}}间</div>
                            <div class="f-r hotelPrice">
                                <span class="currentPrice List-unitPrice">
                                    <span class="price">¥ {{item.price}}</span>
                                    <span class="unit">/ 晚 起</span>
                                </span>
                                <%--<span class="priceStatues discount">惠</span>--%>
                                <%--<span class="priceStatues reducePrice">降</span>--%>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <!-- 商品列表结束-->
        </div>
        <!--具体商品列表 部分结束-->
    </div>
    <!--主体部分结束-->

    <%@include file="../footer.jsp" %>
    <input id="hiddenCityId" type="hidden" value="${cityId}"/>
    <input id="hiddenCityName" type="hidden" value="${cityName}"/>
    <input id="hiddenCheckInDate" type="hidden" value="${checkInDate}"/>
    <input id="hiddenCheckOutDate" type="hidden" value="${checkOutDate}"/>
    <input id="hiddenMaxRoomPerson" type="hidden" value="${maxRoomPerson}"/>

    <%@include file="../calendar.jsp" %>
</div>
<script type="text/javascript" src="${stcCommonDomain}/jquery/jquery-1.11.3.min.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCommonDomain}/controls/cq-datedata.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCommonDomain}/vue2.0/vue.min.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/common.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/vue.yezi-calendar.js${stcVersion }"></script>
<script type="text/javascript" src="${stcCurrentDomain}/static/js/hotel/list.js${stcVersion }"></script>
</body>
</html>
