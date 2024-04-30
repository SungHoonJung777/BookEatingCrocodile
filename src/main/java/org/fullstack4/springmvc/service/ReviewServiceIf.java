package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.domain.ReviewVO;
import org.fullstack4.springmvc.dto.ReviewDTO;


import java.util.List;

public interface ReviewServiceIf {
    List<ReviewVO> review_list(int pro_idx);

    int review_regist(ReviewDTO reviewDTO);

    int review_delete(int review_idx);

    int review_star_num(int review_idx);

    int review_star_avg(int pro_idx);
}
