package org.mtc.hr.service;

import org.mtc.hr.model.Teams;
import org.mtc.hr.model.TeamsVO;
import org.mtc.hr.mapper.TeamsMapper;
import org.mtc.hr.utils.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TeamsService {
    @Autowired
    private TeamsMapper teamsMapper;
    private Integer limit = 10;
    private List<String> ids = new ArrayList<String>();

    public TeamsVO findByPage(Integer page) {
        Integer index = (page-1)*limit;
        TeamsVO employeeVO = new TeamsVO();
        employeeVO.setData(teamsMapper.find(index,limit));
        employeeVO.setTotal(teamsMapper.count());
        employeeVO.setPageSize(limit);
        return employeeVO;
    }

    private void updateIds(List<Teams> teams) {
        if (teams.size() != ids.size()) {
            ids.clear();
            for (Teams team : teams) {
                ids.add(team.getId());
            }
        }
    }

    public Integer save(Teams teams) {
        String teamId = UUIDGenerator.getId();
        teams.setId(teamId);
        return teamsMapper.save(teams);
    }

    public Integer saveWithId(Teams teams) {
        return teamsMapper.save(teams);
    }

    public void deleteById(String id) {
        teamsMapper.deleteById(id);
    }

    public Teams findById(String id) {
        return teamsMapper.findById(id);
    }

    public List<Teams> getTeams() {
        return teamsMapper.getTeams();
    }

    public Integer update(Teams teams) {
        return teamsMapper.update(teams);
    }

    public Integer addTeams(List<Teams> list) {
        updateIds(getTeams());
        for (Teams team : list) {
            if(!(ids.contains(team.getId()))) {
                ids.add(team.getId());
                System.out.println(team);
                if (saveWithId(team) == 0) {
                    return 0;
                }

            }
        }
        return 1;
    }
}
