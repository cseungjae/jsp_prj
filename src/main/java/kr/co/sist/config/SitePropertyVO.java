package kr.co.sist.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.Getter;

public class SitePropertyVO {

	private static SitePropertyVO spVO;
	@Getter
	private String site_name,SITE_NAME	,SITE_VARSION,	SITE_INFO	,PROTOCOL	,SERVER_NAME
	,SERVER_PORT	,SERVLET_PATH	,LOGO_IMG	,UPLOAD_PATH		;

	
	private SitePropertyVO() {
		try {
			setConfig();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public static SitePropertyVO getInstance() {
		if (spVO==null) {
			spVO=new SitePropertyVO();
		}//end if
		return spVO;
	}
	
	private void setConfig()throws SQLException{
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}//end catch
		
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String id="scott";
		String pass="2222";
		
		Connection con=null;
		java.sql.Statement stmt=null;
		ResultSet rs=null;
		try {
			con=DriverManager.getConnection(url,id,pass);
			stmt=con.createStatement();
			String configSql="select SITE_NAME,	SITE_VARSION,	SITE_INFO	,PROTOCOL	,SERVER_NAME	,SERVER_PORT	,SERVLET_PATH,	LOGO_IMG,	UPLOAD_PATH	 from site_property";
			rs=stmt.executeQuery(configSql);
			
			if (rs.next()) {
				SITE_NAME=rs.getString("SITE_NAME");
				SITE_VARSION=rs.getString("SITE_VARSION");
				SITE_INFO=rs.getString("SITE_INFO");
				PROTOCOL=rs.getString("PROTOCOL");
				SERVER_NAME=rs.getString("SERVER_NAME");
				SERVER_PORT=rs.getString("SERVER_PORT");
				SERVLET_PATH=rs.getString("SERVLET_PATH");	
				LOGO_IMG=rs.getString("LOGO_IMG");	
				UPLOAD_PATH	=rs.getString("UPLOAD_PATH");	;

			}
					
			
		}finally {
			if (rs !=null) {rs.close();}
			if (stmt !=null) {stmt.close();}
			if (con !=null) {con.close();}
		}
		
		
	}//setConfig
	
	
}
