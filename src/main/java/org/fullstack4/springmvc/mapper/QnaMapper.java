package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.QnaVO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.QnaAdminDTO;
import org.fullstack4.springmvc.dto.QnaDTO;

import java.util.List;

public interface QnaMapper {
    int registQna(QnaVO qnaVO);

    QnaVO viewQna(int qna_idx);
    int modifyQna(QnaVO qnaVO);
    int deleteQna(int qna_idx);
    int totalQna(String member_id, String qna_category, PageRequestDTO requestDTO);
    int registAdmin(QnaAdminDTO qnaAdminDTO);
    int deleteAdmin(int qna_idx);
    int registFaq(QnaVO qnaVO);
    List<QnaVO> getQna(PageRequestDTO pageRequestDTO);
    int totalQnaCommu(PageRequestDTO requestDTO);
    int deleteQnaCommu(Integer[] idxList);
}