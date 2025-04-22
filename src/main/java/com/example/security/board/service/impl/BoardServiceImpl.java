package com.example.security.board.service.impl;

import com.example.security.board.dao.BoardDao;
import com.example.security.board.dto.BoardForm;
import com.example.security.board.service.BoardService;
import com.example.security.board.vo.BoardVO;
import com.example.security.user.dao.UserDAO;
import com.example.security.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardDao boardDao;
    private final UserDAO userDAO;

    @Override
    public List<BoardVO> getBoardList() {
        return boardDao.getBoardList();
    }

    @Override
    public BoardVO getBoardById(int id) {
        return boardDao.getBoardById(id);
    }

    @Override
    public int insertPost(BoardForm vo, Principal principal) {

        String loginId = principal.getName();
        UserVO user = userDAO.getUserByUsername(loginId);
        vo.setMemberNo(user.getMemberNo());

        BoardVO board = BoardVO.builder()
                .title(vo.getTitle())
                .content(vo.getContent())
                .memberNo(user.getMemberNo())
                .build();

        boardDao.insertPost(board);

        return board.getPostNo();
    }
}
