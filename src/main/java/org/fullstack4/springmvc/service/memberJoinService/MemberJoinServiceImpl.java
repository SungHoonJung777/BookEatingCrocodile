package org.fullstack4.springmvc.service.memberJoinService;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.mapper.memberjoin.MemberJoinMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Log4j2
public class MemberJoinServiceImpl implements MemberJoinService{
    @Autowired
    private MemberJoinMapper memberJoinMapper;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public int regist(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberJoinMapper.regist(memberVO);

        return result;
    }

    @Override
    public int idCheck(String memberId) {
        int rResult = memberJoinMapper.idCheck(memberId);

        return rResult;
    }


}
