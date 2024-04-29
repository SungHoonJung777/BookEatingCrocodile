package org.fullstack4.springmvc.mapper.memberjoin;

import org.fullstack4.springmvc.domain.MemberVO;

public interface MemberJoinMapper {
    /*회원가입 */
    int regist(MemberVO memberVO);

    /*ID 중복 확인*/
    int idCheck(String memberId);



}
