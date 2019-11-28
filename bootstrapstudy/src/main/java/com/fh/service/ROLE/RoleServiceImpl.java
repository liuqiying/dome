package com.fh.service.ROLE;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fh.common.ServerResponse;
import com.fh.mapper.RoleAndResourceMapper;
import com.fh.mapper.RoleMapper;
import com.fh.model.Role;
import com.fh.model.RoleAndResource;
import com.fh.param.RoleSerchParam;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private RoleAndResourceMapper roleAndResourceMapper;

    @Override
    public ServerResponse queryList(RoleSerchParam roleSerchParam) {
        //查询总条数
        long totalCount = roleMapper.queryCount(roleSerchParam);
        List<Role> list =  roleMapper.queryList(roleSerchParam);
        Map map = new HashMap();
        map.put("draw",roleSerchParam.getDraw());
        map.put("recordsTotal",totalCount);
        map.put("recordsFiltered",totalCount);
        map.put("data",list);
        return ServerResponse.success(map);
     /*   QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        //查询总条数
        Integer totalCount = roleMapper.selectCount(queryWrapper);
        //计算当前页
        int current = roleSerchParam.getStart() / roleSerchParam.getLength() + 1;
        //查询数据
        IPage roleIPage = roleMapper.selectPage(new Page<>(current,roleSerchParam.getLength()),queryWrapper);
        List<Role> roleList = roleIPage.getRecords();

        Map map = new HashMap();
        map.put("draw",roleSerchParam.getDraw());
        map.put("recordsTotal",totalCount);
        map.put("recordsFiltered",totalCount);
        map.put("data",roleList);

        return ServerResponse.success(map);*/
    }

    @Override
    public void addRole(String roleName, String resourceId) {

        //保存角色
        Role role = new Role();
        role.setRoleName(roleName);
        roleMapper.insert(role);
        //与资源关联数据
        if(StringUtils.isNotBlank(resourceId)){
            String[] arr = resourceId.substring(1).split(",");
            for (int i = 0; i <arr.length ; i++) {

                String arr1=arr[i];
                RoleAndResource roleAndResource=new RoleAndResource();
                roleAndResource.setRoleId(role.getId());
                roleAndResource.setResourceId(Integer.valueOf(arr1));
                roleAndResourceMapper.insert(roleAndResource);
            }
        }
    }

    @Override
    public void updateRole(Role role, List<Integer> resourceIdList) {
        //修改角色
        roleMapper.updateById(role);
        //删除该角色关联的资源
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("roleId",role.getId());
        roleAndResourceMapper.delete(queryWrapper);
        //重新中间表中关联角色资源
        resourceIdList.forEach(x->{
            RoleAndResource roleAndResource=new RoleAndResource();
            roleAndResource.setRoleId(role.getId());
            roleAndResource.setResourceId(x);
            roleAndResourceMapper.insert(roleAndResource);
        });
    }

    @Override
    public void deleteRole(Integer id) {
        //先删除角色表的数据
        roleMapper.deleteById(id);
        //再删除角色和资源关联表的数据
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("roleId",id);
        roleAndResourceMapper.delete(queryWrapper);
    }

    @Override
    public ServerResponse queryAllList() {
        QueryWrapper queryWrapper = new QueryWrapper();
        List list = roleMapper.selectList(queryWrapper);
        return ServerResponse.success(list);
    }
}
