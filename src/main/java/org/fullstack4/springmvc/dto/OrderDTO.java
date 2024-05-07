package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.NotBlank;
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
    private String delivery;
    private int order_total;
//    @NotBlank(message = "배송지명을 입력해주세요")
    private String deli_name;
    private String deli_addr;
//    @NotBlank(message = "배송받는 분의 이름을 입력해주세요")
    private String order_name;
    private String req_term;
//    @NotBlank(message = "전화번호를 입력해주세요")
    private String order_phone;
    private String delivery_member_id;

//    @NotBlank(message = "우편번호는 필수 입력 사항입니다")
    private String zonecode;
//    @NotBlank(message = "주소는 필수 입력 사항입니다")
    private String addr1;
//    @NotBlank(message = "상세주소는 필수 입력 사항입니다")
    private String addr2;

    private String pro_idx;

    public void setOrder_addr(){
        this.deli_addr = zonecode+" "+addr1+" "+addr2;
    }

}
