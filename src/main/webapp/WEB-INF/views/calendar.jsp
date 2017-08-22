<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<template id="calendarTemplate">
    <!--日期选择器开始-->
    <div class="timePickers clearfix">
        <span class="triangle timeTriangle"></span>
        <div class="leftCalendar f-l">
            <span class="leftArrow" v-on:click="onPrev"></span>
            <div class="currentdate">
                <span>{{LeftCalendar.Year}}</span>
                <span>年</span>
                <span>{{LeftCalendar.Month}}</span>
                <span>月</span>
            </div>
            <div class="week">
                <ul class="clearfix">
                    <li><span>日</span></li>
                    <li><span>一</span></li>
                    <li><span>二</span></li>
                    <li><span>三</span></li>
                    <li><span>四</span></li>
                    <li><span>五</span></li>
                    <li><span>六</span></li>
                </ul>
            </div>
            <div class="days">
                <ul class="clearfix">
                    <li v-for="item in LeftCalendar.Days"
                        v-bind:class="{today:item.IsToday,checkInday:item.IsInday,chosed:item.IsChosed,checkOutday:item.IsOutday}">
                        <span v-on:click="onSelect(LeftCalendar.Year,LeftCalendar.Month,item.Day)">{{item.IsToday?"今":item.Day}}</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="rightCalendar f-r">
            <span class="rightArrow" v-on:click="onNext"></span>
            <div class="currentdate">
                <span>{{RightCalendar.Year}}</span>
                <span>年</span>
                <span>{{RightCalendar.Month}}</span>
                <span>月</span>
            </div>
            <div class="week">
                <ul class="clearfix">
                    <li><span>日</span></li>
                    <li><span>一</span></li>
                    <li><span>二</span></li>
                    <li><span>三</span></li>
                    <li><span>四</span></li>
                    <li><span>五</span></li>
                    <li><span>六</span></li>
                </ul>
            </div>
            <div class="days">
                <ul class="clearfix">
                    <li v-for="item in RightCalendar.Days"
                        v-bind:class="{today:item.IsToday,checkInday:item.IsInday,chosed:item.IsChosed,checkOutday:item.IsOutday}">
                        <span v-on:click="onSelect(RightCalendar.Year,RightCalendar.Month,item.Day)">{{item.IsToday?"今":item.Day}}</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--日期选择器结束-->
</template>
