<%@page import="test.dao.PostDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("postnum"));
	String id = (String)session.getAttribute("id");
	boolean result = PostDao.getInstance().deletePost(num, id);
%>
{"result" : <%=result %>}