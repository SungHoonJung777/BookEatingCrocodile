package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.CartDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.ProductDTO;

import java.util.List;

public interface MemberServiceIf {
    int regist(MemberDTO memberDTO);

    MemberDTO view(String member_id);

    int modify(MemberDTO memberDTO);

    int delete(String member_id);

    int getEmailCount(String email);
    int getIdCount(String nickname);

    List<CartDTO> getCartList(String m_id);

    void cartout(String cart_id);
}
