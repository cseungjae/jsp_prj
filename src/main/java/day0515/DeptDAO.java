package day0515;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

public class DeptDAO {

	private static DeptDAO dDAO;
	
	public DeptDAO() {
		
	}
	
	public static DeptDAO getInstance() {
		if (dDAO==null) {
			dDAO=new DeptDAO();
		}
			return dDAO;
	}
	
	public List<Dept> selectALLDept()throws SQLException{
		List<Dept> list=new ArrayList<Dept>();	
		
		DbConnection dbcon=DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
		//1.JNDI 사용 객체 생성
		//2.DBCP에서 DataSource 얻기
		//3.Connection 얻기
			con=dbcon.getDbConn();
			
		//4.쿼리문 생성객체 얻기
			String selectALLString="select deptno,dname,loc from dept";
			pstmt=con.prepareStatement(selectALLString);
			
			//5.바인드 변수에 값 할당 
		//6.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			Dept deptDto=null;
			
			while (rs.next()) {
				deptDto=new Dept(rs.getInt("deptno"),
				rs.getString("dname"),rs.getString("loc"));		
				list.add(deptDto);
			}//end while
			
		}finally {
			//7.연결 끊기.
			dbcon.dbClose(rs, pstmt, con);
		}//finally
		
		return list;
	}
}
