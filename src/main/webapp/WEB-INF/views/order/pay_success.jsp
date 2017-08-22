<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>支付成功</title>
    <link rel="stylesheet" type="text/css" href="${stcCurrentDomain}/static/css/reset.min.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/common.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/pay_success.css${stcVersion }" />
</head>

<body>
<div class="wrapper">

    <%@include file="../header.jsp"%>

    <!--主体部分开始-->
    <div class="main">

        <!--title部分开始-->
        <div class="currentPosition">
            <h2>
                <a href="order.html" class="warn">返回上一页</a>
            </h2>
        </div>
        <!--title部分结束-->


        <!--主体内容块开始-->
        <div class="mainContent clearfix">

            <!--支付成功提示开始-->
            <div class="payStatus">
                <div class="successImg">
                    <img src="${stcCurrentDomain}/static/image/pay_success/circle.png" alt=""/>
                </div>
                <div class="currentStatus">
                    <h2>支付成功</h2>
                </div>
                <div class="notice">
                    <p>您的预订已确认，入住须知将发送到XXXX@XX.com 邮箱中。</p>
                </div>
            </div>
            <!--支付成功提示结束-->


            <div class="line"></div>

            <!-- 预定明细开始-->
            <div class="schedule">
                <h2 class="schedulTtitle">预定明细</h2>


                <!--酒店预订信息-->
                <div class="hotelInfo">
                    <h3 class=" commodityTitle">法租界独门花园Loft古典新中式洋楼</h3>
                    <div class="clearfix">
                        <div class="f-l hotelImg">
                            <img src="" alt=""/>
                        </div>
                        <div class="f-l hotelDetail">

                            <div class="clearfix hotelTime">
                                <div class="f-l">
                                    <span class="detailTitle">入住日期:</span>
                                    <span>2017–5-20</span>
                                </div>
                                <div class="f-l">
                                    <span class="detailTitle">退房日期:</span>
                                    <span>2017–5-25</span>
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
                            <div class="roomAddress">
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
                        <span>实付金额</span>
                        <span>¥1800</span>
                    </div>
                    <div class="checkBtn">
                        <a href="/order/detail" role="button" class="defaultBtn">查看订单</a>
                    </div>
                </div>
                <!-- 订单信息  -->
            </div>
            <!-- 预定明细结束-->


            <div class="line"></div>

            <!-- 赚取旅行基金-->
            <div class="travalFund">
                <h2>赚取更多旅行基金</h2>
                <div class="share">
                    <span>分享你的专属链接给好友，当好友使用椰子住宿预订民宿时，你们均能获得XXX元礼券</span>
                    <a href="#">
                        查看详情
                    </a>
                </div>
            </div>
            <!-- 赚取旅行基金结束-->


        </div>
        <!--主体内容块结束-->
    </div>
    <!--主体部分结束-->

    <%@include file="../footer.jsp"%>

</div>
<script src="${stcCommonDomain}/jquery/jquery-1.11.3.min.js${stcVersion }"></script>
<script src="${stcCurrentDomain}/static/js/common.js${stcVersion }"></script>
</body>
</html>
