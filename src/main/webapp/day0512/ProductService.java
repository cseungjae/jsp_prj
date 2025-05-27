package kr.co.sist.member;

import java.sql.SQLException;

public class MemberService {

    // 싱글톤 패턴
    private static MemberService ms;

    private MemberService() {}

    public static MemberService getInstance() {
        if (ms == null) {
            ms = new MemberService();
        }
        return ms;
    }

    /**
     * 아이디 중복 여부를 확인
     * @param id 입력받은 아이디
     * @return true = 중복된 아이디 (사용 불가), false = 사용 가능
     */
    public boolean searchId(String id) {
        boolean flag = false;
        MemberDAO mDAO = MemberDAO.getInstance();

        try {
            flag = mDAO.selectId(id); // true: 중복됨
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    /**
     * 회원 정보 등록 처리
     * @param mDTO 가입할 회원 데이터
     * @return true = 성공, false = 실패
     */
    public boolean addMember(MemberDTO mDTO) {
        boolean flag = false;

        try {
            // 이메일 조합 (email + "@" + domain)
            String fullEmail = mDTO.getEMAIL() + "@" + mDTO.getDomain();
            mDTO.setEMAIL(fullEmail);

            MemberDAO mDAO = MemberDAO.getInstance();
            mDAO.insertMember(mDTO); // DB에 저장
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }
}
