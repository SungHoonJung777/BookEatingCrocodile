package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.CommuReplyVO;

import java.util.List;

public interface CommuReplyMapper {

    int reply_regist(CommuReplyVO commuReplyVO);

    int update_reply_cnt(int comu_idx);

    List<CommuReplyVO> reply_list(int comu_idx);

    int deleteReply(int reply_idx);
    int dedate_reply_cnt(int comu_idx);
}
