package day0515;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class DeptService {

	public List<Dept> searchAllDept(){
		List<Dept>list=null;
		
		DeptDAO dDAO=DeptDAO.getInstance();
		try {
			list=dDAO.selectALLDept();
			if(new Random().nextBoolean()) {
			}//end 
		} catch (SQLException e) {
			e.printStackTrace();
			list=new ArrayList<Dept>();//조회된 결과가 없음.
		}//end catch
		
		return list;
	}//searchAllDept

	public String jsonObj() {
	    String strJSON = "";
	    List<Dept> list = null;

	    DeptDAO dDAO = DeptDAO.getInstance();
	    try {
	        list = dDAO.selectALLDept();  // ← DB에서 실제 데이터 가져옴

	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	        JSONObject jsonObj = new JSONObject();
	        jsonObj.put("resultFlag", !list.isEmpty());
	        jsonObj.put("pubDate", sdf.format(new Date()));
	        jsonObj.put("dataLength", list.size());

	        JSONArray jsonArr = new JSONArray();
	        for (Dept deptDto : list) {
	            JSONObject jsonTemp = new JSONObject();
	            jsonTemp.put("deptno", deptDto.getDeptno());
	            jsonTemp.put("dname", deptDto.getDNAME());
	            jsonTemp.put("loc", deptDto.getLOC());
	            jsonArr.add(jsonTemp);
	        }

	        jsonObj.put("date", jsonArr);
	        strJSON = jsonObj.toJSONString();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return strJSON;
	}

	
}//class
