package com.hbgc.controller;

import com.hbgc.entity.Notice;
import com.hbgc.entity.User;
import com.hbgc.service.IMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/main")
public class MainController {

    @Autowired
    private IMainService iMainService;

    @RequestMapping("/selectUserIndex")
    @ResponseBody
    public int selectUserIndex(){
        int num=iMainService.selectUserIndex();
        return num;
    }

    @RequestMapping("/selectRoleIndex")
    @ResponseBody
    public int selectRoleIndex(){
        int num=iMainService.selectRoleIndex();
        return num;
    }

    @RequestMapping("/selectPermissionIndex")
    @ResponseBody
    public int selectPermissionIndex(){
        int num=iMainService.selectPermissionIndex();
        return num;
    }

    @RequestMapping("/selectYwIndex")
    @ResponseBody
    public int selectYwIndex(){
        int num=iMainService.selectYwIndex();
        return num;
    }

    //查询全部公告信息selectNoticeAll
    @RequestMapping("/selectNoticeAll")
    @ResponseBody
    public List<Notice> selectNoticeAll(){
        return iMainService.selectNoticeAll();
    }

    //6.根据id查询公告内容
    @RequestMapping("/selectNoticeContext")
    @ResponseBody
    public Notice selectNoticeContext(Integer id){
        return iMainService.selectNoticeContext(id);
    }
}
