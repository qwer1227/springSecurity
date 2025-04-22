package com.example.security.board.service;

import com.example.security.board.dto.BoardForm;
import com.example.security.board.vo.BoardVO;

import java.security.Principal;
import java.util.List;

public interface BoardService {

    List<BoardVO> getBoardList();
    BoardVO getBoardById(int id);
    int insertPost(BoardForm board, Principal principal);
}
