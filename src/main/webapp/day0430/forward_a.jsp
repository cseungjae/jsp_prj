<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="day0430.Service, java.util.List, day0430.DataDTO"
         info="요청을 받아서 업무를 처리하는 용도의 페이지" %>
<%
    // 한글 파라미터 깨짐 방지
    request.setCharacterEncoding("UTF-8");

    // 서비스 호출
    Service service = new Service();
    String name = service.name();
    List<DataDTO> list = service.subject();

    // 포워드할 페이지에 값 세팅
    request.setAttribute("name", name);
    request.setAttribute("list", list);

    // forward
    RequestDispatcher rd = request.getRequestDispatcher("forward_b.jsp");
    rd.forward(request, response);
%>
