package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.domain.ProductVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.ProductDTO;

import java.util.List;

public interface MemberMapper {
    int regist(MemberVO memberVO);
    int modify(MemberVO memberVO);
    MemberVO view(String member_id);

    int delete(String member_id);

    int getEmailCount(String email);
    int getIdCount(String nickname);

    List<ProductVO> getCartList(String m_id);
}
