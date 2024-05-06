package org.fullstack4.springmvc.service.data;

import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.dto.CommuReplyDTO;

import java.util.List;

public interface CommuReplyServiceIf {
    int reply_regist(CommuReplyDTO commuReplyDTO);
    int update_reply_cnt(int comu_idx);
    List<CommuReplyDTO> reply_list(int comu_idx);
    int deleteReply(int reply_idx, int comu_idx);
    int dedate_reply_cnt(int comu_idx);
}
