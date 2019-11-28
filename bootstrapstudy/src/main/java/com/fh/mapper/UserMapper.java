package com.fh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.model.Area;
import com.fh.model.User;
import com.fh.param.UserSearchParam;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {

    User getUserByName(String userName);

    List<User> queryList(UserSearchParam userSearchParam);

    void addUser(User user);

    long queryCount(UserSearchParam userSearchParam);

    List<Area> areaAddByPid(Integer pid);

    void addUserBy(User user);
}
