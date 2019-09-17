<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="test.dto.PostDto"%>
<%@page import="java.util.List"%>
<%@page import="test.dao.PostDao"%>
<%@page import="java.util.stream.IntStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	List<PostDto> list = PostDao.getInstance().getList();
	LocalDateTime now = LocalDateTime.now();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MySite</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/main.css" />
	
</head>
<body>
	<header>
		<div class="container">
			<h1 class="logo">LOGO</h1>
			<% if(id==null){ %>
			<a href="user/signForm.jsp" role="button">LOGIN</a>
			<% }else{ %>
			<div class="nav-container">
				<nav class="nav">
					<span><i class="material-icons"> menu </i> @<%= id %></span>
					<ul>
						<li><a href="#">Profile</a></li>
						<li><a href="user/private/settings.jsp">settings</a></li>
						<li><a href="javascript:confirmAccess('signout.jsp')">Sign out</a></li>
					</ul>				
				</nav>
				<a href="javascript:toggleWritePopup()" role="button"><i class="material-icons"> create </i> 작성 </a>
			</div>
			<% } %>
		</div>
	</header>
	<main>
		<div class="container">
			<% if(id!=null){ %>
			<section class="write-post <% if(list.size()<6) out.print("is-visible"); %>">
				<form action="post/private/writePost.jsp" id="write-post" enctype="multipart/form-data" method="post">
					<fieldset>
						<legend>
							<span>지금 내 앞엔?</span>
							<button>전송</button>
						</legend>
						<div class="flexbox">
							<label for="write-post-img">
								<input type="file" name="write-post-img" id="write-post-img" accept="image/*" required/>
								<div class="write-post__area">
									<i class="material-icons"> insert_photo </i>
									<p>클릭해서 사진 파일 업로드</p>
								</div>
								<img id="preview">
							</label>
							<textarea name="description" id="description" required></textarea>
						</div>
					</fieldset>
				</form>
			</section>
			<% } %>
			<section class="timeline">
			<% for(PostDto dto : list){ %>
				<article class="post post-<%= dto.getPostNum() %>">
					<div class="post-header">
						<img src="" alt="" class="tl__icon"/> <!-- icon -->
						<hgroup>
							<h5> <%= dto.getName() %> </h5>
							<h6> @<%= dto.getId() %> </h6>
						</hgroup>
						<% if(dto.getId().equals(id)){ %>
							<a href="javascript:deletePost(<%= dto.getPostNum() %>)" class="material-icons"> delete </a>
						<%} %>
					</div>
					
					<div class="post-img" style="
						background-image: url('${pageContext.request.contextPath}/upload/<%= dto.getImgSrc() %>')">
					</div>
					<div class="post-info">
						<div class="post-info__like">
							<a href="javascript:likeControl(<%= dto.getPostNum() %>)" role="button" class="btn-like material-icons">favorite_border</a>
							<span class="count-like"><%= dto.getLikeCount() %></span>
						</div>
						<div class="post-info__regdate">
							<% LocalDateTime regdate = dto.getRegdate();	%>
							<time datetime="<%= regdate.toString()%>">
								<%
									int relativeTime = (int)ChronoUnit.SECONDS.between(regdate, now);
									if(relativeTime>86400){
										//	하루를 넘어갈 경우
										out.println(relativeTime/86400 + "일");
									}else if(relativeTime>3600){
										//	한 시간을 넘어갈 경우
										out.println(relativeTime/3600 + "시간");
									}else if(relativeTime>60){
										//	1분 이상인 경우
										out.println(relativeTime/60 + "분");
									}else{
										out.println("방금");
									}
								%>전
							</time>
						</div>
					</div>
					<div class="post-body">
						<h3><%= dto.getName() %> </h3>
						<p><%= dto.getDescription() %></p>
					</div>
				</article>
			<% }; %>
			</section>
		</div>
	</main>
	<footer>
		
	</footer>
	
	<section class="panel-alert">
		
	</section>
	
	<script crossorigin="anonymous" src="https://polyfill.io/v3/polyfill.min.js"></script>
	<!-- jquery 아무튼 썻음 -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/src/js/macy.js"></script>
	<script src="${pageContext.request.contextPath}/src/js/core.js"></script>
</body>
</html>