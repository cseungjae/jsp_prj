<%@page import="java.io.IOException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info=""%>
<%
//1.XML문서객체 생성
		Document doc=new Document();
		
		//2.최상위 부모노드 생성
		Element rootNode=new Element("root");
		
		//3. 자식노드 생성 
		Element msgNode=new Element("msg");
		//노드의 값 설정
//		System.out.println(msgNode);
		msgNode.setText("안농~");
		
		//4.자식노드를 부모노드에 배치
		rootNode.addContent(msgNode);
		//모든 자식노드를 가진 부모노드를 문서객체에 배치
		doc.addContent(rootNode);
		
		//5.출력객체 생성
//		XMLOutputter xout=new XMLOutputter(Format.getRawFormat());
//		XMLOutputter xout=new XMLOutputter(Format.getCompactFormat());
		XMLOutputter xout=new XMLOutputter(Format.getPrettyFormat());
		try {
			//out 내장객체를 할당하면 web browser로 출력한다.
			xout.output(doc, out);
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch 
%>