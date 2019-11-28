package com.fh.controller;

import com.fh.common.ServerResponse;
import com.fh.model.Role;
import com.fh.param.RoleSerchParam;
import com.fh.service.ROLE.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController {
    @Resource
    private RoleService roleService;
    @RequestMapping("index")
    public String index(){
        return "role/list";
    }
    @RequestMapping("queryList")
    @ResponseBody
    public ServerResponse queryList(RoleSerchParam roleSerchParam){

        return roleService.queryList(roleSerchParam);
    }
    @RequestMapping("addRole")
    @ResponseBody
    public ServerResponse addRole(String roleName,String resourceId){
        roleService.addRole(roleName,resourceId);
        return ServerResponse.success();
    }
    @RequestMapping("updateRole")
    @ResponseBody
    public ServerResponse updateRole(Role role, @RequestParam("resourceId[]")List<Integer> resourceIdList){
        roleService.updateRole(role,resourceIdList);
        return ServerResponse.success();
    }
    @RequestMapping("deleteRole")
    @ResponseBody
    public ServerResponse deleteRole(Integer id){
        roleService.deleteRole(id);
        return ServerResponse.success();
    }
    @RequestMapping("queryAllList")
    @ResponseBody
    public ServerResponse queryAllList(){
        return roleService.queryAllList();
    }
}
