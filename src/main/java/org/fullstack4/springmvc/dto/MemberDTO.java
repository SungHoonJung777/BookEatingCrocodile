package org.fullstack4.springmvc.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.checkerframework.checker.units.qual.N;

import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.Date;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {

    private String member_id;
    private String member_pwd;
    private String member_name;
    private String member_email;
    private String member_addr1;
    private String member_addr2;
    private String member_phone;
    private String member_zonecode;
    private int mileage;
    private LocalDate member_reg_date;
    private String member_type;


/*
    @NotBlank
    private String user_id;
    @NotBlank
    private String name;
    @NotBlank
    private String pwd;
    private String jumin;
    @NotBlank
    private String addr1;
    @NotBlank
    private String addr2;
    @NotNull(message = "빈칸은 안됩니다.")
    @PastOrPresent(message = "오늘보다 미래일 수 없습니다.")
    private LocalDate birthday;
    @NotBlank
    @Email
    private String email;
    private String job_code;
    private int mileage;
    private String user_state;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private LocalDate pwd_change_date;
    private LocalDate leave_date;
    private String interest;
*/

}