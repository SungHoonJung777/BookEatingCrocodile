package org.fullstack4.springmvc.service.memberJoinService;

import org.fullstack4.springmvc.dto.MemberDTO;

public interface MemberJoinService {
    int regist(MemberDTO memberDTO);

    int idCheck(String memberId);

}
