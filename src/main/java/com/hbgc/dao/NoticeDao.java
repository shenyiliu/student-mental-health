package com.hbgc.dao;

import com.hbgc.entity.Notice;
import com.hbgc.entity.Yj;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface NoticeDao {

    @Select("select id,title,name,noticeTime,context from notice")
    List<Notice> selectAll();

    //id查询
    @Select("select id,title,name,noticeTime,context from notice where id=#{id}")
    Notice selectNoticeID(Integer id);

    //添加
    @Insert("insert into notice values(null,#{title},#{name},#{noticeTime},#{context})")
    int insertNotice(Notice notice);

    //修改
    @Update("update notice set title=#{title},name=#{name},noticeTime=#{noticeTime},context=#{context} where id=#{id}")
    int updateNotice(Notice notice);

    //删除
    @Delete("delete from notice where id=#{id}")
    int deleteNotice(Integer id);

    //查询平均值
    @Select("select\n" +
            "round(sum(qth)/count(1),2) as qth,\n" +
            "round(sum(qpzz)/count(1),2) as qpzz,\n" +
            "round(sum(rjgxmg)/count(1),2) as rjgxmg,\n" +
            "round(sum(yy)/count(1),2) as yy,\n" +
            "round(sum(jl)/count(1),2) as jl,\n" +
            "round(sum(dd)/count(1),2) as dd,\n" +
            "round(sum(kb)/count(1),2) as kb,\n" +
            "round(sum(pz)/count(1),2) as pz,\n" +
            "round(sum(jsbx)/count(1),2) as jsbx,\n" +
            "round(sum(qt)/count(1),2) as qt,\n" +
            "round(sum(zf)/count(1),2) as zf,\n" +
            "round(sum(pjf)/count(1),2) as pjf,\n" +
            "round(sum(yinxxms)/count(1),2) as yinxxms, \n" +
            "round(sum(yangxxms)/count(1),2) as yangxxms, \n" +
            "round(sum(yjfz)/count(1),2) as yjfz,\n" +
            "count(1) as sum,\n" +
            "round((select count(1) as jg from yw_xljk where jg='正常'),2) as jg\n" +
            "from yw_xljk ")
    Yj selectAVG();

    //正常平均值
    @Select("select\n" +
            "round(sum(qth)/count(1),2) as qth,\n" +
            "round(sum(qpzz)/count(1),2) as qpzz,\n" +
            "round(sum(rjgxmg)/count(1),2) as rjgxmg,\n" +
            "round(sum(yy)/count(1),2) as yy,\n" +
            "round(sum(jl)/count(1),2) as jl,\n" +
            "round(sum(dd)/count(1),2) as dd,\n" +
            "round(sum(kb)/count(1),2) as kb,\n" +
            "round(sum(pz)/count(1),2) as pz,\n" +
            "round(sum(jsbx)/count(1),2) as jsbx,\n" +
            "round(sum(qt)/count(1),2) as qt,\n" +
            "round(sum(zf)/count(1),2) as zf,\n" +
            "round(sum(pjf)/count(1),2) as pjf,\n" +
            "round(sum(yinxxms)/count(1),2) as yinxxms, \n" +
            "round(sum(yangxxms)/count(1),2) as yangxxms, \n" +
            "round(sum(yjfz)/count(1),2) as yjfz,\n" +
            "count(1) as sum,\n" +
            "round((select count(1) as jg from yw_xljk where jg='正常'),2) as jg\n" +
            "from yw_xljk where jg='正常'")
    Yj selectZcAVG();

    //不正常平均值
    @Select("select\n" +
            "round(sum(qth)/count(1),2) as qth,\n" +
            "round(sum(qpzz)/count(1),2) as qpzz,\n" +
            "round(sum(rjgxmg)/count(1),2) as rjgxmg,\n" +
            "round(sum(yy)/count(1),2) as yy,\n" +
            "round(sum(jl)/count(1),2) as jl,\n" +
            "round(sum(dd)/count(1),2) as dd,\n" +
            "round(sum(kb)/count(1),2) as kb,\n" +
            "round(sum(pz)/count(1),2) as pz,\n" +
            "round(sum(jsbx)/count(1),2) as jsbx,\n" +
            "round(sum(qt)/count(1),2) as qt,\n" +
            "round(sum(zf)/count(1),2) as zf,\n" +
            "round(sum(pjf)/count(1),2) as pjf,\n" +
            "round(sum(yinxxms)/count(1),2) as yinxxms, \n" +
            "round(sum(yangxxms)/count(1),2) as yangxxms, \n" +
            "round(sum(yjfz)/count(1),2) as yjfz,\n" +
            "count(1) as sum,\n" +
            "round((select count(1) as jg from yw_xljk where jg='正常'),2) as jg\n" +
            "from yw_xljk where jg='不正常'")
    Yj selectBzcAVG();
}
