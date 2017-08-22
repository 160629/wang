<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header部分-->
<div class="header clearfix">
    <div class="logo f-l">
        <a href="/home/index">
            <img src="${stcCurrentDomain}/static/image/index/homelogo.png" alt="logo" title="logo"/>
        </a>
    </div>
    <div class="menu f-r">
        <ul class="menuUl clearfix">
            <li class="currency">
                <a href="javascript:void(0)">CNY人民币</a>
                <div class="subMenu">
                    <span class="triangleIcon triangle"></span>
                    <ul>
                        <li>JPY日币</li>
                        <li>TWD新台币</li>
                        <li>HKD港币</li>
                    </ul>
                </div>
            </li>
            <li class="language">
                <a href="javascript:void(0)">简体中文</a>
                <div class="subMenu">
                    <span class="triangleIcon triangle"></span>
                    <ul>
                        <li>英文</li>
                        <li>繁体中文</li>
                    </ul>
                </div>
            </li>
            <li class="login">
                <c:if test="${LoginUser.userId>0}">
                    <a href="javascript:void(0)">${LoginUser.firstName}${LoginUser.lastName}</a>
                </c:if>
                <c:if test="${LoginUser.userId==0}">
                    <a class="userCenter" href="javascript:void(0)">登录</a>
                </c:if>
            </li>
            <li class="customerService">
                <a href="javascript:void(0)">客服中心</a>
                <div class="subMenu">
                    <span class="triangleIcon triangle"></span>
                    <div class="Phone">
                        <p>客服电话</p>
                        <p>400 839 84773</p>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<!-- header部分结束-->

<!-- 遮罩层开始-->
<div class="modal">

    <!-- 灰色幕布-->
    <div class="mask"></div>


    <div>
        <!--注册第一步开始-->
        <div class="modalContent resignWrap firstStep ">
            <div class="modalTitle clearfix">
                <div class="titleContent">
                    <p class="">注册</p>
                    <span class="closeIcon"></span>
                </div>
                <div class="modalMain">
                    <!-- class=wrong 的样式是验证填写错误时候的样式-->
                    <div class="inputWrap wrong">
                        <input type="text" placeholder="derekliu.x@gmail.com"/>
                    </div>
                    <div class="inputWrap ">
                        <input type="text" placeholder="密码"/>
                    </div>
                    <div class="inputWrap ">
                        <input type="text" placeholder="确认密码"/>
                    </div>
                    <div class="submitWrap">
                        <input type="button" class="nextStep" value="下一步"/>
                    </div>
                </div>

            </div>
        </div>
        <!--注册第一步结束-->

        <!--注册第二步开始-->
        <div class="modalContent resignWrap secondStep">
            <div class="modalTitle clearfix">
                <div class="titleContent">
                    <p class="">注册</p>
                    <span class="closeIcon"></span>
                </div>
                <div class="modalMain">
                    <div class="inputWrap">
                        <input type="text" placeholder="姓"/>
                    </div>
                    <div class="inputWrap">
                        <input type="text" placeholder="名"/>
                    </div>
                    <div class="inputWrap">
                        <input type="text" placeholder="电话"/>
                    </div>
                    <div class="submitWrap">
                        <input type="submit" class="submit finished" value="完成"/>
                    </div>
                </div>

            </div>
        </div>
        <!--注册第二步结束-->

        <!--  注册成功显示开始-->
        <div class="modalContent resignWrap signInOk">
            <div class="modalTitle clearfix">
                <div class="titleContent">
                    <p class="f-l">注册</p>
                </div>
                <div class="modalMain">

                    <div class="signOk">
                        <span>注册成功</span>
                    </div>
                    <div class="emailNotice">
                        <p>验证邮件已经发送到邮箱 xxxx@gmail.com，请前往邮箱验证帐号。</p>
                    </div>
                    <div class="confirmSend">
                        <span>(</span>
                        <span>没有收到?</span>
                        <span class="resend">重新发送</span>
                        <span>)</span>
                    </div>
                    <div class="submitWrap">
                        <input type="button" class="confirmBtn" value="确认"/>
                    </div>
                </div>

            </div>
        </div>
        <!--  注册成功显示结束-->

        <!-- 登录界面开始-->
        <div class="modalContent loginWrap">
            <div class="modalTitle clearfix">
                <div class="titleContent">
                    <p class="">登录</p>
                    <span class="closeIcon"></span>
                </div>
                <div class="modalMain">
                    <div class="faceBookLogin">
                        <input type="button" class="facebookBtn" value="使用 Facebook 帐号登录"/>
                    </div>
                    <div class="or">
                        <p>or</p>
                    </div>
                    <div class="inputWrap">
                        <input type="text" placeholder="邮箱"/>
                    </div>
                    <div class="inputWrap">
                        <input type="password" placeholder="密码"/>
                    </div>
                    <div class="rememberMe">
                        <label for="remember" class="checkbox clearfix">
                            <span class="checkboxIcon f-l"></span>
                            <input type="checkbox" class="f-l" id="remember"/> 记住我
                        </label>
                    </div>
                    <div class="loginBtnWrap">
                        <input type="submit" class="loginBtn" value="登录"/>
                    </div>
                </div>
            </div>
            <div class="line"></div>
            <div class="noAccount clearfix">
                <div class="f-l">
                    <p>还没有帐号？</p>
                </div>
                <div class="f-r">
                    <input type="button" class="signinBtn " value="注册"/>
                </div>

            </div>
        </div>
        <!-- 登录界面结束-->
    </div>

</div>
<!-- 遮罩层结束-->
