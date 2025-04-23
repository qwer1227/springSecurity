package com.example.security.board.dao;

import com.example.security.board.dto.SearchDto;
import com.example.security.board.vo.BoardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDao {

    List<BoardVO> getBoardList(SearchDto searchDto);
    BoardVO getBoardById(int id);
    void insertPost(BoardVO board);
    void updatePost(BoardVO board);
    int getTotalRows(SearchDto searchDto);
    void deletePost(int id);

}
