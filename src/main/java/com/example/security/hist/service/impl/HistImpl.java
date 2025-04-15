package com.example.security.hist.service.impl;

import com.example.security.hist.dao.HistDAO;
import com.example.security.hist.service.HistService;
import com.example.security.hist.vo.HistVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HistImpl implements HistService {

    private final HistDAO histDAO;

    @Override
    public void insertHist(String username) {
        histDAO.insertHist(username);
    }

    @Override
    public List<HistVO> getHistList() {
        return histDAO.getHistList();
    }
}
