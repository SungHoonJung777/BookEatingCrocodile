package org.fullstack4.springmvc.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;
@Log4j2
@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberImageVO {
    private int img_idx;
    private String member_id;
    private String orgFile;
    private String saveFile;
    private LocalDate reg_date;
}
