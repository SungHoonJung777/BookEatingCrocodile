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
public class ReviewDTO {
    private int review_idx;
    private int pro_idx;
    private String member_id;
    private String review_title;
    private String review_content;
    private int review_star;
    private LocalDateTime review_reg_date;
    private String pro_name;
    private String member_img;
}
