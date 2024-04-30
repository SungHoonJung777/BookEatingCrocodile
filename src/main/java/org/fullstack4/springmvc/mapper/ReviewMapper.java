package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.ReviewVO;

import java.util.List;

public interface ReviewMapper {

 List<ReviewVO> review_list(int pro_idx);

 int review_regist(ReviewVO reviewVO);

 int review_delete(int review_idx);

 int review_star_num(int review_idx);

 int review_star_avg(int pro_idx);
}
