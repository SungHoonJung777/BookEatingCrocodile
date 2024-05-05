package org.fullstack4.springmvc.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommuReplyVO {
    private int reply_idx;
    private int comu_idx;
    private String member_id;
    private String reply_content;
    private LocalDateTime reply_reg_date;
    private LocalDateTime reply_modify_date;
}
