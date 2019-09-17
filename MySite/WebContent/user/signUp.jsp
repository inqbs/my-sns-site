<%@page import="test.dao.MemberDao"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	MemberDto dto = new MemberDto();
	dto.setId(request.getParameter("userid"));
	dto.setName(request.getParameter("username"));
	dto.setEmail(request.getParameter("email"));
	dto.setPassword(request.getParameter("pwd"));
	
	Boolean result = MemberDao.getInstance().signUp(dto);
	
	String loc = "";
	String msg = "";
	
	if(result){
		msg = "회원가입이 완료되었습니다.";
		loc = "signForm.jsp";
	}else{
		msg = "가입에 실패하였습니다. 다시 시도해주세요";
		loc = "signForm.jsp";
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
		alert('<%=msg%>');
		location.href = '<%=loc %>';
	</script>
</body>
</html>