package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberImageVO;
import org.fullstack4.springmvc.dto.MemberImageDTO;
import org.fullstack4.springmvc.mapper.MemberImageMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberImageServiceImpl implements MemberImageServiceIf{
    private final ModelMapper modelMapper;
    private final MemberImageMapper memberImageMapper;

    @Override
    public int regist(String member_id, String orgFile, String saveFile) {

        int result = memberImageMapper.regist(member_id, orgFile, saveFile);

        return result;
    }

    public MemberImageDTO viewImg(String member_id) {
        MemberImageVO memberImageVO = memberImageMapper.viewImg(member_id);
        MemberImageDTO memberImageDTO = modelMapper.map(memberImageVO, MemberImageDTO.class);

        return memberImageDTO;
    }
}
