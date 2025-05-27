
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
   <%
	String name="이장훈";
    int age=25;
	
    String name2="주현석";
    int age2=26;
    
    //1.JSONArray 생성 ) []
    	JSONArray jsonArr=new JSONArray();//list
    	
    //2. data를 사용하여 JSONObject 생성
    JSONObject jsonObj=new JSONObject();
    jsonObj.put("name", name);
    jsonObj.put("age", age);
 
    JSONObject jsonObj2=new JSONObject();
    jsonObj2.put("name2", name2);
    jsonObj2.put("age2", age2);
    	
    //3. JSONObject를 JSONArry 배치
    jsonArr.add(jsonObj);
    jsonArr.add(jsonObj2);
    
    
    
    //2.JSONArray 값 할당.
     
    
    
    //3.JSONArray 값을 출력
    String strJSON=jsonArr.toJSONString();
   %>
<%=strJSON%>