package com.example.security.board.service.impl;

import com.example.security.board.dao.BoardDao;
import com.example.security.board.dto.BoardForm;
import com.example.security.board.dto.SearchDto;
import com.example.security.board.service.BoardService;
import com.example.security.board.vo.BoardVO;
import com.example.security.user.dao.UserDAO;
import com.example.security.user.vo.UserVO;
import com.example.security.utils.ListDto;
import com.example.security.utils.Pagination;
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
    public ListDto<BoardVO> getBoardList(SearchDto searchDto) {
        int totalRows = boardDao.getTotalRows(searchDto);
        int page = searchDto.getPage();
        int rows = searchDto.getRows();

        Pagination pagination = new Pagination(page, totalRows , rows);

        searchDto.setBegin(pagination.getBegin());
        searchDto.setEnd(pagination.getEnd());

        List<BoardVO> boardList = boardDao.getBoardList(searchDto);
        ListDto<BoardVO> dto = new ListDto<>(boardList,pagination);

        return dto;
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

    @Override
    public int updatePost(BoardForm vo, Principal principal) {

        BoardVO boardVO = BoardVO.builder()
                .title(vo.getTitle())
                .content(vo.getContent())
                .postNo(vo.getPostNo())
                .build();

        boardDao.updatePost(boardVO);

        return boardVO.getPostNo();
    }

    @Override
    public void deletePost(int id) {

        boardDao.deletePost(id);

    }

}
