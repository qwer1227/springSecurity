package com.example.security.user.service;

import com.example.security.user.vo.UserVO;

public interface UserService {

    UserVO getUserByUsername(String username);

}
