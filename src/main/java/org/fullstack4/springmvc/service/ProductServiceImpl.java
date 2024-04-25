package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.mapper.ProductMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductServiceIf {

    private final ProductMapper productMapper;
    private final ModelMapper modelMapper;
    @Override
    public List<ProductDTO> listAll() {
        List<ProductDTO> productDTOList = productMapper.listAll().stream()
                .map(vo->modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());
        return productDTOList;
    }

}
