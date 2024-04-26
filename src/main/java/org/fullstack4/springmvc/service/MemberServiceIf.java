package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.ProductDTO;

import java.util.List;

public interface MemberServiceIf {
    int regist(MemberDTO memberDTO);

    MemberDTO view(String user_id);

    int modify(MemberDTO memberDTO);

    int delete(String user_id);

    int getEmailCount(String email);
    int getIdCount(String nickname);

    List<ProductDTO> getCartList(String m_id);
}
