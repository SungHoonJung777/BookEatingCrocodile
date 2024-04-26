package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.MemberImageVO;

public interface MemberImageMapper {
    int regist(String member_id, String orgFile, String saveFile);

    MemberImageVO viewImg(String member_id);
}
