package com.hbgc.service;

import java.util.List;

import com.hbgc.entity.SysLog;


public interface SysLogService {

    int insertLog(SysLog sysLog);

    List<SysLog> selectLogAllPageHelper();

}
