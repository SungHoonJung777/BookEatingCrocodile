package org.fullstack4.springmvc.service.qnaService;

import org.fullstack4.springmvc.dto.QnaAdminDTO;
import org.fullstack4.springmvc.dto.QnaDTO;

public interface QnaServiceIf {
    int registQna(QnaDTO qnaDTO);
    QnaDTO viewQna(int qna_idx);
    int modifyQna(QnaDTO qnaDTO);
    int deleteQna(int qna_idx);
    int registAdmin(QnaAdminDTO qnaAdminDTO);
    int deleteAdmin(int qna_idx);
    int registFaq(QnaDTO qnaDTO);
}
