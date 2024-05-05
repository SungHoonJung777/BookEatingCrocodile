package org.fullstack4.springmvc.service.data;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BbsReplyVO;
import org.fullstack4.springmvc.domain.CommuReplyVO;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.dto.CommuReplyDTO;
import org.fullstack4.springmvc.mapper.BbsReplyMapper;
import org.fullstack4.springmvc.mapper.CommuReplyMapper;
import org.fullstack4.springmvc.service.BbsReplyServiceIf;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CommuReplyServiceImpl implements CommuReplyServiceIf {
    private final CommuReplyMapper commuReplyMapper;
    private final ModelMapper modelMapper;

    @Override
    @Transactional
    public int reply_regist(CommuReplyDTO commuReplyDTO) {
        log.info("================================");

        CommuReplyVO commuReplyVO = modelMapper.map(commuReplyDTO, CommuReplyVO.class);
        log.info("commuReplyVO : " + commuReplyVO);
        log.info("commuReplyDTO : " + commuReplyDTO);

        //트랜잭션을 걸어서 둘 중 하나 실패하면 다 실패함 하나 성공하면 다 성공함
        int result = commuReplyMapper.reply_regist(commuReplyVO);
        int reply_result = commuReplyMapper.update_reply_cnt(commuReplyDTO.getComu_idx());

        log.info("result : " + result);

        log.info("====================================");
        return result;
    }

    @Override
    public int update_reply_cnt(int comu_idx) {
        log.info("================================");
        int result = commuReplyMapper.update_reply_cnt(comu_idx);
        log.info("result : " + result);
        log.info("====================================");
        return result;
    }

    @Override
    public List<CommuReplyDTO> reply_list(int comu_idx) {
        List<CommuReplyDTO> commuReplyDTOList = commuReplyMapper.reply_list(comu_idx).stream()
                .map(vo->modelMapper.map(vo, CommuReplyDTO.class))
                .collect(Collectors.toList());
        return commuReplyDTOList;
    }
}
