package com.its.member.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 모든 필드를 매개변수로 하는 생성자
public class MemberDTO {
    public Long Id;
    public String memberId;
    public String memberPassword;
    public String memberName;
    public int memberAge;
    public String memberPhone;
}
