package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaDTO {
    private int qna_idx;
    private String member_id;
    @NotBlank(message = "제목을 입력해 주세요.")
    @Size(min=1, max=20, message="제목을 1~20자 이내로 입력해 주세요.")
    private String qna_title;
    @NotBlank(message = "내용을 입력해 주세요.")
    @Size(min=1, max=100, message="내용을 1~100자 이내로 입력해 주세요.")
    private String qna_content;
    private String qna_secret;
    private String qna_answer_YN;
    private String qna_category;
    private String qna_answer;
    private LocalDateTime qna_reg_date;
    private LocalDateTime qna_answer_date;
}
