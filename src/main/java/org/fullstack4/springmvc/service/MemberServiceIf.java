package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.domain.MemberImageVO;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.MemberImageDTO;
import org.fullstack4.springmvc.dto.ProductDTO;

import java.util.List;

public interface MemberServiceIf {
    int regist(MemberDTO memberDTO);

    MemberDTO view(String member_id);


    int modify(MemberDTO memberDTO);
    int modifyImage(String member_id, String member_img);

    int delete(String member_id);

    int getEmailCount(String email);
    int getIdCount(String nickname);

    List<ProductDTO> getCartList(String m_id);


    //
    int idCheck(String memberId);
}
