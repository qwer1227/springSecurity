package com.example.security.board.service;

import com.example.security.board.dto.BoardForm;
import com.example.security.board.dto.SearchDto;
import com.example.security.board.vo.BoardVO;
import com.example.security.utils.ListDto;

import java.security.Principal;


public interface BoardService {

    ListDto<BoardVO> getBoardList(SearchDto searchDto);
    BoardVO getBoardById(int id);
    int insertPost(BoardForm board, Principal principal);
    int updatePost(BoardForm board, Principal principal);
    void deletePost(int id);


}
