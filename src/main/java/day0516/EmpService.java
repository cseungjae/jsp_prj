package day0516;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class EmpService {


	public String searchEmp(int deptno) {
		
		String strJSON="";
        List<EmpDTO>list=null;
		
		EmpDAO empDAO=EmpDAO.getInstance();
		try {
			list=empDAO.selectEmp(deptno);  //데이터 조회
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//1.JSONObject 생성 ( 데이터의 부가적인 정보,데이터를 가질 때 사용)
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("resultFlag",!list.isEmpty());//검색 정보가 존재
			jsonObj.put("pubDate",sdf.format(new Date()));//검색 정보가 존재
			jsonObj.put("dataLength",list.size());//검색 정보가 존재
			
			//2.데이터 채우기 
			//JSONArray 생성(데이터를 저장) 
			JSONArray jsonArr=new JSONArray();
			
			JSONObject jsonTemp=null;
			for(EmpDTO empDto : list) {
			//DB에서 검색된 데이터로 JSONObject을 생성하여 JSONArray에 할당
			jsonTemp=new JSONObject();
			jsonTemp.put("empno", empDto.getEMPNO());
			jsonTemp.put("ename", empDto.getENAME());
			jsonTemp.put("job", empDto.getJOB());
			jsonTemp.put("mgr", empDto.getMGR());
			jsonTemp.put("hiredate", empDto.getHIREDATE());
			
			jsonArr.add(jsonTemp);
			}//end for
			//JSONArray를 JSONObject 할당 
			jsonObj.put("date", jsonArr);
			
			//데이터와 부가적인 정보를 가진 JSONObject을 문자열로 얻기 
			strJSON=jsonObj.toJSONString();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return strJSON;
	}//jsonObj
	
}//class
