package org.mtc.hr.controller.menu;

import io.swagger.annotations.ApiOperation;
import org.mtc.hr.model.Menu;
import org.mtc.hr.model.RespPageBean;
import org.mtc.hr.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("/menu/basic")

public class MenuController {
    @Autowired
    MenuService menuService;

    @GetMapping("/")
    @ApiOperation("Get Menu By Page")
    public RespPageBean getMenuByPage(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, Menu menu) {
        return menuService.getMenuByPage(page, size, menu);
    }
}
