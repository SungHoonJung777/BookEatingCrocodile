package org.fullstack4.springmvc.service.delivery;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.OrderDTO;
import org.fullstack4.springmvc.dto.OrderTestDTO;
import org.fullstack4.springmvc.mapper.delivery.DeliveryMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class DeliveryServiceImpl implements DeliveryService{
    @Autowired
    private DeliveryMapper deliveryMapper;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public List<OrderDTO> getOrderListMember(String delivery_member_id) {
        List<OrderDTO> orderList = deliveryMapper.getOrderListMember(delivery_member_id).stream()
                .map(vo->modelMapper.map(vo, OrderDTO.class))
                .collect(Collectors.toList());

        return orderList;
    }

    @Override
    public int getOrderCountKeywordMember(String delivery_member_id) {
        int count = deliveryMapper.getOrderCountKeywordMember(delivery_member_id);
        return count;
    }

    @Override
    public int updateDeliveryStatus(String status, int idx) {
        System.out.println("##########3"+status);
        System.out.println("##########"+idx);
        int count = deliveryMapper.updateDeliveryStatus(status, idx);
        return count;
    }
}
