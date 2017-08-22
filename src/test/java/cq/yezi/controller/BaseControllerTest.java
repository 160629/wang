package cq.yezi.controller;

import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.mock.web.MockServletContext;
import org.testng.annotations.BeforeClass;
import org.unitils.UnitilsTestNG;
import org.unitils.spring.annotation.SpringApplicationContext;

/**
 * Created by LiuTao on 2017/7/19.
 */
@SpringApplicationContext({"applicationContext.xml", "springmvc-config.xml"})
public class BaseControllerTest extends UnitilsTestNG {
    //声明Request与Response模拟对象
    public MockHttpServletRequest request;
    public MockHttpServletResponse response;
    public MockHttpSession session;
    public MockServletContext servletContext;

    //执行测试前先初始模拟对象
    @BeforeClass
    public void before() {
        request = new MockHttpServletRequest();
        request.setCharacterEncoding("UTF-8");
        response = new MockHttpServletResponse();
        session = new MockHttpSession();
        servletContext = new MockServletContext();
    }
}
