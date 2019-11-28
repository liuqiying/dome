package com.fh.util;

import com.alibaba.fastjson.JSON;
import com.fh.test.CheckSumBuilder;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SendCodeUtil {
    //发送验证码的请求路径URL
    private static final String
            SERVER_URL="https://api.netease.im/sms/sendcode.action";
    //网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
    private static final String
            //APP_KEY="524247429860112bb12a1fd8e7b46e4b";//
            //444d1c93a42754822ed658e85dba8f00  短信
            //84f3fa2bb9a2  秘钥
            APP_KEY="444d1c93a42754822ed658e85dba8f00";
    //网易云信分配的密钥，请替换你在管理后台应用下申请的appSecret
    //private static final String APP_SECRET="2e515682598a";//
    private static final String APP_SECRET="84f3fa2bb9a2";
    //随机数
    private static final String NONCE= RandomStringUtils.randomAlphanumeric(10);
    //短信模板ID
    //private static final String TEMPLATEID="9554214";//14839322  14839316
    private static final String TEMPLATEID="14839322";

    //手机号
    private static final String MOBILE="15038514268";
    //验证码长度，范围4～10，默认为4
    private static final String CODELEN="4";

    public static String sendCode(String phone) {

        String res=null;
        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(SERVER_URL);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        /*
         * 参考计算CheckSum的java代码，在上述文档的参数列表中，有CheckSum的计算文档示例
         */
        String checkSum = CheckSumBuilder.getCheckSum(APP_SECRET, NONCE, curTime);

        // 设置请求的header
        httpPost.addHeader("AppKey", APP_KEY);
        httpPost.addHeader("Nonce", NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        /*
         * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档”
         * 2.参数格式是jsonArray的格式，例如 "['13888888888','13666666666']"
         * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
         */
        nvps.add(new BasicNameValuePair("templateid", TEMPLATEID));
        nvps.add(new BasicNameValuePair("mobile", phone));
        nvps.add(new BasicNameValuePair("codeLen", CODELEN));

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

            // 执行请求
            HttpResponse response = httpClient.execute(httpPost);
            /*
             * 1.打印执行结果，打印结果一般会200、315、403、404、413、414、500
             * 2.具体的code有问题的可以参考官网的Code状态表
             */
            //System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));

            String string = EntityUtils.toString(response.getEntity(), "utf-8");
            Message message = JSON.parseObject(string, Message.class);

            if(message.getCode()==200){
                //发送成功 返回验证码
                res=message.getObj();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return res;
    }
}
