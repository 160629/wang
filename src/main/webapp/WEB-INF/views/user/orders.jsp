<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="${stcCurrentDomain}/static/css/reset.min.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/common.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/personal.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/myorder.css${stcVersion }" />
</head>

<body>
<div class="wrapper">

    <%@include file="../header.jsp"%>

    <!--主体部分开始-->
    <div class="main">
        <div class="currentPosition"></div>
        <!--主要内容部分开始-->
        <div class="mainContent clearfix">

            <%@include file="bodyleft.jsp"%>

            <!--右侧内容部分开始-->
            <div class="rightPanel f-r">

                <div class="orderListWrap">

                    <!-- 第一条订单记录-->
                    <div class="orderLists">

                        <div class="orderNum clearfix">
                            <span class="f-l">订单编号：03429756043</span>
                            <span class="f-r">12:00 20/3/2017 下单</span>
                        </div>
                        <div class="orderDetail clearfix">
                            <div class="f-l orderName">
                                <h2 class="commodityTitle">法租界独门花园Loft古典新中式洋楼</h2>
                                <img src="" alt="" />
                            </div>
                            <div class="f-l orderTime">
                                <p class="checkin">2017/05/12入住</p>
                                <p class="checkout">2017/05/16退房</p>
                                <p class="checkTime">共5晚</p>
                                <input type="button" class="orderBtn" value="双人间" />
                            </div>
                            <div class="f-l orderPrice">
                                <div>
                                    <h2 class="unitPrice">
                                        <span class="currencySymbol">¥</span>
                                        <span>4567</span>
                                    </h2>
                                    <p class="pending">待支付</p>
                                </div>
                                <div class="">
                                    <!--<a href="order.html" role="button" class="orderBtn warnBtn">去支付 </a>-->
                                    <a href="javascript:void(0)" role="button" class="orderBtn warnBtn paynow">去支付 </a>
                                </div>
                                <div>
                                    <a role="button" href="order_detail.html" class="orderBtn checkDetailBtn">查看详情</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 第一条订单记录结束-->

                    <!-- 第二条订单记录-->
                    <div class="orderLists">
                        <div class="orderNum clearfix">
                            <span class="f-l">订单编号：03429756043</span>
                            <span class="f-r">12:00 20/3/2017 下单</span>
                        </div>
                        <div class="orderDetail clearfix">
                            <div class="f-l orderName">
                                <h2 class="commodityTitle">大阪桥IO木屋</h2>
                                <img src="" alt="" />
                            </div>
                            <div class="f-l orderTime">
                                <p class="checkin">2017/05/12入住</p>
                                <p class="checkout">2017/05/16退房</p>
                                <p class="checkTime">共5晚</p>
                                <input type="button" class="orderBtn" value="双人间" />
                            </div>
                            <div class="f-r orderPrice">
                                <h2 class="unitPrice">
                                    <span class="currencySymbol">¥</span>
                                    <span>4567</span>
                                </h2>
                                <p class="paid ">已支付</p>
                                <div class="">
                                    <a href="javascript:void(0)" role="button" class="orderBtn disabledBtn">去支付</a>
                                </div>
                                <div>
                                    <a role="button" href="order_detail.html" class="orderBtn checkDetailBtn">查看详情</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- 第二条订单记录结束-->

                </div>
            </div>
            <!--右侧内容部分结束-->
            <div class="clear"></div>
        </div>
        <!--主要内容部分结束-->
    </div>
    <!--主体部分结束-->

    <%@include file="../footer.jsp"%>

</div>
<script src="${stcCommonDomain}/jquery/jquery-1.11.3.min.js${stcVersion }"></script>
<script src="${stcCurrentDomain}/static/js/common.js${stcVersion }"></script>
<script src="${stcCurrentDomain}/static/js/user/orders.js${stcVersion }"></script>

</body>
</html>
