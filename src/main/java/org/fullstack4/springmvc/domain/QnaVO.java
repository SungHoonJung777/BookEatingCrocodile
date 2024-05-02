package org.fullstack4.springmvc.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaVO {
    private int qna_idx;
    private String member_id;
    private String qna_title;
    private String qna_content;
    private String qna_secret;
    private String qna_answer_YN;
    private String qna_category;
    private String qna_answer;
    private LocalDateTime qna_reg_date;
    private LocalDateTime qna_answer_date;
    private int qna_view_cnt;
    private String qna_select;
}
