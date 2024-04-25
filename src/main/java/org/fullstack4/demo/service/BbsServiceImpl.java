package org.fullstack4.demo.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.demo.Criteria.Criteria;
import org.fullstack4.demo.domain.BbsVO;
import org.fullstack4.demo.dto.BbsDTO;
import org.fullstack4.demo.mapper.BbsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;


@Log4j2
@RequiredArgsConstructor
@Service
public class BbsServiceImpl implements BbsService {

    @Autowired
    private BbsMapper bbsMapper;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    @Transactional
    public int regist(BbsDTO bbsDTO) {
        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class);

        int result = bbsMapper.regist(bbsVO);

        return bbsMapper.regist(bbsVO);
    }


    @Override
    public List<BbsDTO> list() {
        List<BbsDTO> bbsDTOList = bbsMapper.list().stream().map(vo -> modelMapper.map(vo, BbsDTO.class)).collect(Collectors.toList());

        return bbsDTOList;
    }

    @Override
    public BbsDTO view(int idx) {
        BbsVO bbsVO = bbsMapper.view(idx);
        BbsDTO bbsDTO = modelMapper.map(bbsVO, BbsDTO.class);

        return bbsDTO;
    }

    @Override
    public int modify(BbsDTO bbsDTO) {
        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class);
        return bbsMapper.modify(bbsVO);
    }

    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {

        return bbsMapper.getTotal(cri);
    }
    @Override
    public List<BbsDTO> getListPaging(Criteria cri) {
        List<BbsDTO> bbsDTOList = bbsMapper.getListPaging(cri).stream().map(vo -> modelMapper.map(vo, BbsDTO.class)).collect(Collectors.toList());

        return bbsDTOList;
    }

    /* 게시판 목록(페이징 적용) */


}
