package org.mtc.hr.mapper;

import org.mtc.hr.model.Personnel;

import java.util.List;

public interface PersonnelMapper {
    public List<Personnel> find(Integer index, Integer limit);
    public Integer count();
    public Integer save(Personnel employee);
    public boolean deleteById(String id);
    public Personnel findById(String id);
    public Integer update(Personnel employee);
    public List<Personnel> getPersonnelByTitle(String title);
    public List<Personnel> getAllPersonnel();
}