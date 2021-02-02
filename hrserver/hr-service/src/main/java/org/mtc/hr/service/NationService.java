package org.mtc.hr.service;

import org.mtc.hr.mapper.NationMapper;
import org.mtc.hr.model.Nation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: TODO
 * @author: Devin Liu
 * @时间 2019-11-03 23:20
 */
@Service
public class NationService {
    @Autowired
    NationMapper nationMapper;
    public List<Nation> getAllNations() {
        return nationMapper.getAllNations();
    }
}
