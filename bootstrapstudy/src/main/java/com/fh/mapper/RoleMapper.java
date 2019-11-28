package com.fh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.model.Role;
import com.fh.param.RoleSerchParam;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {
    long queryCount(RoleSerchParam roleSerchParam);

    List<Role> queryList(RoleSerchParam roleSerchParam);
}
