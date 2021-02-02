package org.mtc.hr.controller.emp;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.mtc.hr.model.*;
import org.mtc.hr.service.*;
import org.mtc.hr.utils.POIUtils;
import org.mtc.hr.model.*;
import org.mtc.hr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @Description: TODO
 * @author: Devin Liu
 * @时间 2019-10-29 7:41
 */
@RestController
@RequestMapping("/employee/basic")
public class EmpBasicController {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    NationService nationService;
    @Autowired
    PoliticsstatusService politicsstatusService;
    @Autowired
    JobLevelService jobLevelService;
    @Autowired
    PositionService positionService;
    @Autowired
    DepartmentService departmentService;

    @GetMapping("/")
    @ApiOperation("Get Employee By Page")
    public RespPageBean getEmployeeByPage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, Employee employee, Date[] beginDateScope) {
        return employeeService.getEmployeeByPage(page, size, employee,beginDateScope);
    }

    @PostMapping("/")
    @ApiOperation("Add Employee")
    public RespBean addEmp(@RequestBody Employee employee) {
        if (employeeService.addEmp(employee) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    @DeleteMapping("/{id}")
    @ApiOperation("Delete Employee")
    public RespBean deleteEmpByEid(@PathVariable Integer id) {
        if (employeeService.deleteEmpByEid(id) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

    @PutMapping("/")
    @ApiOperation("Update Employee")
    public RespBean updateEmp(@RequestBody Employee employee) {
        if (employeeService.updateEmp(employee) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @GetMapping("/nations")
    @ApiOperation("Get nations")
    public List<Nation> getAllNations() {
        return nationService.getAllNations();
    }

    @GetMapping("/politicsstatus")
    @ApiOperation("Get Political Status")
    public List<Politicsstatus> getAllPoliticsstatus() {
        return politicsstatusService.getAllPoliticsstatus();
    }

    @GetMapping("/joblevels")
    @ApiOperation("Get Job Levels")
    public List<JobLevel> getAllJobLevels() {
        return jobLevelService.getAllJobLevels();
    }

    @GetMapping("/positions")
    @ApiOperation("Get Positions")
    public List<Position> getAllPositions() {
        return positionService.getAllPositions();
    }

    @GetMapping("/maxWorkID")
    @ApiOperation("Get Max Work ID")
    public RespBean maxWorkID() {
        RespBean respBean = RespBean.build().setStatus(200)
                .setObj(String.format("%08d", employeeService.maxWorkID() + 1));
        return respBean;
    }

    @GetMapping("/deps")
    @ApiOperation("Get Departments")
    public List<Department> getAllDepartments() {
        return departmentService.getAllDepartments();
    }

    @GetMapping("/export")
    @ApiOperation("Export Employee Data")
    public ResponseEntity<byte[]> exportData() {
        List<Employee> list = (List<Employee>) employeeService.getEmployeeByPage(null, null, new Employee(),null).getData();
        return POIUtils.employee2Excel(list);
    }

    @PostMapping("/import")
    @ApiOperation("Import Employee Data")
    public RespBean importData(MultipartFile file) throws IOException {
        List<Employee> list = POIUtils.excel2Employee(file, nationService.getAllNations(), politicsstatusService.getAllPoliticsstatus(), departmentService.getAllDepartmentsWithOutChildren(), positionService.getAllPositions(), jobLevelService.getAllJobLevels());
        if (employeeService.addEmps(list) == list.size()) {
            return RespBean.ok("上传成功");
        }
        return RespBean.error("上传失败");
    }
}
