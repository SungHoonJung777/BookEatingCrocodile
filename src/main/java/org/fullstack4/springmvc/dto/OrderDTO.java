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

public class OrderDTO {
    private int order_idx;
    private String member_id;
    private LocalDateTime order_date;
    private int delivery;
    private int order_total;
    private String deli_name;
    private String deli_addr;
    private String order_name;
    private String req_term;
    private String order_phone;

    public void setOrder_addr(String zonecode, String addr1, String addr2){
        this.deli_addr = zonecode+" "+addr1+" "+addr2;
    }
}
