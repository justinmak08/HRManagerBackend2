package org.mtc.hr.controller;

import org.mtc.hr.service.PersonnelService;
import org.mtc.hr.model.Personnel;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.mtc.hr.model.PersonnelVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@Api
@RequestMapping("/personnel/basic")
public class PersonnelController {

    @Autowired
    private PersonnelService personnelService;

    @GetMapping("/findByPage/{page}")
    @ApiOperation(("findByPage"))
    public PersonnelVO findByPage(@PathVariable("page") Integer page){
        return personnelService.findByPage(page);
    }

    @PostMapping("/save")
    @ApiOperation(("save"))
    public Integer save(@RequestBody Personnel personnel){
        return personnelService.save(personnel);
    }

    @DeleteMapping("/deleteById/{id}")
    @ApiOperation(("deleteById"))
    public void deleteById(@PathVariable("id") String id) {
        personnelService.deleteById(id);
    }

    @GetMapping("/findById/{id}")
    @ApiOperation(("findById"))
    public Personnel findById(@PathVariable("id") String id){
        return personnelService.findById(id);
    }

    @PutMapping("/employeeUpdate")
    @ApiOperation(("employeeUpdate"))
    public Integer update(@RequestBody Personnel personnel){
        return personnelService.update(personnel);
    }
}
