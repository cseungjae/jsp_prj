package day0516;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

public class EmpDAO {

	private static EmpDAO dDAO;
	
	public EmpDAO() {
		
	}
	
	public static EmpDAO getInstance() {
		if (dDAO==null) {
			dDAO=new EmpDAO();
		}
			return dDAO;
	}
	
	public List<EmpDTO> selectEmp(int deptno)throws SQLException{
		List<EmpDTO> list=new ArrayList<EmpDTO>();	
		
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
String selectEmp="select empno,ename,job,hiredate,sal from dept where deptno=?";
			pstmt=con.prepareStatement(selectEmp);
			
			//5.바인드 변수에 값 할당 
			pstmt.setInt(1, deptno);
		//6.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			EmpDTO emptDto=null;
			
			while (rs.next()) {
				emptDto=new EmpDTO();
				emptDto.setEMPNO(rs.getInt("empno"));
				emptDto.setENAME(rs.getString("ename"));
				emptDto.setJOB(rs.getString("job"));
				emptDto.setHIREDATE(rs.getDate("hiredate"));
				emptDto.setSAL(rs.getInt("sal"));
				
				
				list.add(emptDto);
			}//end while
			
		}finally {
			//7.연결 끊기.
			dbcon.dbClose(rs, pstmt, con);
		}//finally
		
		return list;
	}
}
