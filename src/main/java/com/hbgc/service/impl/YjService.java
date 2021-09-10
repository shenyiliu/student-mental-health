package com.hbgc.service.impl;

import com.hbgc.aop.impl.ExcelUtils;
import com.hbgc.dao.YjDao;
import com.hbgc.entity.Yj;
import com.hbgc.service.IYjService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class YjService implements IYjService {

    @Autowired
    private YjDao yjDao;

    private ExcelUtils excelUtils;


    //查询所有信息
    @Override
    public  List<Yj>  selectAll() {
        return yjDao.selectAll();
    }

    @Override
    public int insertYj(Yj yj) {
        return yjDao.insertYj(yj);
    }

    @Override
    public int deleteYj(Integer id) {
        return yjDao.deleteYj(id);
    }

    @Override
    public boolean deleteALLYj(Integer[] ids) {
        for (int i = 0; i < ids.length; i++) {
            yjDao.deleteYj(ids[i]);
        }
        return false;
    }

    @Override
    public Yj selectYjID(Integer id) {
        return yjDao.selectYjID(id);
    }

    @Override
    public int updateYj(Yj yj) {
        return yjDao.updateYj(yj);
    }

    //导入表格
    @Override
    public void importExclData(MultipartFile excl) {
        InputStream in = null;
        try {
            in = excl.getInputStream();
            // 获取execl文件对象
            Workbook workbook = null;
            // 根据后缀，得到不同的Workbook子类，即HSSFWorkbook或XSSFWorkbook
            if (excl.getOriginalFilename().endsWith("xlsx")) {
                workbook = new XSSFWorkbook(in);//给定输入流读取文件创建XLSX操作对象
            } else if (excl.getOriginalFilename().endsWith("xls")) {
                workbook = new HSSFWorkbook(in);//给定输入流读取文件创建XLS操作对象
            } else {
                throw new Exception("文件格式不对或者文件损坏....");
            }
            // 获得sheet对应对象 获取第一页对象
            Sheet sheet = workbook.getSheetAt(0);
            // 创建Station对象容器
            // 解析sheet,获得多行数据，并放入迭代器中
            Iterator<Row> ito = sheet.iterator();

            Row row = null;
            int count = 0;
            while (ito.hasNext()) {

                row = ito.next();
                // 由于第一行是标题因此这里单独处理
                if (count == 0) {
                    ++count;
                    continue;
                } else {
                    if (row != null) {
                        Yj yj=new Yj();

                        String qth=excelUtils.getCellValue( row.getCell(0));
                        String qpzz=excelUtils.getCellValue( row.getCell(1));
                        String rjgxmg=excelUtils.getCellValue( row.getCell(2));
                        String yy=excelUtils.getCellValue( row.getCell(3));
                        String jl=excelUtils.getCellValue( row.getCell(4));
                        String dd=excelUtils.getCellValue( row.getCell(5));
                        String kb=excelUtils.getCellValue( row.getCell(6));
                        String pz=excelUtils.getCellValue( row.getCell(7));
                        String jsbx=excelUtils.getCellValue( row.getCell(8));
                        String qt=excelUtils.getCellValue( row.getCell(9));
                        String zf=excelUtils.getCellValue( row.getCell(10));
                        String pjf=excelUtils.getCellValue( row.getCell(11));
                        String yinxxms=excelUtils.getCellValue( row.getCell(12));
                        String yangxxms=excelUtils.getCellValue( row.getCell(13));
                        String yjyz=excelUtils.getCellValue( row.getCell(14));
                        String yjfz=excelUtils.getCellValue( row.getCell(15));
                        String yjsm=excelUtils.getCellValue( row.getCell(16));
                        String jg=excelUtils.getCellValue( row.getCell(17));

                        System.out.println("========"+qth);


                        yj.setQth(qth);
                        yj.setQpzz(qpzz);
                        yj.setRjgxmg(rjgxmg);
                        yj.setYy(yy);
                        yj.setJl(jl);
                        yj.setDd(dd);
                        yj.setKb(kb);
                        yj.setPz(pz);
                        yj.setJsbx(jsbx);
                        yj.setQt(qt);
                        yj.setZf(zf);
                        yj.setPjf(pjf);
                        yj.setYinxxms(yinxxms);
                        yj.setYangxxms(yangxxms);
                        yj.setYjyz(yjyz);
                        yj.setYjfz(yjfz);
                        yj.setYjsm(yjsm);
                        yj.setJg(jg);



                        //依次添加，因为oracle最大可容纳1000游标，只能依次添加
                        yjDao.insertYj(yj);

                    }
                }

            }

        }catch(Exception e) {
            e.printStackTrace();
        }
    }

}
