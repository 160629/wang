<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>500错误</title>
    <link rel="stylesheet" type="text/css" href="${stcCurrentDomain}/static/css/reset.min.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/common.css${stcVersion }" />
    <link rel="stylesheet" href="${stcCurrentDomain}/static/css/500erro.css${stcVersion }" />
</head>

<body>
<div class="wrapper">

    <%@include file="WEB-INF/views/header.jsp"%>

    <!-- 主体开始-->
    <div class="main">
        <div class="errorImg">
            <img src="${stcCurrentDomain}/static/image/error/500.png" alt=""/>
        </div>
        <div class="errorTips">
            <p>oops..页面出问题了</p>
        </div>
        <div>
            <a class="defaultBtn" href="/home/index">返回首页好了</a>
        </div>
        <div class="lineBottom"></div>
    </div>
    <!-- 主体结束-->

</div>
<script src="${stcCommonDomain}/jquery/jquery-1.11.3.min.js${stcVersion }"></script>
<script src="${stcCurrentDomain}/static/js/common.js${stcVersion }"></script>
</body>
</html>
