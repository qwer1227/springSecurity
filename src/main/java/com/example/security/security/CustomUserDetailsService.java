package com.example.security.security;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.example.security.user.dao.UserDAO;
import com.example.security.user.vo.UserVO;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService  implements UserDetailsService {

    private final UserDAO userDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        UserVO user = userDAO.getUserByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException(username);
        }

        return User.builder()
                .username(user.getMemberNm())
                .password(user.getMemberPw())
                .roles(user.getRole())
                .build();
    }
}
