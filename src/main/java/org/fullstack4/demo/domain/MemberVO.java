package org.fullstack4.demo.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Getter
@ToString
@AllArgsConstructor
@Log4j2
@NoArgsConstructor
@Builder
public class MemberVO {
    private int member_idx;
    private String name;
    private String user_id;
    private String pwd;
    private String jumin;
    private String addr1;
    private String addr2;
    private String birthday;
    private String job_code;
    private int mileage;
    private String user_state;
    private String reg_date;
    private String leave_date;
    private String pwd_change_date;
}