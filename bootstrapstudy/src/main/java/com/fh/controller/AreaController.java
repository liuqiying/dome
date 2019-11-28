package com.fh.controller;

import com.fh.model.Area;
import com.fh.service.Area.AreaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("area/")
public class AreaController {

    @Resource
    private AreaService areaService;

    @RequestMapping("index")
    public String index(){
        return "area/list";
    }
    /*ztree树展示*/
    @RequestMapping("/queryAreaList")
    @ResponseBody
    public List queryAreaList(){

        List<Area> list = areaService.queryAreaList();
        List a= new ArrayList<>();
        for (int i = 0 ; i < list.size() ; i++ ){
            Map<String , Object> m = new HashMap<>();
            m.put("id",list.get(i).getId());
            m.put("cityname",list.get(i).getCityname());
            m.put("pid",list.get(i).getPid());
            a.add(m);
        }

        return a;
    }

}
