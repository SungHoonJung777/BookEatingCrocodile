package org.fullstack4.springmvc.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.springmvc.domain.MemberVO;

public interface LoginMapper {
    //MemberVO login_info(String id, String pwd); -> #{arg0}, #{arg1} 또는 #{param1}, #{param2} 이런식으로 쓰면 됨! 그러면 nested 오류 발생안함
    MemberVO login_info(@Param("user_id") String id, @Param("pwd") String pwd);

    MemberVO login_cookie(String id);
}
