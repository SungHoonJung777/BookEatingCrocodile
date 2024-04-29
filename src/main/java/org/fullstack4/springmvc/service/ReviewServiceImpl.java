package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.fullstack4.springmvc.domain.ReviewVO;
import org.fullstack4.springmvc.mapper.ReviewMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewServiceIf{

    private final ReviewMapper reviewMapper;
    private final ModelMapper modelMapper;
    @Override
    public List<ReviewVO> review_list(int pro_idx) {
        return reviewMapper.review_list(pro_idx);
    }



}
