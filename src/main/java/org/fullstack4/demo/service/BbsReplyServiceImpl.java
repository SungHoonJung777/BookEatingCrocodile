package org.fullstack4.demo.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.demo.domain.BbsReplyVO;
import org.fullstack4.demo.dto.BbsReplyDTO;
import org.fullstack4.demo.mapper.BbsReplyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Log4j2
@RequiredArgsConstructor
@Service
public class BbsReplyServiceImpl implements BbsReplyService{

    @Autowired
    private BbsReplyMapper bbsReplyMapper;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public int reply_regist(BbsReplyDTO bbsReplyDTO) {
        BbsReplyVO bbsReplyVO = modelMapper.map(bbsReplyDTO, BbsReplyVO.class);
        int result = bbsReplyMapper.reply_regist(bbsReplyVO);

        return result;
    }

    @Override
    public List<BbsReplyDTO> bbsReplyList(int bbs_idx) {
        return null;
    }
}
