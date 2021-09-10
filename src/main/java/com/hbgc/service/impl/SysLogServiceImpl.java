package com.hbgc.service.impl;

import java.util.List;

import com.hbgc.dao.SysLogDao;
import com.hbgc.entity.SysLog;
import com.hbgc.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class SysLogServiceImpl implements SysLogService {

    @Autowired
    private SysLogDao sysLogDao;

    @Override
    public int insertLog(SysLog sysLog) {
        return sysLogDao.insertLog(sysLog);
    }

    @Override
    public List<SysLog> selectLogAllPageHelper() {
        return sysLogDao.selectLogAllPageHelper();
    }

}
