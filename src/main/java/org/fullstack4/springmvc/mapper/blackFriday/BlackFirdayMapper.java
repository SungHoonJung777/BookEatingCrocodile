package org.fullstack4.springmvc.mapper.blackFriday;

import org.fullstack4.springmvc.domain.BlackFridayVO;

import java.util.List;

public interface BlackFirdayMapper {
    int blackFridayRegist(BlackFridayVO vo);

    List<BlackFridayVO> blackFridayList();
}
