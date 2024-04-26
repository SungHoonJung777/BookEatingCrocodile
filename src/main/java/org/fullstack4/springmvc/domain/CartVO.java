package org.fullstack4.springmvc.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartVO {
    private int cart_idx;
    private String member_id;
    private int pro_idx ;
    private String pro_title;
    private int pro_price;
    private String pro_img;
    private String pro_quantity;
}
