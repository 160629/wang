package cq.yezi.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ConfigInfo {
    /**
     * 公用静态文件域名
     */
    public static String stcCommonDomain;
    /**
     * 当前项目静态文件域名
     */
    public static String stcCurrentDomain;
    /**
     * 项目静态资源版本号
     */
    public static String stcVersion;

    /**
     * 登录Cookie标识
     */
    public static String authCookieName;

    /**
     * 椰子图片路径
     */
    public static String yeziImgDomain;

    @Value("${config.stcCommonDomain}")
    public void setStcCommonDomain(String stcCommonDomain) {
        ConfigInfo.stcCommonDomain = stcCommonDomain;
    }

    @Value("${config.stcCurrentDomain}")
    public void setStcCurrentDomain(String stcCurrentDomain) {
        ConfigInfo.stcCurrentDomain = stcCurrentDomain;
    }

    @Value("${config.stcVersion}")
    public void setStcVersion(String stcVersion) {
        ConfigInfo.stcVersion = stcVersion;
    }

    @Value("${config.yeziImgDomain}")
    public void setYeziImgDomain(String yeziImgDomain) {
        ConfigInfo.yeziImgDomain = yeziImgDomain;
    }

    @Value("${config.authCookieName}")
    public void setAuthCookieName(String authCookieName) {
        ConfigInfo.authCookieName = authCookieName;
    }
}
