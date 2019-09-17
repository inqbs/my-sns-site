<%@page import="test.dto.MemberDto"%>
<%@page import="test.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String id = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	MemberDto dto = MemberDao.getInstance().login(id, pwd);
	
	if(dto!=null){
		session.setAttribute("usercode", dto.getUserCode());
		session.setAttribute("id", dto.getId());
		session.setAttribute("username", dto.getName());
		session.setMaxInactiveInterval(60*60*12);
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<script>
		<% if (dto!=null){ %>
			alert('로그인 성공');
			location.href= "<%=request.getContextPath() %>/";
		<% }else{ %>
			alert('로그인 실패');
			location.href = 'signForm.jsp';
		<% } %>
	</script>
</body>
</html>