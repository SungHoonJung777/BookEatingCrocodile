package org.fullstack4.springmvc.service.delivery;

import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.OrderDTO;
import org.fullstack4.springmvc.dto.OrderTestDTO;

import java.util.List;

public interface DeliveryService {
    List<OrderDTO> getOrderListMember(String delivery_member_id);

    int getOrderCountKeywordMember(String delivery_member_id);

    int updateDeliveryStatus(String status, int idx);
}
