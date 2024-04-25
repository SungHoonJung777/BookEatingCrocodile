package org.fullstack4.demo.mapper;

import org.fullstack4.demo.domain.BbsReplyVO;

import java.util.List;

public interface BbsReplyMapper {
    int reply_regist(BbsReplyVO bbsReplyVO);
    List<BbsReplyVO> bbsReplyList(int bbs_idx);

    int update_reply(int idx);

}
