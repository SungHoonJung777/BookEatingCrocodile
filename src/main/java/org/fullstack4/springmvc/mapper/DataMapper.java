package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.DataVO;
import org.fullstack4.springmvc.dto.PageRequestDTO;

import java.util.List;

public interface DataMapper {
/*    int registData(DataVO dataVO);*/

    int data_fileUpload(String member_id, String comu_file, String comu_title, String comu_content);
    DataVO viewData(int comu_idx);
/*    int modifyData(DataVO dataVO);*/
int modifyData(String comu_title, String comu_content, String comu_file, String member_id);
    int deleteData(int comu_idx);
    int totalData(String member_id, String qna_category, PageRequestDTO requestDTO);
    List<DataVO> dataList(PageRequestDTO pageRequestDTO);
    int totalDataSearch(PageRequestDTO requestDTO);
    int deleteDataList(Integer[] idxList);


}
