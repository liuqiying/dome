package com.fh.service.ROLE;

import com.fh.common.ServerResponse;
import com.fh.model.Role;
import com.fh.param.RoleSerchParam;

import java.util.List;

public interface RoleService {
    ServerResponse queryList(RoleSerchParam roleSerchParam);

    void addRole(String roleName, String resourceId);

    void updateRole(Role role, List<Integer> resourceIdList);

    void deleteRole(Integer id);

    ServerResponse queryAllList();
}
