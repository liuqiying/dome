package com.fh.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_shop_resource")
public class Resource {
    private Integer id;
    private String resourceName;
    private String url;
    private Integer pid;
    private Integer resourceType;

    @TableField(exist = false)
    private Boolean checked = false;

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getResourceType() {
        return resourceType;
    }

    public void setResourceType(Integer resourceType) {
        this.resourceType = resourceType;
    }

    public Resource(Integer id, String resourceName, String url, Integer pid, Integer resourceType) {
        this.id = id;
        this.resourceName = resourceName;
        this.url = url;
        this.pid = pid;
        this.resourceType = resourceType;
    }

    public Resource() {
    }
}
