package kr.co.sist.member.login;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.sist.cipher.DataDecryption;
import kr.co.sist.cipher.DataEncryption;

public class LoginService {

	public boolean loginProcess(loginDTO lDTO,HttpSession session) {
		boolean flag=false;
		
		loginDAO lDAO=loginDAO.getInstance();
		try {
			//비밀번호를 일방향 Hash
			lDTO.setPass(DataEncryption.messageDigest("SHA-256", lDTO.getPass()));
			loginResultDTO lrDTO=lDAO.selectLogin(lDTO);
			flag=lrDTO !=null;//검색결과가 있을때에는 true
			
			if(flag) {//로그인 성공
				//이름은 암호화상태
				//이메일 복호화
				String key="abcdef0123456789";
				DataDecryption dd=new DataDecryption(key);
				try {
					lrDTO.setEmail(dd.decrypt(lrDTO.getEmail()));
				} catch (Exception e) {
					e.printStackTrace();
				}
				session.setAttribute("userData", lrDTO);
			}//end if 
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
 catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}//loginProcess
}//class
