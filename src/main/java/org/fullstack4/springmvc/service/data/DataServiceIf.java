package org.fullstack4.springmvc.service.data;

import org.fullstack4.springmvc.dto.*;

public interface DataServiceIf {
/*    int registData(DataDTO dataDTO);*/
    int data_fileUpload(String member_id, String comu_file, String comu_title, String comu_content, String commu_category);
    DataDTO viewData(int comu_idx);
/*    int modifyData(DataDTO dataDTO);*/
    int modifyData(String comu_title, String comu_content, String comu_file, int comu_idx);
    int deleteData(int comu_idx);
    PageResponseDTO<DataDTO> dataList(PageRequestDTO pageRequestDTO);
    int deleteDataList(Integer[] idxList);
}
