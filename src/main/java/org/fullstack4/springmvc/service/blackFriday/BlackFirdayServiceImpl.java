package org.fullstack4.springmvc.service.blackFriday;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BlackFridayVO;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.BlackFridayDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.mapper.blackFriday.BlackFirdayMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BlackFirdayServiceImpl implements BlackFirdayService{
    @Autowired
    private BlackFirdayMapper blackFirdayMapper;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public int blackFridayRegist(BlackFridayDTO dto) {
        BlackFridayVO blackFridayVO = modelMapper.map(dto, BlackFridayVO.class);
        int iResult =  blackFirdayMapper.blackFridayRegist(blackFridayVO);

        return iResult;
    }

    @Override
    public List<BlackFridayDTO> blackFridayList() {
        List<BlackFridayDTO> blackFridayList = blackFirdayMapper.blackFridayList().stream()
                .map(vo->modelMapper.map(vo, BlackFridayDTO.class))
                .collect(Collectors.toList());


        return blackFridayList;
    }
}
