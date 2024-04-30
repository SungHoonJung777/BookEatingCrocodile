package org.fullstack4.springmvc.dto;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDateTime;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class OrderTestDTO {
    private int order_idx;
    private int pro_idx;
    private String member_id;
    private int order_price;
    private String order_status;
    private String order_addr;
    private LocalDateTime order_date;
    private String pro_name;

    private String delivery_member_id;
}
