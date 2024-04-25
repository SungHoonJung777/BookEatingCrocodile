package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.*;
import java.time.LocalDate;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsDTO {
    @PositiveOrZero
    private int idx;

    @NotBlank // --> Not null, 빈값x, 공백문자x
    //@NotEmpty // --> Not null, 빈값x, 공백문자 허용(스페이스/탭 등등 빈 공백)
    private String user_id;

    @NotBlank
    private String title;

    @NotBlank
    private String content;

    private String display_date;

    @Builder.Default //안넣을 수도 있어. 그럼 디폴트값 써라 빌더야, 밑에 써있는 값 갖고 해 (반드시 초기화 필요)
    @PositiveOrZero //0혹은 0보다 큰값
    @Min(value=0)
    private int read_cnt = 0;

    private LocalDate reg_date; //날짜 체크는 데이터베이스에서 넣을거임
    private LocalDate modify_date;
    private String interest;

    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int reply_cnt=0;
}
