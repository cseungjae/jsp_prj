package kr.co.sist.place;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDTO;
import kr.co.sist.board.RangeDTO;
import kr.co.sist.dao.DbConnection;

public class PlaceDAO {
	private static PlaceDAO pDAO;
	private PlaceDAO() {
		
	}
	
	public static PlaceDAO getInstance()	{
		if (pDAO ==null) {
			pDAO=new PlaceDAO();
		}//end if 
		return pDAO;
	}//getInstance

	public void insertRest(RestDTO rDTO) throws SQLException{
		DbConnection db=DbConnection.getInstance();
		
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
		//1. JNDI 사용객체 생성
		//2. DBCP에서 연결객체얻기(DataSource)
		//3. Connection얻기
			con=db.getDbConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder insertRest=new StringBuilder();
			insertRest
			.append("	insert into restaurant(rest_num,	restaurant,	menu	,price	,info	,lat,lng,ip,id )")
			.append("	values(seq_rest.nextval,?,?,?,?,?,?,?,?)	")
			
			
			;
			pstmt=con.prepareStatement(insertRest.toString());
		//5. 바인드 변수에 값 할당
			pstmt.setString(1, rDTO.getRestaurant());
			pstmt.setString(2, rDTO.getMenu());
			pstmt.setInt(3, rDTO.getPrice());
			pstmt.setString(4, rDTO.getInfo());
			pstmt.setDouble(5, rDTO.getLat());
			pstmt.setDouble(6, rDTO.getLng());
			pstmt.setString(7, rDTO.getIp());
			pstmt.setString(8, rDTO.getId());
			

		//6. 쿼리문 수행 후 결과 얻기
			pstmt.executeQuery();

		} finally {
		//7. 연결 끊기
			db.dbClose(null, pstmt, con);
		}
	}//insertBoard
	
	
	
	public int selectTotalCount(RangeDTO rDTO) throws SQLException {
		int cnt=0;
		
		DbConnection db=DbConnection.getInstance();
		
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
		//1. JNDI 사용객체 생성
		//2. DBCP에서 연결객체얻기(DataSource)
		//3. Connection얻기
			con=db.getDbConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder selectCount=new StringBuilder();
			selectCount
			.append("	select 	count(num) cnt	")
			.append("	from 	restaurant	");
			
			pstmt=con.prepareStatement(selectCount.toString());
		//5. 바인드 변수에 값 할당
			//pstmt.setString(1, id);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()){//검색결과가 있으면 true, 없으면 false
				cnt=rs.getInt("cnt");
			}
		} finally {
		//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		
		
		return cnt;
	}//selectId
	
	
	/**
	 * 시작번호와 끝번호 사이에 있는 레코드를 얻는 일
	 * @param rDTO
	 * @return
	 * @throws SQLException
	 */
	public List<RestDTO> selectRestaurant(RangeDTO rDTO) throws SQLException{
		
		List<RestDTO> list= new ArrayList<RestDTO>(); 
		
		DbConnection db=DbConnection.getInstance();
		
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
		//1. JNDI 사용객체 생성
		//2. DBCP에서 연결객체얻기(DataSource)
		//3. Connection얻기
			con=db.getDbConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder selectBoard=new StringBuilder();
			selectBoard
			.append("	select rest_num, restaurant, menu, input_date, id	")
			.append("	from (select rest_num, restaurant, menu, input_date, id,	")
			.append("	row_number() over(order by input_date desc) rnum	")
			.append("	from restaurant)	")
			.append("	where rnum between ? and ?")
			;


			pstmt=con.prepareStatement(selectBoard.toString());
		//5. 바인드 변수에 값 할당
			pstmt.setInt(1, rDTO.getStartNum());
			pstmt.setInt(2, rDTO.getEndNum());
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			RestDTO restDTO=null;
			while(rs.next()) {
				restDTO=new RestDTO();
				
				restDTO.setRest_num(rs.getInt("rest_num"));
				restDTO.setRestaurant(rs.getString("restaurant"));
				restDTO.setMenu(rs.getString("menu"));
				restDTO.setInput_date(rs.getDate("input_date"));
				
				

				
				list.add(restDTO);
			}
		
		} finally {
		//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
		
	}//selectAllMember
	
	public RestDTO selectOneRestaurant(int rest_num) throws SQLException{
		RestDTO rDTO=null;
		
DbConnection db=DbConnection.getInstance();
		
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
		//1. JNDI 사용객체 생성
		//2. DBCP에서 연결객체얻기(DataSource)
		//3. Connection얻기
			con=db.getDbConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder selectOneRest=new StringBuilder();
			selectOneRest
			.append("	select 	restaruant,menu,price,info,input_date,ip,lat,lng	")
			.append("	from 	restaurant	")
			.append("	where 	rest_num=?	");
			
			pstmt=con.prepareStatement(selectOneRest.toString());
		//5. 바인드 변수에 값 할당
			pstmt.setInt(1,rest_num);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()){//검색결과가 있으면 true, 없으면 false
				rDTO=new RestDTO();
				rDTO.setRestaurant(rs.getString("restaruant"));
				rDTO.setMenu(rs.getString("menu"));
				rDTO.setPrice(rs.getInt("price"));
				rDTO.setInfo(rs.getString("info"));
				rDTO.setId(rs.getString("id"));
				rDTO.setInput_date(rs.getDate("input_date"));
				rDTO.setIp(rs.getString("ip"));
				rDTO.setLat(rs.getDouble("lat"));
				rDTO.setLng(rs.getDouble("lng"));
				
				//bDTO.setContent(rs.getString("content"));
				//CLOB은 긴 문자열을 저장하므로 별도에 Stream을 연결하여 값을 읽어들인다.
				StringBuilder tempContent=new StringBuilder();
				String lineData="";
				
				//try~with~resources
				try (BufferedReader br=new BufferedReader(
						rs.getClob("content").getCharacterStream()) ) {
					
					while((lineData=br.readLine()) != null) {
						tempContent.append(lineData).append("\n");
					}//end while
				} catch (IOException e) {
					e.printStackTrace();
					tempContent.append("글 내용 읽기 실패");
				}//end catch
				
				rDTO.setContent(tempContent.toString());
				
			}//end if
			
		} finally {
		//7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		}
		
		return rDTO;
	}//selectOneBoard
	
	
	
}//class