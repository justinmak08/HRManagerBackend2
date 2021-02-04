package org.mtc.hr.mapper;

import org.apache.ibatis.annotations.Param;
import org.mtc.hr.model.Employee;
import org.mtc.hr.model.Menu;

import java.util.Date;
import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    List<Menu> getMenusByHrId(Integer hrid);

    List<Menu> getAllMenusWithRole();

    List<Menu> getAllMenus();

    List<Integer> getMidsByRid(Integer rid);

    List<Menu> getMenuByPage(@Param("page") Integer page, @Param("size") Integer size, @Param("menu") Menu menu);

    Long getTotal(@Param("menu") Menu menu);
}