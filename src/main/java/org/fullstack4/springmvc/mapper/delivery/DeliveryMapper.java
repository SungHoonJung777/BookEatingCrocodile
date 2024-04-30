package org.fullstack4.springmvc.mapper.delivery;

import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.domain.OrderTestVO;
import org.fullstack4.springmvc.domain.OrderVO;

import java.util.List;

public interface DeliveryMapper {
    List<OrderVO> getOrderListMember(String delivery_member_id);

    int getOrderCountKeywordMember(String delivery_member_id);

    int updateDeliveryStatus(String status , int idx);
}
