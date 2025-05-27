package kr.co.sist.member;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {

    private String id;
    private String pass;
    private String name;
    private String birth;
    private String tel;
    private String email;       // email + domain 을 조합한 최종 이메일
    private String domain;      // 이메일 도메인 부분 (@ 이후)
    private String useEmail;    // 별도로 저장할 경우
    private String gender;
    private String zipcode;
    private String addr;
    private String addr2;
    private String intro;
    private String ip;
    private Date inputDate;     // 가입일
    private String profile_img;
}