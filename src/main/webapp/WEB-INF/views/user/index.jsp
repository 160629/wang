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
            <div class="rightPanel f-r" >
                <div class="userInfoWrap">
                    <div class="clearfix portrait">
                        <label for="">头像</label>
                        <img src="${stcCurrentDomain}/static/image/personal/portrait.png" alt=""/>
                    </div>
                    <div class="clearfix">
                        <label for="">姓名</label>
                        <input type="text" placeholder="" value="阿呆"/>
                    </div>
                    <div class="clearfix">
                        <label for="">电话</label>
                        <input type="text" placeholder="" value="18903320487"/>
                    </div>
                    <div class="clearfix">
                        <label for="">邮箱</label>
                        <input type="text" placeholder="" value="xxxx@qq.com"/>
                    </div>
                    <div class="clearfix">
                        <label for="">已连接账户</label>
                        <input type="button" value="Facebook"/>
                    </div>
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
<script src="${stcCurrentDomain}/static/js/user/index.js${stcVersion }"></script>
</body>
</html>
