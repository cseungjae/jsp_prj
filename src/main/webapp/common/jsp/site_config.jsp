<%@page import="kr.co.sist.config.SiteProperty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String url = SiteProperty.BASE_URL;
String uploadURL = url + SiteProperty.UPLOAD_PATH;
String logo = url + "/common/" + SiteProperty.LOGO_IMG;
String site_name = SiteProperty.SITE_NAME;

session.setAttribute("url", url);
session.setAttribute("uploadURL", uploadURL);
session.setAttribute("logo", logo);
session.setAttribute("site_name", site_name);
%>
