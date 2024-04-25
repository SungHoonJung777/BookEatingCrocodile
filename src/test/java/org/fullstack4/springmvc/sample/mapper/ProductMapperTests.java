package org.fullstack4.springmvc.sample.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.mapper.ProductMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class ProductMapperTests {
    @Autowired(required = false)
    ProductMapper productMapper;

    @Test
    public void test() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .search_type(new String[]{"t", "u"})
                .search_word("제목")
                .search_date1("2024-04-07")
                .search_date2("2024-04-20")
                .build();

        int totalCount = bbsMapper.bbsTotalCount(pageRequestDTO);
        log.info("===============================================");
        log.info("testBbsTotalCount : " + totalCount);
        log.info("===============================================");
    }
}
