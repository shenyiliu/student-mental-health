package com.hbgc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbgc.entity.Notice;
import com.hbgc.entity.Order;
import com.hbgc.entity.Yj;
import com.hbgc.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private INoticeService iNoticeService;

    //1.搜索全部公告
    @RequestMapping("/selectAll")
    @ResponseBody
    public PageInfo<Notice> selectAll(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                              @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize
                                             ){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<Notice> lists=iNoticeService.selectAll();
        //封装PageInfo对象
        PageInfo<Notice> pageInfo=new PageInfo<Notice>(lists);
        return pageInfo;

    }

    //添加insertNotice
    @RequestMapping("/insertNotice")
    @ResponseBody
    public int insertNotice(Notice notice){
        Date date = new Date();//获取当前的日期
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String str = df.format(date);//获取String类型的时间
        notice.setNoticeTime(str);
        int num=iNoticeService.insertNotice(notice);
        return num;
    }

    //修改 updateNotice
    @RequestMapping("/updateNotice")
    @ResponseBody
    public int updateNotice(Notice notice){
        Date date = new Date();//获取当前的日期
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String str = df.format(date);//获取String类型的时间
        notice.setNoticeTime(str);
        System.out.println(notice);
        int num=iNoticeService.updateNotice(notice);
        return num;
    }

    //根据id查询公告信息
    @RequestMapping("/selectNoticeID")
    @ResponseBody
    public ModelAndView selectNoticeID(Integer id){
        ModelAndView mv=new ModelAndView();
        Notice num=iNoticeService.selectNoticeID(id);
        mv.addObject("notice",num);
        mv.setViewName("gg-edit");
        return mv;
    }

    //单个删除 deleteNotice
    @RequestMapping("/deleteNotice")
    @ResponseBody
    public int deleteNotice(Integer id){
        return iNoticeService.deleteNotice(id);
    }

    //批量删除
    @RequestMapping("/deleteNoticeItem")
    @ResponseBody
    public boolean deleteNoticeItem(Integer[] ids){
        return iNoticeService.deleteNoticeItem(ids);
    }

    //获取数据的平均值 selectAVG
    @RequestMapping("/selectAVG")
    @ResponseBody
    public Yj selectAVG(){
        Yj yj=iNoticeService.selectAVG();
        System.out.println(yj);
        return yj;
    }

    //获取正常的平均值 selectZcAVG
    @RequestMapping("/selectZcAVG")
    @ResponseBody
    public Yj selectZcAVG(){
        Yj yj=iNoticeService.selectZcAVG();
        return yj;
    }

    //获取不正常的平均值 selectBzcAVG
    @RequestMapping("/selectBzcAVG")
    @ResponseBody
    public Yj selectBzcAVG(){
        Yj yj=iNoticeService.selectBzcAVG();
        return yj;
    }
}
