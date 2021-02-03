package org.mtc.hr.config.service.impl;

import org.mtc.hr.model.Projects;
import org.mtc.hr.model.ProjectsVO;
import org.mtc.hr.mapper.ProjectsMapper;
import org.mtc.hr.utils.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;

@Service
public class ProjectsService {
    @Autowired
    private ProjectsMapper projectsMapper;
    private Integer limit = 10;

    public ProjectsVO findByPage(Integer page) {
        Integer index = (page-1)*limit;
        ProjectsVO projectsVO = new ProjectsVO();
        projectsVO.setData(projectsMapper.find(index,limit));
        projectsVO.setTotal(projectsMapper.count());
        projectsVO.setPageSize(limit);
        return projectsVO;
    }

    public Integer save(Projects projects) {
        String projectId = UUIDGenerator.getId();
        projects.setCreationDate(new Date());
        projects.setId(projectId);
        return projectsMapper.save(projects);
    }

    public void deleteById(String id) {
        projectsMapper.deleteById(id);
    }

    public Projects findById(String id) {
        return projectsMapper.findById(id);
    }

    public Integer update(Projects projects) {
        return projectsMapper.update(projects);
    }
}
