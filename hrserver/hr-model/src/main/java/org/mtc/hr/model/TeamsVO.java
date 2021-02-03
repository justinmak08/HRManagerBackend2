package org.mtc.hr.model;

import java.util.List;


public class TeamsVO {
    private Integer total;
    private List<Teams> data;
    private Integer pageSize;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<Teams> getData() {
        return data;
    }

    public void setData(List<Teams> data) {
        this.data = data;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

}
