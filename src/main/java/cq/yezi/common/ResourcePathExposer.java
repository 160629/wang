package cq.yezi.common;

import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;

public class ResourcePathExposer implements ServletContextAware {

    private ServletContext servletContext;


    public void init() {
        if (servletContext != null) {
            servletContext.setAttribute("stcVersion", "?v=" + ConfigInfo.stcVersion);
            servletContext.setAttribute("stcCommonDomain", ConfigInfo.stcCommonDomain);
            servletContext.setAttribute("stcCurrentDomain", ConfigInfo.stcCurrentDomain);
            servletContext.setAttribute("yeziImgDomain", ConfigInfo.yeziImgDomain);
        }
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public ServletContext getServletContext() {
        return servletContext;
    }
}
