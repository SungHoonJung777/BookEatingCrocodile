package org.fullstack4.springmvc.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.util.Date;
import java.time.LocalDate;

@Log4j2
@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    private String member_id;
    private String member_name;
    private String member_pwd;
    private String member_email;
    private String member_zonecode;
    private String member_addr1;
    private String member_addr2;
    private String member_phone;
    private int mileage;
    private LocalDate member_reg_date;
    private String member_type;
}