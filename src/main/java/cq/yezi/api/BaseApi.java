package cq.yezi.api;

import cq.common.jsonhelper.JsonConvert;
import cq.yezi.controller.BaseController;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * API接口基类
 */
public class BaseApi {
    protected Logger logger = LoggerFactory.getLogger(BaseController.class);

    protected <T> T cqHttp(String route, Object params, Class<T> valueType) {
        T t = null;
        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            String URL = "http://local.api.chuqulvxing.com";
            HttpPost httpPost = new HttpPost(URL + "/" + route);
            StringEntity entity = new StringEntity(JsonConvert.SerializeObject(params), "UTF-8");
            httpPost.setEntity(entity);
            httpPost.setHeader("Content-Type", "application/json; charset=utf-8");

            String authTicket = "masterauth;appclient=0;appsource=4;appversion=2.0;ipaddress=127.0.0.1;timespan=1501818948;token=rKPemqCpDoF9I_gxArYF8E0-p1RUmuM7o0ZBzSDH_NQ%3D;webbrowser=1;sign=SnQTccfgwqU0F%2BxDTS8ZyMheJZM%3D";
            httpPost.setHeader("authorize_ticket", authTicket);

            ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

                @Override
                public String handleResponse(
                        final HttpResponse response) throws ClientProtocolException, IOException {
                    int status = response.getStatusLine().getStatusCode();
                    if (status >= 200 && status < 300) {
                        HttpEntity entity = response.getEntity();
                        return entity != null ? EntityUtils.toString(entity) : null;
                    } else {
                        throw new ClientProtocolException("Unexpected response status: " + status);
                    }
                }

            };

            String responseBody = httpclient.execute(httpPost, responseHandler);
            t = JsonConvert.DeserializeObject(responseBody, valueType);

        } catch (Exception ex) {
            String m = ex.getMessage();
            logger.error(m);
        } finally {
            try {
                httpclient.close();
            } catch (IOException e) {
            }
            return t;
        }

    }
}
