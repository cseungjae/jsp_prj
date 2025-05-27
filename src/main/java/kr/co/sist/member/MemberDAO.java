package kr.co.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

public class MemberDAO {
   private static MemberDAO mDAO;

   private MemberDAO() {
   }

   public static MemberDAO getInstance() {
      if (mDAO == null) {
         mDAO = new MemberDAO();
      }
      return mDAO;
   }

   /**
    * 입력받은 아이디를 검색하는 메서드
    * @param id 검색할 아이디
    * @return 중복 여부 (true: 존재함, false: 없음)
    * @throws SQLException
    */
   public boolean selectId(String id) throws SQLException {
      boolean flag = false;

      DbConnection db = DbConnection.getInstance();
      ResultSet rs = null;
      PreparedStatement pstmt = null;
      Connection con = null;

      try {
         con = db.getDbConn();
         if (con == null) {
            throw new SQLException("DB 연결 실패: Connection is null");
         }

         StringBuilder selectIdQuery = new StringBuilder();
         selectIdQuery
            .append("SELECT id ")
            .append("FROM web_member ")
            .append("WHERE id = ?");

         pstmt = con.prepareStatement(selectIdQuery.toString());
         pstmt.setString(1, id);

         rs = pstmt.executeQuery();
         flag = rs.next(); // 데이터가 있으면 true
      } finally {
         db.dbClose(rs, pstmt, con);
      }

      return flag;
   }

   /**
    * 회원 정보를 DB에 삽입하는 메서드
    * @param mDTO 삽입할 회원 정보 DTO
    * @throws SQLException
    */
   public void insertMember(MemberDTO mDTO) throws SQLException {
      DbConnection db = DbConnection.getInstance();
      PreparedStatement pstmt = null;
      Connection con = null;

      try {
         con = db.getDbConn();
         if (con == null) {
            throw new SQLException("DB 연결 실패: Connection is null");
         }

         StringBuilder insertWebMember = new StringBuilder();
         insertWebMember
            .append("INSERT INTO web_member ")
            .append("(ID, PASS, NAME, BIRTH, TEL, EMAIL, GENDER, ZIPCODE, ADDR, ADDR2, INTRO, IP) ")
            .append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

         pstmt = con.prepareStatement(insertWebMember.toString());
         pstmt.setString(1, mDTO.getId());
         pstmt.setString(2, mDTO.getPass());
         pstmt.setString(3, mDTO.getName());
         pstmt.setString(4, mDTO.getBirth());
         pstmt.setString(5, mDTO.getTel());
         pstmt.setString(6, mDTO.getUseEmail());
         pstmt.setString(7, mDTO.getGender());
         pstmt.setString(8, mDTO.getZipcode());
         pstmt.setString(9, mDTO.getAddr());
         pstmt.setString(10, mDTO.getAddr2());
         pstmt.setString(11, mDTO.getIntro());
         pstmt.setString(12, mDTO.getIp());

         pstmt.executeUpdate(); // ✅ INSERT이므로 executeUpdate() 사용
      } finally {
         db.dbClose(null, pstmt, con);
      }
   }
   
   public List<MemberDTO> selectAllMember()throws SQLException{
	  
	   List<MemberDTO> list=new ArrayList<MemberDTO>();
	   
	   DbConnection db = DbConnection.getInstance();
	      ResultSet rs = null;
	      PreparedStatement pstmt = null;
	      Connection con = null;

	      try {
	         con = db.getDbConn();
	         if (con == null) {
	            throw new SQLException("DB 연결 실패: Connection is null");
	         }

	         StringBuilder selectIdQuery = new StringBuilder();
	         selectIdQuery
	            .append("SELECT ID	PASS,	NAME,	BIRTH,	TEL	,EMAIL,	GENDER	,ZIPCODE,	ADDR	,ADDR2	,INTRO,	IP	,INPUT_DATE")	            			            	            	        	        
	            .append("FROM web_member ");

	         pstmt = con.prepareStatement(selectIdQuery.toString());

	         rs = pstmt.executeQuery();
	         
	         MemberDTO mDTO=null;
	         while(rs.next()) {
	        	 mDTO=new MemberDTO();
	        	 mDTO.setId(rs.getString("id"));
	        	 mDTO.setName(rs.getString("name"));
	        	 mDTO.setBirth(rs.getString("birth"));
	        	 mDTO.setTel(rs.getString("tel"));
	        	 mDTO.setUseEmail(rs.getString("email"));
	        	 mDTO.setGender(rs.getString("gender"));
	        	 mDTO.setInputDate(rs.getDate("input_date"));
	        	 
	        	 list.add(mDTO);
	        	 
	         }//end while
	      } finally {
	         db.dbClose(rs, pstmt, con);
	      }
	      return list;
   }//selectllMember
   
   public MemberDTO selectOneMember(String id)throws SQLException{
		  
	   MemberDTO mDTO=null;
	   
	   DbConnection db = DbConnection.getInstance();
	      ResultSet rs = null;
	      PreparedStatement pstmt = null;
	      Connection con = null;

	      try {
	         con = db.getDbConn();
	         if (con == null) {
	            throw new SQLException("DB 연결 실패: Connection is null");
	         }

	         StringBuilder selectIdQuery = new StringBuilder();
	         selectIdQuery
	            .append(" SELECT	NAME,	BIRTH,	TEL	,	GENDER,ip,INPUT_DATE,profile_img")	            			            	            	        	        
	            .append(" FROM web_member ")
	            .append(" where id=? ");

	         pstmt = con.prepareStatement(selectIdQuery.toString());

	         pstmt.setString(1, id);
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 mDTO=new MemberDTO();
	        	 mDTO.setName(rs.getString("name"));
	        	 mDTO.setBirth(rs.getString("birth"));
	        	 mDTO.setTel(rs.getString("tel"));
	        	 mDTO.setGender(rs.getString("gender"));
	        	 mDTO.setGender(rs.getString("ip"));
	        	 mDTO.setInputDate(rs.getDate("input_date"));
	        	 mDTO.setProfile_img(rs.getString("profile_img"));
	        	 
	        	 
	         }//end while
	      } finally {
	         db.dbClose(rs, pstmt, con);
	      }
	      return mDTO;
   }//selectllMember
   
   
   
}
