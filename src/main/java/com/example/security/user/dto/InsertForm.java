package com.example.security.user.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class InsertForm {
    private String username;
    private String password;
    private String confirmPassword;
}
