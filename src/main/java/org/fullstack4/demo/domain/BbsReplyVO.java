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
public class BbsReplyVO {
    private int idx;
    private int bbs_idx;
    private String user_id;
    private String title;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
