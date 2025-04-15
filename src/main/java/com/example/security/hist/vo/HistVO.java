package com.example.security.hist.vo;

import lombok.Builder;
import lombok.Getter;

import java.util.Date;

@Getter
@Builder
public class HistVO {
    private String ID;
    private String USERNAME;
    private Date LOGIN_TIME;
}
