<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>填写订单</title>
    <link rel="stylesheet" type="text/css" href="${stcCurrentDomain}/static/css/reset.min.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/common.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/order.css${stcVersion }" />
</head>

<body>
<div class="wrapper">

    <%@include file="../header.jsp"%>

    <!--主体部分开始-->
    <div class="main">

        <div class="currentPosition">
            <h2>
                <a href="detail.html" class="warn">民宿详情</a>
                <a href="javascript:void(0)" class="slash"> / </a>
                <a href="javascript:void(0)">填写订单</a>
            </h2>
        </div>

        <!-- 主体内容块开始-->
        <div class="mainContent clearfix">

            <!--左侧预定信息开始-->
            <div class="bookingInfo f-l">
                <div class="bookingTitle">
                    <h2>预订信息</h2>
                </div>
                <div class="costs">
                    <h3 class="businessName hotelName">酒店名称</h3>
                    <h2 class="costName">岛之内温馨小屋</h2>
                    <div class="bedtype">
                        <span>情侣双人房</span>
                        <span>大床房</span>
                    </div>
                    <div class="checkin-out">
                        <span class="checkIn">2017/5/20入住</span>
                        <span class="checkOut">2017/5/20退房</span>
                    </div>
                    <div class="count">
                        <p>共5晚</p>
                    </div>
                    <div class="unitPrice">
                        <p>小计：356 元</p>
                    </div>
                </div>
                <div class="costs">
                    <h3 class="businessName">服务名称</h3>
                    <h2 class="costName">大阪环球影城门票</h2>
                    <div class="count">
                        <p>2份</p>
                    </div>
                    <div class="unitPrice">
                        <p>小计：356 元</p>
                    </div>
                </div>
                <div class="costs">
                    <h3 class="businessName">其他费用</h3>
                    <h2 class="costName">清洁费</h2>
                    <div class="unitPrice">
                        <p>小计：356 元</p>
                    </div>
                </div>
                <div class="totalPrice">
                    <span>总计：</span>
                    <span>699元</span>
                </div>
            </div>
            <!--左侧预定信息结束-->

            <!--右侧下单人信息，入住信息，附加服务，支付订单 开始-->
            <div class="orderInfo f-r">
                <!-- 下单人信息-->
                <div class="aboutUser">
                    <div class="titleInfo">下单人信息</div>
                    <div class="orderDetail userInfo">
                        <div class="clearfix">
                            <div class="f-l">
                                <!-- class=wrong 是表单验证时候的样式-->
                                <div class="wrong">
                                    <label for="" class="label">姓</label>
                                    <input type="text" class="inputLarge" placeholder="" value=""/>
                                </div>
                                <!-- 验证的时候出现-->
                                <div class="verify warn" style="display:block">请您填写正确的姓名</div>
                            </div>
                            <div class="f-r">
                                <div>
                                    <label for="" class="label">名</label>
                                    <input type="text" class="inputLarge" placeholder=""/>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix">
                            <div class="f-l">
                                <label for="" class="label">邮箱</label>
                                <input type="text" class="inputLarge" placeholder=""/>
                            </div>
                            <div class="f-r">
                                <label for="" class="label">手机</label>
                                <input type="text" class="inputLarge" placeholder=""/>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 下单人信息-->

                <!--附加服务-->
                <div class="">
                    <div class="titleInfo addtionalTitle">附加服务</div>
                    <div class="orderDetail additional">

                        <div class="cleafix labelWrap ">
                            <label for="" class="f-l">是否加人:</label>
                            <div class="f-l">
                                <label for="allow" class="radio checked f-l">
                                    <span class="radioIcon f-l"></span>
                                    <input type="radio" checked class="f-l" id="allow" name="count"/>否
                                    <div class="clear"></div>
                                </label>
                                <label for="forbidden" class="radio f-l">
                                    <span class="radioIcon f-l"></span>
                                    <input type="radio" class="f-l" id="forbidden" name="count"/>是
                                    <div class="clear"></div>
                                </label>
                                <div class="clear"></div>
                            </div>
                            <div class="f-l addCount">
                                <a class="f-l reduceBtn" role="button">-</a>
                                <input type="text" class="f-l countInput" value="1" readonly/>
                                <a class="f-l addBtn" role="button">+</a>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="notice">需额外费用（每人日元 1000元 ）</div>
                        <div class="clearfix labelWrap">
                            <label for="" class="f-l">是否有3岁以下儿童:</label>
                            <div class="f-l">
                                <label for="hasChild" class="radio  f-l">
                                    <span class="radioIcon f-l"></span>
                                    <input type="radio" class="f-l" id="hasChild" name="children"/>否
                                    <div class="clear"></div>
                                </label>
                                <label for="belowThree" class="radio checked f-l">
                                    <span class="radioIcon f-l"></span>
                                    <input type="radio" checked class="f-l" name="children" id="belowThree"/>是
                                    <div class="clear"></div>
                                </label>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="unsuitable">
                            <p>该民宿不允许3岁以下的儿童入住，敬请谅解</p>
                        </div>
                    </div>
                </div>
                <!--附加服务-->

                <!--支付订单-->
                <div class="">
                    <div class="titleInfo payTitle">支付订单</div>
                    <div class="orderDetail payOrder">
                        <div class="payMethod">
                            <label for="">支付方式：</label>
                            <div class="methods clearfix">
                                <label for="weChat" class="Radio checked f-l">
                                    <span class="RadioIcon f-l"></span>
                                    <input type="radio" checked class="f-l" name="payment" id="weChat"/>微信支付
                                    <div class="clear"></div>
                                </label>
                                <label for="Alipay" class="Radio f-l">
                                    <span class="RadioIcon f-l"></span>
                                    <input type="radio" class="f-l" name="payment" id="Alipay"/>支付宝支付
                                    <div class="clear"></div>
                                </label>
                                <label for="credit" class="Radio f-l ">
                                    <span class="RadioIcon f-l"></span>
                                    <input type="radio" class="f-l" name="payment" id="credit"/>信用卡支付
                                    <div class="clear"></div>
                                </label>
                            </div>
                        </div>
                        <div class="payNow">
                            <a role="button" class="payBtn" href="/order/pay_success">立即付款</a>
                        </div>

                    </div>
                </div>
                <!--支付订单-->
            </div>
            <!--右侧下单人信息，入住信息，附加服务，支付订单 结束-->
        </div>
        <!-- 主体内容块结束-->
    </div>
    <!--主体部分结束-->

    <%@include file="../footer.jsp"%>

</div>
<script src="${stcCommonDomain}/jquery/jquery-1.11.3.min.js${stcVersion }"></script>
<script src="${stcCurrentDomain}/static/js/common.js${stcVersion }"></script>
<script src="${stcCurrentDomain}/static/js/order/add.js${stcVersion }"></script>
</body>
</html>
