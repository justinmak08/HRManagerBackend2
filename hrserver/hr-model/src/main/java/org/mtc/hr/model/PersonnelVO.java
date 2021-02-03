package org.mtc.hr.model;

import java.util.List;


public class PersonnelVO {
    private Integer total;
    private List<Personnel> data;
    private Integer pageSize;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<Personnel> getData() {
        return data;
    }

    public void setData(List<Personnel> data) {
        this.data = data;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

}
