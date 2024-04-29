package org.fullstack4.springmvc.service.memberLoginService;

import org.fullstack4.springmvc.dto.MemberDTO;

public interface MemberLoginService {
    MemberDTO login_info(String id, String pwd);

    int pwdFind(String member_id, String member_email, String member_phone);

    int pwdChange(String member_id, int checkNum);
}
