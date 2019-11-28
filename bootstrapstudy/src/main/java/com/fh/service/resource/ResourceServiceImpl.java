package com.fh.service.resource;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fh.common.ServerResponse;
import com.fh.mapper.ResourceMapper;
import com.fh.mapper.RoleAndResourceMapper;
import com.fh.model.RoleAndResource;
import com.fh.model.User;
import com.fh.util.RedisUtil;
import com.fh.util.SessionUtil;
import com.fh.util.SystemConstant;
import net.sf.json.JSON;
import org.apache.http.HttpRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ResourceServiceImpl implements ResourceService {
    @Resource
    private ResourceMapper resourceMapper;

    @Resource
    private RoleAndResourceMapper roleAndResourceMapper ;
    @Override
    public List<com.fh.model.Resource> queryList() {
        return resourceMapper.queryList();
    }

    @Override
    public void addResource(com.fh.model.Resource resource) {
        resourceMapper.addResource(resource);
    }

    @Override
    public ServerResponse queryListByRoleId(Integer id) {
        //查询全部的资源
        QueryWrapper<com.fh.model.Resource> queryWrapper = new QueryWrapper<>();
        List<com.fh.model.Resource> resourceList = resourceMapper.selectList(queryWrapper);

        //查看该角色拥有的权限
        QueryWrapper<RoleAndResource> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("roleId",id);
        List<RoleAndResource> roleAndResourceList = roleAndResourceMapper.selectList(queryWrapper1);
        //把用户的权限放到一个集合中
        ArrayList<Integer> list = new ArrayList<>();
        roleAndResourceList.forEach(ll->{
            list.add(ll.getResourceId());
        });
        //两种资源进行比较 相等复选框默认被选中true
        List<com.fh.model.Resource> resourceList1=resourceList.stream().filter(x->{
            if(list.contains(x.getId())){
                x.setChecked(true);
            }
            return true;
        }).collect(Collectors.toList());


        return ServerResponse.success(resourceList1);
    }

    @Override
    public ServerResponse getUserResource(HttpServletRequest request, HttpServletResponse response) {
       // User user = (User) request.getSession().getAttribute(SystemConstant.LOGGIN_CURRENT_USER);
       String sessionId = SessionUtil.getSessionId(request,response);
        String userString = RedisUtil.get(SystemConstant.LOGGIN_CURRENT_USER + sessionId);
        User user = JSONObject.parseObject(userString, User.class);
        List<com.fh.model.Resource> resourceList=resourceMapper.getUserResource(user.getId());
        return ServerResponse.success(resourceList);
    }


}
