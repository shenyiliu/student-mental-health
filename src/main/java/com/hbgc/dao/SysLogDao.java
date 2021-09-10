package com.hbgc.dao;

import java.util.List;

import com.hbgc.entity.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;



public interface SysLogDao {

    @Insert("insert syslog values (null,#{username},#{url},#{ip},#{method},#{visitTime},#{times})")
    int insertLog(SysLog sysLog);

    @Select("select * from syslog")
    List<SysLog> selectLogAllPageHelper();

}
