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
public class DataDTO {
    private int comu_idx;

    @NotBlank(message = "제목을 입력해 주세요.")
    @Size(min=1, max=20, message="제목을 1~20자 이내로 입력해 주세요.")
    private String comu_title;

    @NotBlank(message = "내용을 입력해 주세요.")
    @Size(min=1, max=100, message="내용을 1~100자 이내로 입력해 주세요.")
    private String comu_content;
    private String member_id;
    private LocalDateTime comu_reg_date;
    private LocalDateTime comu_modify_date;
    private String comu_file;
    private String commu_category;
}