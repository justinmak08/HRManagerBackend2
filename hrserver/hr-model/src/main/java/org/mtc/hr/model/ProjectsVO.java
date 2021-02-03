package org.mtc.hr.model;

import java.util.List;

public class ProjectsVO {
    private Integer total;
    private List<Projects> data;
    private Integer pageSize;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<Projects> getData() {
        return data;
    }

    public void setData(List<Projects> data) {
        this.data = data;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

}
