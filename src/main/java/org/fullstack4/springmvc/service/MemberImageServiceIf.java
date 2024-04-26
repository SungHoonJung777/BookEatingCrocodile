package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.MemberImageDTO;

public interface MemberImageServiceIf {
    int regist(String member_id, String orgFile, String saveFile);

    MemberImageDTO viewImg(String member_id);
}
