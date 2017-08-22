<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>订单详情</title>
    <link rel="stylesheet" type="text/css" href="${stcCurrentDomain}/static/css/reset.min.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/common.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/order_detail.css${stcVersion }" />
</head>

<body>
<div class="wrapper">

    <%@include file="../header.jsp"%>

    <div class="main">
        <div class="currentPosition">
            <h2>
                <a href="myorder.html" class="warn">订单列表</a>
                <a href="javascript:void(0)" class="slash">/</a>
                <a href="javascript:void(0)">订单详情</a>
            </h2>
        </div>

        <div class="mainContent clearfix">

            <div class="currentState">
                <span>订单当前状态：</span>
                <span>已支付成功，未入住</span>
                <div class="SuccessTriangle"></div>
            </div>
            <div class="schedule">
                <!--酒店预订信息-->
                <div class="hotelInfo">
                    <h2 class="productInfo">商品信息</h2>
                    <h3 class=" commodityTitle">法租界独门花园Loft古典新中式洋楼</h3>
                    <div class="clearfix">
                        <div class="f-l hotelImg">
                            <img src="" alt="">
                        </div>
                        <div class="f-l hotelDetail">
                            <div class="clearfix hotelTime">
                                <div class="f-l">
                                    <span class="detailTitle">入住日期</span>
                                    <span>2017-5-20</span>
                                </div>
                                <div class="f-l">
                                    <span class="detailTitle">退房日期</span>
                                    <span>2017-5-25</span>
                                </div>

                                <div class="f-l totalTime">
                                    <span>共5晚</span>
                                </div>
                            </div>
                            <div class="clearfix roomInfo">
                                <div class="f-l">
                                    <span class="detailTitle">房间信息:</span>
                                    <span>双人间</span>
                                </div>
                                <div class="f-l">
                                    <span class="detailTitle">床型:</span>
                                    <span>大床房</span>
                                </div>
                                <div class="f-l roomNum">
                                    <span class="detailTitle">房间号:</span>
                                    <span>203</span>
                                </div>

                            </div>
                            <div class="roomAdress">
                                <span class="detailTitle">民宿地址：</span>
                                <span>民宿地址民宿地址22332民宿地址民宿地址</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!--酒店预订信息-->

                <!--入住信息-->
                <div class="checkinInfo">
                    <h2 class="titleInfo">入住信息</h2>
                    <div class="detailInfo">
                        <span class="passengerName">旅客①：</span>
                    </div>
                    <div class="detailInfo">
                        <span>姓名</span>
                        <span>阿呆</span>
                    </div>
                    <div class="detailInfo">
                        <span>电话</span>
                        <span>18903320487</span>
                    </div>
                </div>
                <!--入住信息-->


                <!-- 订单信息  -->
                <!--入住信息-->
                <div class="orderInfo">
                    <h2 class="titleInfo">订单信息</h2>
                    <div class="detailInfo">
                        <span>订单编号</span>
                        <span>18903320487</span>
                    </div>
                    <div class="detailInfo">
                        <span>下单时间</span>
                        <span>2017/2/30</span>
                    </div>
                    <div class="detailInfo">
                        <span>优惠金额</span>
                        <span>¥90</span>
                    </div>
                    <div class="detailInfo">
                        <span>应付金额</span>
                        <span class="warn">¥1800</span>
                    </div>

                    <div class="detailInfo">
                        <span>支付方式</span>
                        <span>微信支付</span>
                    </div>
                    <div class="detailInfo">
                        <span>订单状态</span>
                        <span>已支付</span>
                        <input type="button" class="orderBtn disabledBtn" value="去支付">
                    </div>
                </div>
                <!--入住信息-->
                <!-- 订单信息  -->
            </div>
        </div>
    </div>

    <%@include file="../footer.jsp"%>

</div>

<script src="${stcCommonDomain}/jquery/jquery-1.11.3.min.js${stcVersion }"></script>
<script src="${stcCurrentDomain}/static/js/common.js${stcVersion }"></script>
<script src="${stcCurrentDomain}/static/js/order/detail.js${stcVersion }"></script>
</body>
</html>
