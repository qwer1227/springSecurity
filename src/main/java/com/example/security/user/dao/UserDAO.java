package com.example.security.user.dao;

import com.example.security.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {

    UserVO getUserByUsername(String username);
    void insertUser(UserVO user);
}
