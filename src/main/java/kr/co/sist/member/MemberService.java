package kr.co.sist.member;

import java.sql.SQLException;
import java.util.List;

import kr.co.sist.cipher.DataDecryption;
import kr.co.sist.cipher.DataEncryption;

public class MemberService {
   
   private static MemberService ms;

   private MemberService() {}

   public static MemberService getInstance() {
      if (ms == null) {
         ms = new MemberService();
      }
      return ms;
   }

   public boolean searchId(String id) {
      boolean flag = false;
      MemberDAO mDAO = MemberDAO.getInstance();

      try {
         flag = mDAO.selectId(id);
      } catch (SQLException e) {
         e.printStackTrace();
      }

      return flag;
   }

   public boolean addMember(MemberDTO mDTO) {
	    boolean flag = false;

	    try {
	        // ✅ 이메일, 도메인 값 검증
	        if (mDTO.getEmail() == null || mDTO.getEmail().trim().equals("") ||
	            mDTO.getDomain() == null || mDTO.getDomain().trim().equals("")) {
	            System.err.println("❌ 이메일 또는 도메인 누락됨");
	            return false;
	        }

	        mDTO.setUseEmail(mDTO.getEmail() + "@" + mDTO.getDomain());

	        // 비밀번호 해시
	        mDTO.setPass(DataEncryption.messageDigest("SHA-256", mDTO.getPass()));

	        // 암호화 준비
	        String key = "abcdef0123456789";
	        DataEncryption de = new DataEncryption(key);

	        mDTO.setName(de.encrypt(mDTO.getName()));
	        mDTO.setUseEmail(de.encrypt(mDTO.getUseEmail()));
	        mDTO.setTel(de.encrypt(mDTO.getTel()));

	        // ✅ 로그 출력
	        System.out.println(">> 최종 암호화 후 값들");
	        System.out.println("이름: " + mDTO.getName());
	        System.out.println("이메일: " + mDTO.getUseEmail());
	        System.out.println("전화번호: " + mDTO.getTel());

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }

	    try {
	        MemberDAO mDAO = MemberDAO.getInstance();
	        mDAO.insertMember(mDTO);
	        flag = true;
	    } catch (SQLException e) {
	        System.err.println("❌ DB insert 실패: " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }

	    return flag;
	}

   
   
   public List<MemberDTO> searchAllMember(String role) {
	    List<MemberDTO> list = null;
	    MemberDAO mDAO = MemberDAO.getInstance();

	    try {
	        // 전체 회원 조회 (현재는 role 구분 없이 모두 조회)
	        list = mDAO.selectAllMember();
	        
	        if("b".equals(role)||"c".equals(role)) {
	        	//복호화 : 암호화된 데이터를(cipher Text) 일반문자(Plain Text)로 변환
	        	//대칭키 : 암호화에 사용된 키와 동일한 키를 복호화에 사용.
	        	String key = "abcdef0123456789";
	        	DataDecryption dd=new DataDecryption(key);
	        	for(MemberDTO mDTO:list) {
	        	try {
					mDTO.setName(dd.decrypt(mDTO.getName()));
					mDTO.setUseEmail(dd.decrypt(mDTO.getUseEmail()));
				} catch (Exception e) {
					e.printStackTrace();
				}
	        	if("c".equals(role)) {
	        		try {
						mDTO.setTel(dd.decrypt(mDTO.getTel()));
					} catch (Exception e) {
						e.printStackTrace();
					}
	        	}
	        	
	        }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;

}
   
   /**
    * 하나의 회원을 검색
 * @param id
 * @return
 */
public MemberDTO searchOneMember(String id) {
	   MemberDTO mDTO=null;
	   
	   MemberDAO mDAO=MemberDAO.getInstance();
	   
	   try {
		mDTO=mDAO.selectOneMember(id);
		String key = "abcdef0123456789";
    	DataDecryption dd=new DataDecryption(key);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	   try {
			mDTO.setTel(dd.decry);
			String key = "abcdef0123456789";
	    	DataDecryption dd=new DataDecryption(key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   
	   
	   
	   return mDTO;
   }//searchOneMember
   
   
   
   
   
}