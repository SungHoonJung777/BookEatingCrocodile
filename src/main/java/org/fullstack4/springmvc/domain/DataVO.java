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
public class DataVO {
    private int comu_idx;
    private String comu_title;
    private String comu_content;
    private String member_id;
    private LocalDateTime comu_reg_date;
    private LocalDateTime comu_modify_date;
    private String comu_file;
}