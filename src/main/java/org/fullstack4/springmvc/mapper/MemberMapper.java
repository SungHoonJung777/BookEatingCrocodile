package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.MemberVO;

public interface MemberMapper {
    int regist(MemberVO memberVO);
    int modify(MemberVO memberVO);
    MemberVO view(String member_id);

    int delete(String member_id);

    int getEmailCount(String email);
    int getIdCount(String nickname);
}
