package com.its.member.Controller;

import com.its.member.DTO.MemberDTO;
import com.its.member.Repository.MemberRepository;
import com.its.member.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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
    public String login(@ModelAttribute MemberDTO logDTO, Model modelDTO, HttpSession session){
        MemberDTO loginMember = memberService.login(logDTO);
        // 세션(session)
        if(loginMember != null){
            System.out.println("로그인 성공");
            modelDTO.addAttribute("modelDTO", loginMember);
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
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
    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model){
        System.out.println(id);
        MemberDTO detailDTO = memberService.detail(id);
        model.addAttribute("detailDTO",detailDTO);
        return "detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, Model model){
        System.out.println(id);
        memberService.delete(id);
        //redirect를 이용하여 findAll 주소요청
        return "redirect:/findAll";
    }
    @GetMapping("/update-form")
    public String updateForm(HttpSession session, Model model){
        Long updateId = (Long) session.getAttribute("loginId");
        System.out.println("updateId : " + updateId);
        MemberDTO updateDTO = memberService.detail(updateId);
        model.addAttribute("updateDTO", updateDTO);
        return "update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        boolean updateResult = memberService.update(memberDTO);
        if(updateResult){
            //해당 회원의 상세정보
            return "redirect:/detail?id=" + memberDTO.getId();
        }else{
            return "update-fail";
        }
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        System.out.println("memberId = " + memberId);
        String checkResult = memberService.duplicateCheck(memberId);
        System.out.println(checkResult);
        return checkResult;
    }
    @GetMapping("/response-test")
    public @ResponseBody String responseTest(){
        return "name";
    }
    @GetMapping("/response-test2")
    public @ResponseBody List<MemberDTO> responseTest2(){
        return memberService.findAll();
    }
    @PostMapping("/find-detail")
    public @ResponseBody MemberDTO findDetail(@RequestParam("id") Long id){
        MemberDTO memberDTO = memberService.detail(id);
        return  memberDTO;
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }

}
