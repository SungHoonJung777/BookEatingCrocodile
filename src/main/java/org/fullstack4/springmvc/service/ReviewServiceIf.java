package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.ReviewDTO;

import java.util.List;

public interface ReviewServiceIf {
    List<ReviewDTO> review_listAll();
}
