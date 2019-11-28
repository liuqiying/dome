package com.fh.service.Area;

import com.fh.mapper.AreaMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {
    @Resource
    private AreaMapper areaMapper;

    @Override
    public List queryAreaList() {
        return areaMapper.queryAreaList();
    }
}
