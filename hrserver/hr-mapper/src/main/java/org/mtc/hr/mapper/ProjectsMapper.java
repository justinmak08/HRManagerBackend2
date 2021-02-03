package org.mtc.hr.mapper;

import org.mtc.hr.model.Projects;

import java.util.List;

public interface ProjectsMapper {
    public Integer count();
    public Integer save(Projects projects);
    public void deleteById(String id);
    public Projects findById(String id);
    public Integer update(Projects projects);
    public List<Projects> find(Integer index, Integer limit);
}