package org.mtc.hr.controller;

import org.mtc.hr.model.Employee;
import org.mtc.hr.service.TeamsService;
import org.mtc.hr.model.Teams;
import org.mtc.hr.model.TeamsVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.mtc.hr.utils.POIUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api
@RequestMapping("/teams/basic")
public class TeamsController {

    @Autowired
    private TeamsService teamsService;

    @GetMapping("/findByPage/{page}")
    @ApiOperation(("findByPage"))
    public TeamsVO findByPage(@PathVariable("page") Integer page){
        return teamsService.findByPage(page);
    }

    @GetMapping("/getTeams")
    @ApiOperation(("getTeams"))
    public List<Teams> getTeams() {
        return teamsService.getTeams();
    }

    @PostMapping("/save")
    @ApiOperation(("save"))
    public Integer save(@RequestBody Teams teams){
        return teamsService.save(teams);
    }

    @DeleteMapping("/deleteById/{id}")
    @ApiOperation(("deleteById"))
    public void deleteById(@PathVariable("id") String id){
        teamsService.deleteById(id);
    }

    @GetMapping("/findById/{id}")
    @ApiOperation(("findById"))
    public Teams findById(@PathVariable("id") String id){
        return teamsService.findById(id);
    }

    @PutMapping("/teamsUpdate")
    @ApiOperation(("teamsUpdate"))
    public Integer update(@RequestBody Teams teams){
        return teamsService.update(teams);
    }

    @GetMapping("/export")
    @ApiOperation("Export Employee Data")
    public ResponseEntity<byte[]> exportData() {
        return POIUtils.teams2Excel(teamsService.getTeams());
    }
}
