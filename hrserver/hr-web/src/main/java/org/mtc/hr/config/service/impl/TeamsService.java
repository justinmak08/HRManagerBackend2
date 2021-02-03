package org.mtc.hr.config.service.impl;

import org.mtc.hr.model.Teams;
import org.mtc.hr.model.TeamsVO;
import org.mtc.hr.mapper.TeamsMapper;
import org.mtc.hr.utils.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamsService {
    @Autowired
    private TeamsMapper teamsMapper;
    private Integer limit = 10;

    public TeamsVO findByPage(Integer page) {
        Integer index = (page-1)*limit;
        TeamsVO employeeVO = new TeamsVO();
        employeeVO.setData(teamsMapper.find(index,limit));
        employeeVO.setTotal(teamsMapper.count());
        employeeVO.setPageSize(limit);
        return employeeVO;
    }

    public Integer save(Teams teams) {
        String teamId = UUIDGenerator.getId();
        teams.setId(teamId);
        return teamsMapper.save(teams);
    }

    public void deleteById(String id) {
        teamsMapper.deleteById(id);
    }

    public Teams findById(String id) {
        return teamsMapper.findById(id);
    }


    public Integer update(Teams teams) {
        return teamsMapper.update(teams);
    }
}
