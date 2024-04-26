package org.fullstack4.springmvc.mapper;

<<<<<<< HEAD
import org.fullstack4.springmvc.domain.CartVO;
=======
import org.apache.ibatis.annotations.Param;

import org.fullstack4.springmvc.domain.MemberImageVO;

>>>>>>> 8e87c59e050ef967060f4df4c526b13d7b1c4ed3
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.domain.ProductVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.ProductDTO;

import java.util.List;

public interface MemberMapper {
    int regist(MemberVO memberVO);

    int modify(MemberVO memberVO);
    int modifyImage(String member_id, String member_img);

    MemberVO view(String member_id);



    int delete(String member_id);

    int getEmailCount(String email);
    int getIdCount(String nickname);

<<<<<<< HEAD
    List<CartVO> getCartList(String m_id);

    void cartout(String cart_id);
=======
    List<ProductVO> getCartList(String m_id);


    ////

    int idCheck(String memberId);
    MemberVO login_info(String id, String pwd);


>>>>>>> 8e87c59e050ef967060f4df4c526b13d7b1c4ed3
}
