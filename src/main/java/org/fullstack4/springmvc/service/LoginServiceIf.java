package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.MemberDTO;

public interface LoginServiceIf {
    MemberDTO login_info(String id, String pwd);

    MemberDTO login_cookie(String id);
}
