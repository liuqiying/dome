package com.fh.model;

import com.baomidou.mybatisplus.annotation.TableName;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by gy on 2019/10/14.
 */
@TableName("t_product")
public class Product {
    private Integer id;
    private String name;
    private Double price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date   createDate;
    private Integer brandId;
    private String filePath;
    private Integer category1;
    private Integer category2;
    private Integer category3;
    private String brandName;
    private Integer status;
    private Integer inventory;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Integer getCategory1() {
        return category1;
    }

    public void setCategory1(Integer category1) {
        this.category1 = category1;
    }

    public Integer getCategory2() {
        return category2;
    }

    public void setCategory2(Integer category2) {
        this.category2 = category2;
    }

    public Integer getCategory3() {
        return category3;
    }

    public void setCategory3(Integer category3) {
        this.category3 = category3;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Product(Integer id, String name, Double price, Date createDate, Integer brandId, String filePath, Integer category1, Integer category2, Integer category3, String brandName, Integer status, Integer inventory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.createDate = createDate;
        this.brandId = brandId;
        this.filePath = filePath;
        this.category1 = category1;
        this.category2 = category2;
        this.category3 = category3;
        this.brandName = brandName;
        this.status = status;
        this.inventory = inventory;
    }

    public Product() {
    }
}
