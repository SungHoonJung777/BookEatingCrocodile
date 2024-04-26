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
public class ProductDTO {
    private int pro_idx;
    private String pro_name;
    private String pro_writer;
    private int pro_price;
    private int pro_sale;
    private int pro_amount;
    private String pro_content;
    private String pro_image;
    private String pro_company;
    private String pro_video;
    private String pro_category1;
    private String pro_category2;
    private String pro_category3;
    private LocalDate pro_reg_date;
    private LocalDate pro_modify_date;
    private int pro_quantity;

    private int pro_sale_price;

}
