$(function () {

    //低版本Safari不识别font-size:calc(100vw/14.4);这中写法，所以执行以下代码
    /*var explorer = navigator.userAgent;
     if (explorer.indexOf("Safari") >= 0) {

     var screenW = $(window).width();
     var fontSizeNormal = screenW / 14.40;
     if ($(window).width() > 768 && $(window).width() < 1441) {
     $("html").css("font-size", fontSizeNormal + "px");
     }

     $(window).resize(function () {
     var screenW = $(window).width();
     var fontSizeNormal = screenW / 14.40;
     if ($(window).width() > 768 && $(window).width() < 1441) {
     $("html").css("font-size", fontSizeNormal + "px");
     }
     });
     }*/

    //头部菜单部分的li相关事件
    $(".menuUl>li").each(function (i, item) {

        //菜单栏hover 效果，字体变粗，出下划线
        $(this).hover(function () {
            $(this).addClass("active");
        }, function () {
            $(this).removeClass("active");
        });

        //菜单栏点击，其下面的子菜单显示
        $(this).click(function (event) {
            var e = event || window.event;
            e.stopPropagation();
            e.preventDefault();

            $(this).find(".subMenu").show();
            $(this).siblings().find(".subMenu").hide();

            //子菜单定位问题  css样式设置
            var elementWidth = $(this).innerWidth();
            var subMenuW = $(this).find(".subMenu").width();
            var subMenuLeft = -(subMenuW - elementWidth) / 2 / 100;
            var liLen = $(".menuUl>li").length - 1;
            if (i == liLen) {
                $(".subMenu").css({
                    "right": 0 + "rem"
                });
            } else {
                $(".subMenu").css({
                    "right": subMenuLeft + "rem"
                });
            }
        });
    });


    //子菜单点击事件，选择子菜单中的任意一个后，该内容块消失
    $(".subMenu li").each(function (i, item) {
        $(this).click(function (even) {
            var e = even || window.event;
            e.stopPropagation();
            e.preventDefault();
            $(this).parent().parent().hide();
        });
    });

    //客服电话，点击子菜单本身，子菜单消失
    $(".customerService .subMenu").click(function (event) {
        var e = event || window.event;
        e.stopPropagation();
        e.preventDefault();
        $(this).hide();
    });

    //点击页面任何地方，客服电话子菜单消失
    document.onclick = function (event) {
        var e = event || window.event;
        var aim = e.srcElement || e.target;
        if (e.srcElement) {
            var aim = e.srcElement;
            if (aim != $(".menuUl")) {
                $(".menuUl .subMenu").hide();
            }
            ;
        }
        ;
    };


    //第一个参数是子菜单下的li，第二个参数是菜单栏li里面的a标签
    function addElement(clickEle, replaceEle) {
        var newHtml = replaceEle.html();
        var MenuHtml = clickEle.html();
        replaceEle.html(MenuHtml);
        clickEle.html(newHtml);
    }

    //点击更换货币种类
    $(".currency .subMenu li").click(function () {
        addElement($(this), $(".currency>a"));
    });
    //点击切换语言类型
    $(".language .subMenu li").click(function () {
        addElement($(this), $(".language>a"));
    });

    //点击登录，弹出登录界面
    $(".userCenter").click(function () {
        $(".modal").show();
    });

    //点击注册按钮，显示注册页面
    $(".signinBtn").click(function () {
        $(".resignWrap.firstStep").show().siblings().hide();
    });

    //点击下一步按钮，显示注册页面的下一步
    $(".nextStep").click(function () {
        $(".resignWrap.secondStep").show().siblings().hide();
    });

    //点击完成按钮，显示注册完成页面
    $(".finished").click(function () {
        $(".resignWrap.signInOk").show().siblings().hide();
    });

    //点击确认按钮，关闭遮罩层弹框
    $(".confirmBtn").click(function () {
        $(".loginWrap").show().siblings().hide();
        $(".modal").hide();
    });
    //点击登录按钮
    $(".loginBtn").click(function () {
        $(".modal").hide();
        $(".userCenter").removeClass("login");
        $(".userCenter>a").html("个人中心");
        $(".userCenter>a").attr("href", "personal.html")
    });

    //点击关闭按钮,弹框层结束
    $(".closeIcon").click(function () {
        $(".loginWrap").show().siblings().hide();
        $(".modal").hide();
    });
});
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2015-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2015-7-2 8:9:4.18
Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,                      //月份
        "d+": this.getDate(),                           //日
        "h+": this.getHours(),                          //小时
        "m+": this.getMinutes(),                        //分
        "s+": this.getSeconds(),                        //秒
        "q+": Math.floor((this.getMonth() + 3) / 3),   //季度
        "S": this.getMilliseconds()                     //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
Date.prototype.getDateCN = function () {
    return this.getFullYear() + '-' + (this.getMonth() + 1) + '-' + this.getDate();
}
Date.prototype.addDate = function (n) {
    var d = this.valueOf();
    d = d + n * 24 * 60 * 60 * 1000;
    return new Date(d);
}

/** 显示loading */
function loadingShow() {
    var id = new Date().getTime();
    /*var divMask = $('<div class="loading-mask" />');
     divMask.attr("id", "loadmask" + id);
     divMask.appendTo('body');
     var divLoading = $('<div class="loading" />');
     divLoading.attr("id", "loading" + id);
     var effect = $('<div class="loadEffect" />').appendTo(divLoading);
     effect.append('<span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span>');
     divLoading.appendTo('body');
     var ww = $(window).width();
     var wh = $(window).height();
     var bw = $("#loading" + id).width();
     var bh = $("#loading" + id).height();
     var top = (wh - bh) / 2;
     var left = (ww - bw) / 2;
     $("#loading" + id).css({ "top": top + "px", "left": left + "px" });*/
    var Loading = {
        lid: id,
        loadingHide: function () {
            //$("#loadmask" + this.lid + ",#loading" + this.lid).remove();
        }
    };
    return Loading;
}
