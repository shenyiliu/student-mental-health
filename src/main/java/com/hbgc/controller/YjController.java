package com.hbgc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbgc.entity.Order;
import com.hbgc.entity.User;
import com.hbgc.entity.Yj;
import com.hbgc.service.IYjService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Controller
@RequestMapping("/yj")
public class YjController {

    @Autowired
    private IYjService yjService;


    //查询所有信息
    @RequestMapping("/selectAll")
    @ResponseBody
    public PageInfo<Yj> selectAll(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                     @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<Yj> list= yjService.selectAll();
        //封装PageInfo对象
        PageInfo<Yj> pageInfo=new PageInfo<Yj>(list);
        return pageInfo;

    }

    //添加信息
    @RequestMapping("/insertYj")
    @ResponseBody
    public ModelAndView insertYj(Yj yj){
        int num= yjService.insertYj(yj);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("yj-list");
        return mv;
    }


    //单个删除
    @RequestMapping("/deleteYj")
    @ResponseBody
    public int deleteYj(Integer id){
        int num= yjService.deleteYj(id);
        return num;
    }

    //批量删除
    @RequestMapping("/deleteALLYj")
    @ResponseBody
    public boolean deleteALLYj(Integer[] ids){
        return yjService.deleteALLYj(ids);
    }

    //根据id查询信息
    @RequestMapping("/selectYjID")
    @ResponseBody
    public ModelAndView selectYjID(Integer id){
        ModelAndView mv=new ModelAndView();
        Yj yj=yjService.selectYjID(id);
        mv.addObject("list",yj);
        mv.setViewName("yj-edit");
        return mv;
    }

    //修改信息
    @RequestMapping("/updateYj")
    @ResponseBody
    public ModelAndView updateYj(Yj yj){
        ModelAndView mv=new ModelAndView();
        int num=yjService.updateYj(yj);
        mv.setViewName("yj-list");
        return mv;
    }

    //导入文件
    @RequestMapping(value = "/importFile",method = RequestMethod.POST)
    @ResponseBody
    public boolean importFile(@RequestParam("file") MultipartFile excl){
        System.out.println("-------------"+excl);
        yjService.importExclData(excl);
        return false;
    }

    //导出文件
    @RequestMapping(value = "/exportFile")
    public void exportFile(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");

        List<Yj> yjs=yjService.selectAll();
        //创建excel文件
        HSSFWorkbook wb=new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet= wb.createSheet("大学生预警数据表");
        //创建标题行
        HSSFRow row= sheet.createRow(0);
        row.createCell(0).setCellValue("ID");
        row.createCell(1).setCellValue("躯体化");
        row.createCell(2).setCellValue("强迫症状");
        row.createCell(3).setCellValue("人际关系敏感");
        row.createCell(4).setCellValue("抑郁");
        row.createCell(5).setCellValue("焦虑");
        row.createCell(6).setCellValue("敌对");
        row.createCell(7).setCellValue("恐怖");
        row.createCell(8).setCellValue("偏执");
        row.createCell(9).setCellValue("精神病性");
        row.createCell(10).setCellValue("其他");
        row.createCell(11).setCellValue("总分");
        row.createCell(12).setCellValue("平均分");
        row.createCell(13).setCellValue("阴性项目数");
        row.createCell(14).setCellValue("阳性项目数");
        row.createCell(15).setCellValue("预警因子");
        row.createCell(16).setCellValue("预警分值");
        row.createCell(17).setCellValue("预警说明");
        row.createCell(18).setCellValue("警告");

        //便利将数据添加到excel中
        for (Yj yj: yjs){
            HSSFRow dataRow=sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(yj.getCorrpid());
            dataRow.createCell(1).setCellValue(yj.getQth());
            dataRow.createCell(2).setCellValue(yj.getQpzz());
            dataRow.createCell(3).setCellValue(yj.getRjgxmg());
            dataRow.createCell(4).setCellValue(yj.getYy());
            dataRow.createCell(5).setCellValue(yj.getJl());
            dataRow.createCell(6).setCellValue(yj.getDd());
            dataRow.createCell(7).setCellValue(yj.getKb());
            dataRow.createCell(8).setCellValue(yj.getPz());
            dataRow.createCell(9).setCellValue(yj.getJsbx());
            dataRow.createCell(10).setCellValue(yj.getQt());
            dataRow.createCell(11).setCellValue(yj.getZf());
            dataRow.createCell(12).setCellValue(yj.getPjf());
            dataRow.createCell(13).setCellValue(yj.getYinxxms());
            dataRow.createCell(14).setCellValue(yj.getYangxxms());
            dataRow.createCell(15).setCellValue(yj.getYjyz());
            dataRow.createCell(16).setCellValue(yj.getYjfz());
            dataRow.createCell(17).setCellValue(yj.getYjsm());
            dataRow.createCell(18).setCellValue(yj.getJg());

        }

        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("大学生预警数据表".getBytes(),"iso-8859-1") + ".xls");


        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();


    }
}
