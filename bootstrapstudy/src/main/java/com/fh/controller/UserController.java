package com.fh.controller;

import com.fh.common.Ignore;
import com.fh.common.ServerResponse;
import com.fh.model.Area;
import com.fh.model.User;
import com.fh.param.UserSearchParam;
import com.fh.service.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user/")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("index")
    public String index(){
        return "user/list";
    }
/*    @RequestMapping("checkUserByName")
    @ResponseBody
    public ServerResponse checkUserByName( String userName){

        return userService.getUserByName(userName);
    }
    @RequestMapping("queryList")
    @ResponseBody
    public ServerResponse queryList(){
        return userService.queryList();
    }*/
/*查询地区*/
    @RequestMapping("areaAddByPid")
    @ResponseBody
    public ServerResponse areaAddByPid(Integer pid){
        List<Area>   areaList=userService.areaAddByPid(pid);
        return ServerResponse.success(areaList);
    }
    /*增加用户*/
    @RequestMapping("addUserBy")
    @ResponseBody
    public ServerResponse addUserBy(User user, @RequestParam("roleAdd[]") List<Integer> roleAdd){
                userService.addUserBy(user,roleAdd);
        return ServerResponse.success();
    }


    @RequestMapping("checkUserByName")
    @ResponseBody
    @Ignore
    public Map checkUserByName( String userName){
         Map map=new HashMap();
        map.put("valid",userService.getUserByName(userName));
        return map;
    }
    @RequestMapping("queryList")
    @ResponseBody
    public ServerResponse queryList(UserSearchParam userSearchParam){
        return userService.queryList(userSearchParam);
    }

    @RequestMapping("addUser")
    @ResponseBody
    @Ignore
    public ServerResponse addUser(User user){
        return userService.addUser(user);
    }

    @RequestMapping("login")
    @ResponseBody
    @Ignore
    public ServerResponse login(User user, HttpServletRequest request, HttpServletResponse response){
        return userService.login(user,request,response);
    }
    //发送短信
    @RequestMapping("sendCode")
    @ResponseBody
    @Ignore
    public ServerResponse sendCode(String phone,HttpServletRequest request,HttpServletResponse response){

        return ServerResponse.success(userService.sendCode(phone,request,response));
    }
    /*
    * 确定
    * */
    @RequestMapping("saveButton")
    @ResponseBody
    @Ignore
    public ServerResponse saveButton(User user,String code,HttpServletRequest request){

        return userService.saveButton(user,code,request);
    }
    @RequestMapping("loginOut")
    public String loginOut(HttpServletRequest request, HttpServletResponse response){
        userService.loginOut( request,  response);
        return "redirect:/login.jsp";
    }
}
