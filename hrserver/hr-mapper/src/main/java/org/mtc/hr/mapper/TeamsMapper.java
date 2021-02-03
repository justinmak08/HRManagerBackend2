package org.mtc.hr.mapper;

import org.mtc.hr.model.Teams;

import java.util.List;

public interface TeamsMapper {
    public Integer save(Teams teams);
    public Integer count();
    public void deleteById(String id);
    public Teams findById(String id);
    public Integer update(Teams teams);
    public List<Teams> find(Integer index, Integer limit);
}