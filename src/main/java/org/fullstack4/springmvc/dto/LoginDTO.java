package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class LoginDTO {
    @NotBlank
    private String user_id;
    @NotBlank
    private String pwd;
    private String save_id;
    private String auto_login;
}
