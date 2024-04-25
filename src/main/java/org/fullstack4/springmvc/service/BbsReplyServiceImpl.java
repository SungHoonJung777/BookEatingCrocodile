package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BbsReplyVO;
import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.mapper.BbsReplyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsReplyServiceImpl implements BbsReplyServiceIf{
    private final BbsReplyMapper bbsReplyXmlMapper;
    private final ModelMapper modelMapper;

    @Override
    @Transactional
    public int reply_regist(BbsReplyDTO bbsReplyDTO) {
        log.info("================================");

        BbsReplyVO bbsReplyVO = modelMapper.map(bbsReplyDTO, BbsReplyVO.class);
        log.info("bbsReplyVO : " + bbsReplyVO);
        log.info("bbsReplyDTO : " + bbsReplyDTO);

        //트랜잭션을 걸어서 둘 중 하나 실패하면 다 실패함 하나 성공하면 다 성공함
        int result = bbsReplyXmlMapper.reply_regist(bbsReplyVO);
        int reply_result = bbsReplyXmlMapper.update_reply_cnt(bbsReplyDTO.getBbs_idx());

        log.info("result : " + result);

        log.info("====================================");
        return result;
    }

    @Override
    public int update_reply_cnt(int bbs_idx) {
        log.info("================================");
        int result = bbsReplyXmlMapper.update_reply_cnt(bbs_idx);
        log.info("result : " + result);
        log.info("====================================");
        return result;
    }

    @Override
    public List<BbsReplyDTO> reply_list(int bbs_idx) {
        List<BbsReplyDTO> bbsReplyDTOList = bbsReplyXmlMapper.reply_list(bbs_idx).stream()
                .map(vo->modelMapper.map(vo, BbsReplyDTO.class))
                .collect(Collectors.toList());
        return bbsReplyDTOList;
    }
}
