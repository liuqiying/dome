package com.fh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.model.RoleAndResource;

import java.util.ArrayList;

public interface RoleAndResourceMapper extends BaseMapper<RoleAndResource> {


    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        list.add(5);
        //foreach循环
        //list.forEach(x -> System.out.println(x));
        //查询大于3的
        //list.stream().filter(x->x>3).forEach(x->System.out.println(x));
        //分页 skip起始位置
        //list.stream().skip(1).limit(2).forEach(x->System.out.println(x));
        //去重 distinct去重
        long count=list.stream().distinct().count();
        System.out.println(count);
    }
}
