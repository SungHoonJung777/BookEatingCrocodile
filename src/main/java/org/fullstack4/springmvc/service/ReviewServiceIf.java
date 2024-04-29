package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.domain.ReviewVO;


import java.util.List;

public interface ReviewServiceIf {
    List<ReviewVO> review_list(int pro_idx);
}
