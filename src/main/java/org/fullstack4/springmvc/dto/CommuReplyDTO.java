package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommuReplyDTO {
    private int reply_idx;
    private int comu_idx;
    private String member_id;
    @NotBlank(message = "내용을 입력해 주세요.")
    @Size(min=1, max=100, message="내용을 1~100자 이내로 입력해 주세요.")
    private String reply_content;
    private LocalDateTime reply_reg_date;
    private LocalDateTime reply_modify_date;
}
