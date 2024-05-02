package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.DataVO;
import org.fullstack4.springmvc.dto.PageRequestDTO;

import java.util.List;

public interface DataMapper {
/*    int registData(DataVO dataVO);*/

    int data_fileUpload(String member_id, String comu_file, String comu_title, String comu_content);
    DataVO viewData(int comu_idx);
/*    int modifyData(DataVO dataVO);*/
    int modifyData(String member_id, String comu_file, String comu_title, String comu_content, int comu_idx);
    int deleteData(int comu_idx);
    int totalData(String member_id, String qna_category, PageRequestDTO requestDTO);
    List<DataVO> dataList(PageRequestDTO pageRequestDTO);
    int totalDataSearch(PageRequestDTO requestDTO);
    int deleteDataList(Integer[] idxList);


}
