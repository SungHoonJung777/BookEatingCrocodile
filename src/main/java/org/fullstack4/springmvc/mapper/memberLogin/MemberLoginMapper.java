package org.fullstack4.springmvc.mapper.memberLogin;

import org.fullstack4.springmvc.domain.MemberVO;

public interface MemberLoginMapper {
    //MemberVO login_info(String id, String pwd); -> #{arg0}, #{arg1} 또는 #{param1}, #{param2} 이런식으로 쓰면 됨! 그러면 nested 오류 발생안함
    MemberVO login_info(String id, String pwd);
    int pwdFind(String member_id, String member_email, String member_phone);

    int pwdChange(String member_id , int checkNum);
/*    MemberVO login_cookie(String id);*/
}
