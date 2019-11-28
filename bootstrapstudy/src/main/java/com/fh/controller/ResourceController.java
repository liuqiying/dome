package com.fh.controller;

import com.fh.common.ServerResponse;
import com.fh.service.resource.ResourceService;
import org.apache.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("resource")
public class ResourceController {

    @Resource
    private ResourceService resourceService;

    @RequestMapping("index")
    public String index(){
        return "resource/list";
    }
    @RequestMapping("queryList")
    @ResponseBody
    public ServerResponse queryList() {
        List<com.fh.model.Resource> resourceList = resourceService.queryList();
        return ServerResponse.success(resourceList);
    }

    @RequestMapping("addResource")
    @ResponseBody
    public ServerResponse addResource(com.fh.model.Resource resource) {
        resourceService.addResource(resource);
        return ServerResponse.success();
    }

    //回显权限queryListByRoleId
    @RequestMapping("queryListByRoleId")
    @ResponseBody
    public ServerResponse queryListByRoleId(Integer id) {
        return resourceService.queryListByRoleId(id);
    }
    //获取当前用户的权限
    @RequestMapping("getUserResource")
    @ResponseBody
    public ServerResponse getUserResource(HttpServletRequest request, HttpServletResponse response){

        return resourceService.getUserResource(request,response);
    }
}
