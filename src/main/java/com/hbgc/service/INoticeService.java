package com.hbgc.service;

import com.hbgc.entity.Notice;
import com.hbgc.entity.Yj;

import java.util.List;

public interface INoticeService {

    List<Notice> selectAll();

    int insertNotice(Notice notice);

    int updateNotice(Notice notice);

    Notice selectNoticeID(Integer id);

    int deleteNotice(Integer id);

    boolean deleteNoticeItem(Integer[] ids);

    Yj selectAVG();

    Yj selectZcAVG();

    Yj selectBzcAVG();
}
