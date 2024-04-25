package org.fullstack4.springmvc.sample;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

@Repository //이걸 등록하는 순간 스프링이 root-context에 설정 되어있는지 확인 후
//@Primary 이거 있는 애가 동작함
@Qualifier("event")
public class EventSampleDAOImpl implements SampleDAO{
}
