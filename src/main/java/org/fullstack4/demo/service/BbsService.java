package org.fullstack4.demo.service;

import org.fullstack4.demo.Criteria.Criteria;
import org.fullstack4.demo.dto.BbsDTO;

import java.util.List;


public interface BbsService {
    int regist(BbsDTO bbsDTO);

    List<BbsDTO> list();

    BbsDTO view(int idx);

    int modify(BbsDTO bbsDTO);
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);

    /* 게시판 목록(페이징 적용) */
    public List<BbsDTO> getListPaging(Criteria cri);
}
