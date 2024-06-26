package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Min;
import javax.validation.constraints.PositiveOrZero;

@Log4j2
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int total_count = 0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int first_page = 1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page = 1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_size = 9; //한 화면에 보여줄 리스트 갯수
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int total_page = 1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int page_skip_count = 0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_size = 10; //페이징 몇개씩 보여줄래?
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_start = 1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_end=1;


    private String[] search_type;
    private String search_word;
    private String search_date1;
    private String search_date2;

    private String pro_category1;
    private String pro_category2;
    private String pro_category3;

    private String sortField;
    private String sortDir; //오름차순, 내림차순

    private String qna_category;
    private String member_id;
    private String qna_select;
    private String commu_category;
    private int pro_price;

    public void setTotal_count(int total_count) {
        this.total_count = total_count;
    }
    public int getPage_skip_count() {
        return (this.page-1)*this.page_size;
    }

}