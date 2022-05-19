package com.its.member.Repository;

import com.its.member.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {

    @Autowired
    public SqlSessionTemplate sql;

    public MemberDTO detail(Long id) {
        return sql.selectOne("Member.detail", id);
    }

    public int save(MemberDTO memberDTO)
    {
        return sql.insert("Member.save", memberDTO);
    }

    public MemberDTO login(MemberDTO logDTO) {
        return sql.selectOne("Member.login", logDTO);
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public MemberDTO sameChk(MemberDTO logDTO) {
        return sql.selectOne("Member.same",logDTO);
    }
}
