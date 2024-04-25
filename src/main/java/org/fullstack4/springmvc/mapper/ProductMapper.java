package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.ProductVO;

import java.util.List;

public interface ProductMapper {

    List<ProductVO> listAll();
}
