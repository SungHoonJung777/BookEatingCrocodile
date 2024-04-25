package org.fullstack4.demo.dto;

import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsDTO {
    //@NotBlack  = null 허용 x 빈값 허용 x
    //NotEmpty - ==-  null 허용 빈값허용 x

    @PositiveOrZero
    private int idx;
    @NotBlank
    private String user_id;
    @NotBlank
    private String title;
    @NotBlank
    private String content;

    private String display_date;


    private int read_cnt;

    private LocalDate reg_date;

    private LocalDate modify_date;
    private String interest;

}
