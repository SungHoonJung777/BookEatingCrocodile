package org.fullstack4.springmvc.mapper.blackFriday;

import org.fullstack4.springmvc.domain.BlackFridayVO;

import java.util.List;

public interface BlackFirdayMapper {
    int blackFridayRegist(BlackFridayVO vo);

    List<BlackFridayVO> blackFridayList();

    BlackFridayVO blackFridayStart();

    int countBlack();

    int blackStatusChange(int timer);

    int getTime();

    int timeMinus(int minus);

    int finalStatus();

    int registBlack(String member_id, int price);
}
