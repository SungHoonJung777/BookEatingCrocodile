package org.fullstack4.demo.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;
@Getter
@ToString
@AllArgsConstructor
@Log4j2
@NoArgsConstructor
@Builder
public class BbsVO {
    private int idx;

    private String user_id;

    private String title;

    private String content;

    private String display_date;

    private int read_cnt;

    private LocalDate reg_date;

    private LocalDate modify_date;

    private String interest;

}
