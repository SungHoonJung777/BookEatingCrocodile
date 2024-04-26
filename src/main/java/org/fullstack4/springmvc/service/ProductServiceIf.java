package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.ProductDTO;

import java.util.List;

public interface ProductServiceIf {
    List<ProductDTO> listAll();
}
