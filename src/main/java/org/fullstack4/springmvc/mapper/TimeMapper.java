package org.fullstack4.springmvc.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
    @Select("select now()")
    String getTime();
    //getTime()을 호출하면 위의 select 구문을 실행해 -> 이렇게 다 써주면 xml 설정 안해도 돼
}
