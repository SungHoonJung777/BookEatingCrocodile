package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.ReviewDTO;
import org.fullstack4.springmvc.mapper.ReviewMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewServiceIf{
    private final ReviewMapper reviewMapper;
    private final ModelMapper modelMapper;
    @Override
    public List<ReviewDTO> review_listAll() {
        List<ReviewDTO> reviewDTOList = reviewMapper.review_listAll().stream()
                .map(vo->modelMapper.map(vo, ReviewDTO.class))
                .collect(Collectors.toList());
        return reviewDTOList;
    }

}
