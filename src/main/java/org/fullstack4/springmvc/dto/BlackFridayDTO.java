package org.fullstack4.springmvc.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlackFridayDTO {
    private int black_idx;
    private int pro_idx;
    private String pro_name;
    private int pro_price;
    private String pro_image;
    private int black_price;
    private String member_id;
    private String black_status;
    private int black_time;
}
