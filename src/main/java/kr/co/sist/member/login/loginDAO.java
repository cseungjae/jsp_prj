package kr.co.sist.member.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class loginDAO {

	private static loginDAO lDAO;
	
	private loginDAO() {
		
	}	
	
	public static loginDAO getInstance() {
		if (lDAO==null) {
			lDAO=new loginDAO();
		}
		
		return lDAO;
	}
	
	
	
	 public loginResultDTO selectLogin(loginDTO lDTO) throws SQLException {
		 loginResultDTO lrDTO=null;

	      DbConnection db = DbConnection.getInstance();
	      ResultSet rs = null;
	      PreparedStatement pstmt = null;
	      Connection con = null;

	      try {
	         con = db.getDbConn();
	         if (con == null) {
	            throw new SQLException("DB 연결 실패: Connection is null");
	         }

	         StringBuilder selectLoginInfo = new StringBuilder();
	         selectLoginInfo
	            .append("SELECT name,email ")
	            .append("FROM web_member ")
	            .append("WHERE id = ? and pass=?");

	         pstmt = con.prepareStatement(selectLoginInfo.toString());
	         pstmt.setString(1, lDTO.getId());
	         pstmt.setString(1, lDTO.getPass());

	         rs = pstmt.executeQuery();
	         
	         if (rs.next()) {
				lrDTO=new loginResultDTO();
				lrDTO.setId(lDTO.getId());//파라메터로 입력된 아이디사용
				lrDTO.setName(rs.getString("name"));//암호화된 데이터
				lrDTO.setEmail(rs.getString("email"));//암호화된 데이터 
	         }//검색결과가 있다면 dto 객체에 값을 생성 
	         
	      } finally {
	         db.dbClose(rs, pstmt, con);
	      }

	      return lrDTO;
	   }
	
}
