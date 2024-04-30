package org.fullstack4.springmvc.dto;

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
public class QnaAdminDTO {
    private int qna_idx;
    private String qna_answer;
    private String qna_answer_YN;
    private LocalDateTime qna_answer_date;
}
