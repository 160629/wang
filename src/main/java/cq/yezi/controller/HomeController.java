package cq.yezi.controller;

import cq.common.crypto.CryptoUtils;
import cq.common.jsonhelper.JsonConvert;
import cq.yezi.common.ConfigInfo;
import cq.yezi.model.City;
import cq.yezi.model.LoginUser;
import cq.yezi.model.User;
import cq.yezi.service.BasicService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;


@Controller
public class HomeController extends BaseController {
    private BasicService basicService;

    @Autowired
    public void setBasicService(BasicService basicService) {
        this.basicService = basicService;
    }

    /**
     * 首页管理
     */
    @RequestMapping(value = {"/", "index", "home/index"})
    public String index() {

        return "home/index";
    }

    /**
     * 城市列表
     */
    @RequestMapping(value = "home/citylist", method = RequestMethod.POST)
    @ResponseBody
    public Object getCityList() {
        List<City> list = basicService.getCityList();
        return list;
    }

    /**
     * 用户登录页面
     *
     * @param goBack 自动跳转URL
     * @return the model and view
     */
    @RequestMapping("login")
    public ModelAndView login(@RequestParam(value = "goback", required = false) String goBack) {
        ModelAndView view = new ModelAndView();
        LoginUser login = new LoginUser();
        login.setGobackURL(goBack);
        view.addObject("login", login);
        view.setViewName("home/login");
        return view;
    }

    /**
     * 用户登录
     *
     * @param login the login
     * @return the object
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public Object loginDo(HttpServletRequest request, HttpServletResponse response,
                          @Valid @ModelAttribute("login") LoginUser login, BindingResult bindingResult) throws IOException {
        if (bindingResult.hasErrors()) {
            return "home/login";
        }

        User user = new User();
        user.setUserId(2);
        user.setFirstName("刘");
        user.setLastName("涛");

        String jsonUser = JsonConvert.SerializeObject(user);
        String ticket = CryptoUtils.base64Encode(jsonUser);
        boolean checked = login.getAutoLogin();
        int expiry = 1800;
        if (checked)
            expiry = 7 * 24 * 3600;
        Cookie cookie = new Cookie(ConfigInfo.authCookieName, ticket);
        //cookie.setSecure(true);// 为true时用于https
        cookie.setMaxAge(expiry);
        //cookie.setDomain("");
        cookie.setPath("/");
        response.addCookie(cookie);

        String URL = "";
        String gobackURL = login.getGobackURL();
        if (!StringUtils.isBlank(gobackURL))
            URL = CryptoUtils.base64Decode(gobackURL);
        else
            URL = "/index";
        return "redirect:" + URL;
    }

    /**
     * 注册用户
     *
     * @param request the request
     * @param user    the user
     * @return the object
     */
    @RequestMapping(value = "user_register", method = RequestMethod.POST)
    @ResponseBody
    public Object register(HttpServletRequest request, User user) {
        return null;
    }
}
