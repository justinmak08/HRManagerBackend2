package org.mtc.hr.config.service.impl;

import org.mtc.hr.model.Personnel;
import org.mtc.hr.model.PersonnelVO;
import org.mtc.hr.mapper.PersonnelMapper;
import org.mtc.hr.utils.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonnelService {
    @Autowired 
    private PersonnelMapper personnelMapper;
    private Integer limit = 10;

    public PersonnelVO findByPage(Integer page) {
        Integer index = (page-1)*limit;
        PersonnelVO personnelVO = new PersonnelVO();
        personnelVO.setData(personnelMapper.find(index,limit));
        personnelVO.setTotal(personnelMapper.count());
        personnelVO.setPageSize(limit);
        return personnelVO;
    }

    public Integer save(Personnel personnel) {
        String employeeId = UUIDGenerator.getId();
        personnel.setId(employeeId);
        return personnelMapper.save(personnel);
    }

    public void deleteById(String id) {
        personnelMapper.deleteById(id);
    }

    public Personnel findById(String id) {
        return personnelMapper.findById(id);
    }

    public Integer update(Personnel personnel) {
        return personnelMapper.update(personnel);
    }
}
