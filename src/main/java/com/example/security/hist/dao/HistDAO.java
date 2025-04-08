package com.example.security.hist.dao;

import com.example.security.hist.vo.HistVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HistDAO {

    void insertHist(String username);
    List<HistVO> getHistList();

}
