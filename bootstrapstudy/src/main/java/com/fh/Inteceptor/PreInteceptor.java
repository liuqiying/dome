package com.fh.Inteceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fh.common.Ignore;
import com.fh.mapper.ResourceMapper;
import com.fh.model.Resource;
import com.fh.model.User;
import com.fh.util.RedisUtil;
import com.fh.util.SessionUtil;
import com.fh.util.SystemConstant;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.List;

public class PreInteceptor extends HandlerInterceptorAdapter {

    @Autowired
    private ResourceMapper resourceMapper;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        System.out.println("-----权限拦截-----");
        HandlerMethod handlerMethod= (HandlerMethod) handler;
        Method method = handlerMethod.getMethod();
        //判断是否有自定义注解  有注解的放开
        if(method.isAnnotationPresent(Ignore.class)){
            return true;
        }
        //获取当前请求的路径
        String  requestURI = request.getRequestURI();
        //获取当前用户所拥有的权限
      // User user = (User) request.getSession().getAttribute(SystemConstant.LOGGIN_CURRENT_USER);
        String sessionId = SessionUtil.getSessionId(request,response);
        String userString = RedisUtil.get(SystemConstant.LOGGIN_CURRENT_USER + sessionId);
        User user = JSONObject.parseObject(userString, User.class);
        List<Resource> resourceList=resourceMapper.getUserResource(user.getId());
        //获取所有的资源
        boolean isFilter=false;
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<>();
        List<Resource> allResourceList = resourceMapper.selectList(queryWrapper);
        if(null !=allResourceList && allResourceList.size()>0){
            for (Resource resource: allResourceList
                 ) {
                if(StringUtils.isNotBlank(resource.getUrl())&&requestURI.contains(resource.getUrl())){
                    isFilter=true;//该请求存在于所有资源中 对权限进下一步判断
                    break;
                }
            }
        }
        if(!isFilter){
            return true;
        }
        //判断当前请求 是否在当前用户的资源上
        boolean hasPre=false;
        if(resourceList!=null && resourceList.size()>0){
            for (Resource resource : resourceList
                 ) {
                if(StringUtils.isNotBlank(resource.getUrl()) && requestURI.contains(resource.getUrl())){
                    hasPre=true;
                    break;
                }
            }
        }
        if(!hasPre){
                //重定向到没有权限的权限
            response.sendRedirect(SystemConstant.NO_PRO_PAGE);
        }
        return hasPre;
    }
}
