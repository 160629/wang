package cq.yezi.filter;

import cq.common.crypto.CryptoUtils;
import cq.common.jsonhelper.JsonConvert;
import cq.yezi.common.ConfigInfo;
import cq.yezi.model.User;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录信息
 */
public class LoginInfo implements Filter {
    private ServletContext servletContext;
    private String exclude;
    private static User user;

    public static User getUser() {
        return user;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        exclude = filterConfig.getInitParameter("exclude");
        servletContext = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        if (request.getServletPath().indexOf(exclude) == 0) {
            chain.doFilter(servletRequest, servletResponse);
        } else {
            if (isAjaxRequest(request)) {
                chain.doFilter(request, response);
            } else {
                Cookie authCookie = null;
                Cookie[] cookies = request.getCookies();
                if (cookies != null)
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals(ConfigInfo.authCookieName)) {
                            authCookie = cookie;
                            break;
                        }
                    }
                if (authCookie != null) {
                    /*int expiry = authCookie.getMaxAge();
                    if (expiry < 0)
                        expiry = 1800;
                    authCookie.setMaxAge(expiry);
                    authCookie.setPath("/");
                    response.addCookie(authCookie);*/
                    String jsonUser = CryptoUtils.base64Decode(authCookie.getValue());
                    this.user = JsonConvert.DeserializeObject(jsonUser, User.class);
                } else {
                    this.user = new User();
                }

                servletContext.setAttribute("LoginUser", this.user);
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {

    }

    private boolean isAjaxRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("X-Requested-With");
        return requestedWith != null ? "XMLHttpRequest".equals(requestedWith) : false;
    }
}
