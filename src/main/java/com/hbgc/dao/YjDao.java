package com.hbgc.dao;

import com.hbgc.entity.Yj;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface YjDao {

    @Select("select corrp_id,qth,qpzz,rjgxmg,yy,jl,dd,kb,pz,jsbx,qt,zf,pjf,yinxxms,yangxxms,yjyz,yjfz,yjsm,jg from yw_xljk")
    List<Yj>  selectAll();

    @Insert("INSERT INTO `yw_xljk` (`corrp_id`, `qth`, `qpzz`, `rjgxmg`, `yy`, `jl`, `dd`, `kb`, `pz`, `jsbx`, `qt`, `zf`, `pjf`, `yinxxms`, `yangxxms`, `yjyz`, `yjfz`, `yjsm`, `jg`) VALUES (null,#{qth},#{qpzz}, #{rjgxmg},#{yy}, #{jl}, #{dd}, #{kb}, #{pz},#{jsbx},#{qt}, #{zf},#{pjf},#{yinxxms},#{yangxxms},#{yjyz}, #{yjfz},#{yjsm}, #{jg});")
    int insertYj(Yj yj);

    @Delete("delete from  `yw_xljk` where `corrp_id`=#{corrp_id}")
    int deleteYj(Integer id);

    @Select("select corrp_id,qth,qpzz,rjgxmg,yy,jl,dd,kb,pz,jsbx,qt,zf,pjf,yinxxms,yangxxms,yjyz,yjfz,yjsm,jg from `yw_xljk` where `corrp_id`=#{id};")
    Yj selectYjID(Integer id);

    @Update("update `yw_xljk` set qth=#{qth},qpzz=#{qpzz},rjgxmg=#{rjgxmg},yy=#{yy},jl=#{jl},dd=#{dd},kb=#{kb},pz=#{pz},jsbx=#{jsbx},qt=#{qt},zf=#{zf},pjf=#{pjf},yinxxms=#{yinxxms},yangxxms=#{yangxxms},yjyz=#{yjyz},yjfz=#{yjfz},yjsm=#{yjsm},jg=#{jg} where corrp_id=#{corrpid}")
    int updateYj(Yj yj);
}
