package com.hbgc.service;

import com.hbgc.entity.Yj;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IYjService {

    List<Yj>  selectAll();

    int insertYj(Yj yj);

    int deleteYj(Integer id);

    boolean deleteALLYj(Integer[] ids);

    Yj selectYjID(Integer id);

    int updateYj(Yj yj);

    void importExclData(MultipartFile excl);


}
