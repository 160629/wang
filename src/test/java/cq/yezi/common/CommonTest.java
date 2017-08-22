package cq.yezi.common;

import org.apache.commons.lang3.StringUtils;
import org.testng.annotations.Test;

/**
 * Created by LiuTao on 2017/7/19.
 */
public class CommonTest extends BaseTest {

    @Test
    public void test() {
        StringUtils.isBlank(null);
        System.out.println(StringUtils.isBlank(null));
        System.out.println(StringUtils.isBlank(""));
        System.out.println(StringUtils.isBlank(" "));
        System.out.println("这是一个单元测试");
    }
}
