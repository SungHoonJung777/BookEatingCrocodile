package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.fullstack4.springmvc.domain.ReviewVO;
import org.fullstack4.springmvc.dto.ReviewDTO;
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
   /* @Override
    public List<ReviewVO> review_list(int pro_idx) {

        return reviewMapper.review_list(pro_idx);
    }*/
   @Override
    public List<ReviewVO> review_list(int pro_idx) {

        return reviewMapper.review_list(pro_idx);
    }

    @Override
    public int review_regist(ReviewDTO reviewDTO) {
        log.info("========================================================");
        log.info("ReviewServiceImpl >> review_regist(reviewDTO) : " + reviewDTO.toString());

        ReviewVO reviewVO = modelMapper.map(reviewDTO, ReviewVO.class);
        int result = reviewMapper.review_regist(reviewVO);

        log.info("========================================================");
        return result;
    }

    @Override
    public int review_delete(int review_idx) {
        log.info("========================================================");
        log.info("ReviewServiceImpl >> review_delete(int review_idx) : " + review_idx);

        int result = reviewMapper.review_delete(review_idx);

        log.info("ReviewServiceImpl >> result : " + result);
        log.info("============================");

        return result;
    }

    @Override
    public int review_star_num(int review_idx) {
        log.info("========================================================");
        log.info("ReviewServiceImpl >> review_star_num(int review_idx) : " + review_idx);

        int result = reviewMapper.review_star_num(review_idx);

        log.info("ReviewServiceImpl >> result : " + result);
        log.info("============================");

        return result;
    }

    @Override
    public int review_star_avg(int pro_idx) {
        log.info("========================================================");
        log.info("ReviewServiceImpl >> review_star_avg(int pro_idx) : " + pro_idx);

        int result = reviewMapper.review_star_avg(pro_idx);

        log.info("ReviewServiceImpl >> result : " + result);
        log.info("============================");

        return result;
    }


}
