package org.fullstack4.springmvc.service.blackFriday;

import org.fullstack4.springmvc.dto.BlackFridayDTO;

import java.util.List;

public interface BlackFirdayService {
    int blackFridayRegist(BlackFridayDTO dto);

    List<BlackFridayDTO> blackFridayList();
}
