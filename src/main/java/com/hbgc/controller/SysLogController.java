package com.hbgc.controller;

import java.util.List;

import com.hbgc.entity.SysLog;
import com.hbgc.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping("/syslog")
public class SysLogController {

    @Autowired
    private SysLogService sysLogService;

    @RequestMapping("/selectLogAllPageHelper")
    @ResponseBody
    public PageInfo<SysLog> selectLogAllPageHelper(
            @RequestParam(name = "pageNum", defaultValue = "1", required = false) Integer pageNum,
            @RequestParam(name = "pageSize", defaultValue = "20", required = false) Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        List<SysLog> list = sysLogService.selectLogAllPageHelper();

        PageInfo<SysLog> pageInfo = new PageInfo<SysLog>(list);
        return pageInfo;
    }

}
