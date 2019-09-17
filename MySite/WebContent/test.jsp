<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.stream.Stream"%>
<%@page import="java.util.stream.IntStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		IntStream.range(0, 20).filter(i->i%2==0).forEach(System.out::println);
		List<String> list = Arrays.asList("김구라","해골","마우스");
	%>
</body>
</html>