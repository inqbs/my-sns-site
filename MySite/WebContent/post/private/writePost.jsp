<%@page import="test.dao.PostDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="test.dto.PostDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//MultipartRequest 설정부
	String realPath = request.getServletContext().getRealPath("/upload");	//	서버내 실제 경로
	
	int sizeLimit = 1024*1024*50; // 50MB
	
	MultipartRequest mr = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	
	System.out.println(mr.getParameter("description"));
	
	PostDto dto = new PostDto();
	dto.setId((String)session.getAttribute("id"));
	dto.setName((String)session.getAttribute("username"));
	dto.setDescription(mr.getParameter("description"));
	dto.setImgSrc(mr.getFilesystemName("write-post-img"));
	
	
	boolean result = PostDao.getInstance().writePost(dto);
	
%>
<script>
	alert(<%=result%>);
	location.href = ${pageContext.request.contextPath}/;
</script>
