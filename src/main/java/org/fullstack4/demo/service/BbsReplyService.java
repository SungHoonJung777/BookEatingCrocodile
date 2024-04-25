package org.fullstack4.demo.service;

import org.fullstack4.demo.dto.BbsReplyDTO;

import java.util.List;

public interface BbsReplyService {
    int reply_regist(BbsReplyDTO bbsReplyVO);
    List<BbsReplyDTO> bbsReplyList(int bbs_idx);
}
