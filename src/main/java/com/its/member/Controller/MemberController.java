package com.its.member.Controller;

import com.its.member.DTO.MemberDTO;
import com.its.member.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class MemberController {

    @Autowired
    MemberService memberService;

    @GetMapping("/save-form")
    public String saveForm(){
        System.out.println("MemberController.save");
        return "save";
    }


    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO,Model model){
        boolean sameResult = memberService.sameChk(memberDTO);
        if(sameResult) {
            boolean saveResult = memberService.save(memberDTO);
            if (saveResult) {
                return "index";
            } else {
                System.out.println("회원가입 실패");
                return null;
            }
        }else{
            model.addAttribute("logMs","아이디가 중복됩니다.");
            return "save";

        }
    }

    @GetMapping("/login-form")
    public String loginForm(){
        System.out.println("MemberController.login");
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO logDTO,Model modelDTO){
        MemberDTO loginMember = memberService.login(logDTO);
        if(loginMember != null){
            System.out.println("로그인 성공");
            modelDTO.addAttribute("modelDTO", loginMember);
            return "main";
        }else {
            System.out.println("로그인 실패");
            return "login";
        }
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberList = memberService.findAll();
        model.addAttribute("memberList",memberList);
        return "list";
    }

    @GetMapping("/index")
    public String index(){
        return "index";
    }
}
