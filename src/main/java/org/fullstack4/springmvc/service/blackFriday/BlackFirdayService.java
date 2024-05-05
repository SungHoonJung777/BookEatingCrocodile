package org.fullstack4.springmvc.service.blackFriday;

import org.fullstack4.springmvc.dto.BlackFridayDTO;

import java.util.List;

public interface BlackFirdayService {
    int blackFridayRegist(BlackFridayDTO dto);

    List<BlackFridayDTO> blackFridayList();

    BlackFridayDTO blackFridayStart();

    int countBlack();

    int blackStatusChange(int timer);


    int getTime();

    int timeMinus(int minus);

    int finalStatus();

    int registBlack(String member_id,int price);

}
