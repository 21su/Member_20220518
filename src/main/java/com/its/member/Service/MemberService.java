package com.its.member.Service;

import com.its.member.DTO.MemberDTO;
import com.its.member.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    public MemberRepository memberRepository;

    public MemberDTO detail(Long id) {
        return memberRepository.detail(id);
    }


    public boolean save(MemberDTO memberDTO) {
        int saveResult = memberRepository.save(memberDTO);
        if(saveResult > 0) {
            return true;
        }else {
            return false;
        }
    }

    public boolean sameChk(MemberDTO logDTO) {
        MemberDTO loginResult = memberRepository.sameChk(logDTO);
        if(loginResult == null) {
            return true;
        }else {
            return false;
        }
    }
    public MemberDTO login(MemberDTO logDTO) {
        return memberRepository.login(logDTO);
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public boolean update(MemberDTO memberDTO) {
        int updateResult = memberRepository.update(memberDTO);
        if (updateResult > 0){
            System.out.println("true");
            return true;
        }else{
            System.out.println("false");
            return false;
        }
    }

    public String duplicateCheck(String memberId) {
        MemberDTO checkDTO = memberRepository.duplicateCheck(memberId);
        if(checkDTO == null){
            return "ok";
        }else{
            return "no";
        }
    }
}
