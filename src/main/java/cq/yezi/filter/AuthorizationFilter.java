package cq.yezi.filter;

import cq.common.crypto.CryptoUtils;
import cq.yezi.common.ConfigInfo;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthorizationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String params = request.getQueryString();
        String gobackURL = params != null ? request.getRequestURL().append("?").append(params).toString() : request.getRequestURL().toString();
        String loginURL = "/login?goback=" + CryptoUtils.base64Encode(gobackURL);

        Cookie ticketCookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(ConfigInfo.authCookieName)) {
                    ticketCookie = cookie;
                    break;
                }
            }
        if (ticketCookie != null)
            chain.doFilter(request, response);
        else
            response.sendRedirect(loginURL);
    }

    @Override
    public void destroy() {
    }

    private boolean isAjaxRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("X-Requested-With");
        return requestedWith != null ? "XMLHttpRequest".equals(requestedWith) : false;
    }
}
