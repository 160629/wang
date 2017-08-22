package cq.yezi.controller;

import cq.common.pagehelper.SearchParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class BaseController {

    protected Logger logger = LoggerFactory.getLogger(BaseController.class);

    /**
     * 设置查询参数
     *
     * @param request
     * @param param
     */
    protected void setSearchParamMap(HttpServletRequest request, SearchParam param) {
        Map<String, String> map = new HashMap<String, String>();
        Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();
            if (!(paramName.toLowerCase().equals("pagenum") || paramName.toLowerCase().equals("pagesize"))) {
                String[] paramValues = request.getParameterValues(paramName);
                if (paramValues.length == 1) {
                    String paramValue = paramValues[0];
                    if (paramValue.length() != 0) {
                        map.put(paramName, paramValue);
                    }
                }
            }
        }
        param.setParams(map);
    }
}
