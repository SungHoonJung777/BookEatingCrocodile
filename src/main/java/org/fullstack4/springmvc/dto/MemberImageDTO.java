package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberImageDTO {
    private int img_idx;
    private String member_id;
    private String orgFile;
    private String saveFile;
    private LocalDate reg_date;
}
