package org.mtc.hr.controller.salary;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.mtc.hr.model.RespBean;
import org.mtc.hr.model.RespPageBean;
import org.mtc.hr.model.Salary;
import org.mtc.hr.service.EmployeeService;
import org.mtc.hr.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/salary/sobcfg")
public class SobConfigController {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    SalaryService salaryService;

    @GetMapping("/")
    @ApiOperation("Get Employee Salary By Page")
    public RespPageBean getEmployeeByPageWithSalary(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        return employeeService.getEmployeeByPageWithSalary(page, size);
    }

    @GetMapping("/salaries")
    @ApiOperation("Get All Salaries")
    public List<Salary> getAllSalaries() {
        return salaryService.getAllSalaries();
    }

    @PutMapping("/")
    @ApiOperation("Update Employee Salary")
    public RespBean updateEmployeeSalaryById(Integer eid, Integer sid) {
        Integer result = employeeService.updateEmployeeSalaryById(eid, sid);
        if (result == 1 || result == 2) {
            return RespBean.ok("更新成功");
        }
        return RespBean.error("更新失败");
    }
}
