package com.example.security.hist.service;

import com.example.security.hist.vo.HistVO;

import java.util.List;

public interface HistService {

    void insertHist(String username);
    List<HistVO> getHistList();

}
