package com.example.security.board.dao;

import com.example.security.board.vo.BoardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDao {

    List<BoardVO> getBoardList();
    BoardVO getBoardById(int id);
    void insertPost(BoardVO board);
}
