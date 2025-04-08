package com.example.security.user.service.impl;

import com.example.security.user.dao.UserDAO;
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
    public void insertUser(UserVO user) {
        user.setMember_pw(passwordEncoder.encode(user.getMember_pw()));
        userDAO.insertUser(user);
    }


}
