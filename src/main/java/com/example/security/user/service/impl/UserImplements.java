package com.example.security.user.service.impl;

import com.example.security.user.Enum.UserJoinResult;
import com.example.security.user.dao.UserDAO;
import com.example.security.user.dto.InsertForm;
import com.example.security.user.service.UserService;
import com.example.security.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class UserImplements implements UserService {

    private final UserDAO userDAO;
    private final PasswordEncoder passwordEncoder;

    @Override
    public UserVO getUserByUsername(String username) {
        return userDAO.getUserByUsername(username);
    }

    @Override
    public UserJoinResult insertUser(InsertForm user) {

        if(user.getPassword().equals(user.getConfirmPassword())) {
            UserVO userVO = UserVO.builder()
                    .memberNm(user.getUsername())
                    .memberPw(passwordEncoder.encode(user.getPassword()))
                    .build();
            userDAO.insertUser(userVO);
        } else {
            return UserJoinResult.PASSWORD_MISMATCH;
        }

        return UserJoinResult.SUCCESS;
    }


}
