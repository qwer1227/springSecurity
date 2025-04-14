package com.example.security.user.service;

import com.example.security.user.Enum.UserJoinResult;
import com.example.security.user.dto.InsertForm;
import com.example.security.user.vo.UserVO;

public interface UserService {

    UserVO getUserByUsername(String username);
    UserJoinResult insertUser(InsertForm user);

}
