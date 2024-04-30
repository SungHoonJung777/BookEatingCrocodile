package org.fullstack4.springmvc.service.qnaService;

import lombok.RequiredArgsConstructor;
import org.fullstack4.springmvc.domain.QnaVO;
import org.fullstack4.springmvc.dto.QnaAdminDTO;
import org.fullstack4.springmvc.dto.QnaDTO;
import org.fullstack4.springmvc.mapper.QnaMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaServiceIf{
    private final ModelMapper modelMapper;
    private final QnaMapper qnaMapper;

    @Override
    public int registQna(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.registQna(qnaVO);
        return result;
    }

    @Override
    public QnaDTO viewQna(int qna_idx) {
        QnaVO qnaVO = qnaMapper.viewQna(qna_idx);
        QnaDTO qnaDTO = modelMapper.map(qnaVO, QnaDTO.class);
        return qnaDTO;
    }

    @Override
    public int modifyQna(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.modifyQna(qnaVO);
        return result;
    }

    @Override
    public int deleteQna(int qna_idx) {
        int result = qnaMapper.deleteQna(qna_idx);
        return result;
    }

    @Override
    public int registAdmin(QnaAdminDTO qnaAdminDTO) {
        int result = qnaMapper.registAdmin(qnaAdminDTO);
        return result;
    }

    @Override
    public int deleteAdmin(int qna_idx) {
        int result = qnaMapper.deleteAdmin(qna_idx);
        return result;
    }

    @Override
    public int registFaq(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.registFaq(qnaVO);
        return result;
    }
}
