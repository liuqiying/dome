package com.fh.service.resource;


import com.fh.common.ServerResponse;
import com.fh.model.Resource;
import org.apache.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface ResourceService {
    List<Resource> queryList();

    void addResource(Resource resource);

    ServerResponse queryListByRoleId(Integer id);

    ServerResponse getUserResource(HttpServletRequest request, HttpServletResponse response);
}
