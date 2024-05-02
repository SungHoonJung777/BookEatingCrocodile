package org.fullstack4.springmvc.service.data;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.DataVO;
import org.fullstack4.springmvc.dto.DataDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.mapper.DataMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class DataServiceImpl implements DataServiceIf{
    private final ModelMapper modelMapper;
    private final DataMapper dataMapper;

/*    @Override
    public int registData(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);
        int result = dataMapper.registData(dataVO);
        return result;
    }*/

    @Override
    public int data_fileUpload(String member_id, String comu_file, String comu_title, String comu_content, String commu_category) {
        int result = dataMapper.data_fileUpload(member_id, comu_file, comu_title, comu_content, commu_category);
        return result;
    }

/*    @Override
    public int registData(DataDTO dataDTO, String member_id, String comu_file) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);
        int result = dataMapper.registData(dataVO, member_id, comu_file);
        return result;
    }*/

    @Override
    public DataDTO viewData(int comu_idx) {
        DataVO dataVO = dataMapper.viewData(comu_idx);
        DataDTO dataDTO = modelMapper.map(dataVO, DataDTO.class);
        return dataDTO;
    }

    @Override
    public int modifyData(String comu_title, String comu_content, String comu_file, String member_id) {
        int result = dataMapper.modifyData(comu_title, comu_content, comu_file, member_id);
        return result;
    }

/*    @Override
    public int modifyData(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);
        int result = dataMapper.modifyData(dataVO);
        return result;
    }*/

    @Override
    public int deleteData(int comu_idx) {
        int result = dataMapper.deleteData(comu_idx);
        return result;
    }

    @Override
    public PageResponseDTO<DataDTO> dataList(PageRequestDTO pageRequestDTO) {
        List<DataDTO> dataList = dataMapper.dataList(pageRequestDTO).stream()
                .map(vo->modelMapper.map(vo, DataDTO.class))
                .collect(Collectors.toList());
        int total_count = dataMapper.totalDataSearch(pageRequestDTO);

        log.info("DataServiceImpl >> dataList : " + dataList);

        PageResponseDTO<DataDTO> responseDTO = PageResponseDTO.<DataDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dataList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

    @Override
    public int deleteDataList(Integer[] idxList) {
        int result = dataMapper.deleteDataList(idxList);
        log.info("DataServiceImpl >> deleteDataList : " + idxList);
        return result;
    }
}
