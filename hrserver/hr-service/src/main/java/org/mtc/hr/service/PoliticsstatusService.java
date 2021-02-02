package org.mtc.hr.service;

import org.mtc.hr.mapper.PoliticsstatusMapper;
import org.mtc.hr.model.Politicsstatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: TODO
 * @author: Devin Liu
 * @date: 2021年2月1日 10:07
 * @时间 2019-11-03 23:20
 */
@Service
public class PoliticsstatusService {
    @Autowired
    PoliticsstatusMapper politicsstatusMapper;
    public List<Politicsstatus> getAllPoliticsstatus() {
        return politicsstatusMapper.getAllPoliticsstatus();
    }
}
