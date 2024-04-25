package org.fullstack4.demo.mapper;

import org.fullstack4.demo.Criteria.Criteria;
import org.fullstack4.demo.domain.BbsVO;

import java.util.List;

public interface BbsMapper {
    List<BbsVO> list();
    int regist(BbsVO bbsVO);

    BbsVO view(int idx);

    int modify(BbsVO bbsVO);

    List<BbsVO> getListPaging(Criteria cri);

    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
}
