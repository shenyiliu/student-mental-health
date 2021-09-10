package com.hbgc.service.impl;

import com.hbgc.dao.NoticeDao;
import com.hbgc.entity.Notice;
import com.hbgc.entity.Yj;
import com.hbgc.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService implements INoticeService {

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public List<Notice> selectAll() {
        return noticeDao.selectAll();
    }

    //添加
    @Override
    public int insertNotice(Notice notice) {
        return noticeDao.insertNotice(notice);
    }

    //修改
    @Override
    public int updateNotice(Notice notice) {
        return noticeDao.updateNotice(notice);
    }

    @Override
    public Notice selectNoticeID(Integer id) {
        return noticeDao.selectNoticeID(id);
    }

    //删除单个
    @Override
    public int deleteNotice(Integer id) {
        return noticeDao.deleteNotice(id);
    }

    //删除批量
    @Override
    public boolean deleteNoticeItem(Integer[] ids) {
        for (int i = 0; i < ids.length; i++) {
            noticeDao.deleteNotice(ids[i]);
        }
        return false;
    }

    //获取全部数据平均值
    @Override
    public Yj selectAVG() {
        return noticeDao.selectAVG();
    }

    //正常平均值
    @Override
    public Yj selectZcAVG() {
        return noticeDao.selectZcAVG();
    }

    //不正常平均值
    @Override
    public Yj selectBzcAVG() {
        return noticeDao.selectBzcAVG();
    }
}
