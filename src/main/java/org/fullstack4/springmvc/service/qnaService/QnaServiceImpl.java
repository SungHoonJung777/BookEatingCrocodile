package org.fullstack4.springmvc.service.qnaService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.QnaVO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.dto.QnaAdminDTO;
import org.fullstack4.springmvc.dto.QnaDTO;
import org.fullstack4.springmvc.mapper.QnaMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
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

    @Override
    public PageResponseDTO<QnaDTO> getQna(PageRequestDTO pageRequestDTO) {
        List<QnaDTO> qnaList = qnaMapper.getQna(pageRequestDTO).stream()
                .map(vo->modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());

        int total_count = qnaMapper.totalQnaCommu(pageRequestDTO);

        log.info("impl qnaList : "+qnaList);

        PageResponseDTO<QnaDTO> responseDTO = PageResponseDTO.<QnaDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(qnaList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

    @Override
    public int deleteQnaCommu(Integer[] idxList) {

        int result = qnaMapper.deleteQnaCommu(idxList);
        log.info("deleteQnaCommu : qna_idx = " + idxList);
        return result;
    }

    @Override
    public int viewUpdate(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.viewUpdate(qnaVO);
        return 0;
    }


}
