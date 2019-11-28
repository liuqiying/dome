package com.fh.service.user;

import com.fh.common.ServerResponse;
import com.fh.model.Area;
import com.fh.model.User;
import com.fh.param.UserSearchParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface UserService {
    //ServerResponse getUserByName(String userName);
    boolean getUserByName(String userName);

    ServerResponse queryList(UserSearchParam userSearchParam);

    ServerResponse addUser(User user);

    ServerResponse login(User user, HttpServletRequest request, HttpServletResponse response);

    List<Area> areaAddByPid(Integer pid);

    void addUserBy(User user,List<Integer> roleAdd);

    Object sendCode(String phone,HttpServletRequest request,HttpServletResponse response);

    ServerResponse saveButton(User user, String code, HttpServletRequest request);

    void loginOut(HttpServletRequest request, HttpServletResponse response);
}
