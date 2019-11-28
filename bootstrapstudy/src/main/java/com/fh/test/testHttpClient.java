
package com.fh.test;


import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

import java.io.IOException;

public class testHttpClient {

    @Test
    public void testClient(){
        //打开浏览器
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        //输入网址
        HttpGet httpGet = new HttpGet("http://www.baidu.com");
        CloseableHttpResponse response =null;
        try {
            response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();

            String string = EntityUtils.toString(entity, "utf-8");

            System.out.println(string);
        } catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                if(response!=null){
                    response.close();
                }
                if(httpClient!=null){
                    httpClient.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

        }


    }
}

