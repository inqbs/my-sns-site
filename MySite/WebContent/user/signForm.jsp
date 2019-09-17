<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LOGIN</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/src/css/sub.css" />
</head>
<body>
	<header>
		<div class="container">
			<h1 class="logo"><a href="${pageContext.request.contextPath}">LOGO</a></h1>
			<!-- <nav id="mainMenu">
				<ul>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>
					<li><a href="#">#</a></li>
				</ul>
			</nav>
			 -->
		</div>
	</header>
	<main>
		<div class="container">
			<form action="signIn.jsp" method="post" id="signForm">
				<fieldset>
					<legend> SIGN IN </legend>
					<div class="form-group form-id">
						<label for="userid">ID</label>
						<input type="text" name="userid" id="userid" placeholder="아이디"/>
					</div>
					<div class="form-group form-name">
						<label for="username">NAME</label>
						<input type="text" name="username" id="username" placeholder="이름"/>
					</div>
					<div class="form-group form-email">
						<label for="email">EMAIL</label>
						<input type="email" name="email" id="email" placeholder="이메일"/>
					</div>
					<div class="form-group form-pwd">
						<label for="pwd">PASSWORD</label>
						<input type="password" name="pwd" id="pwd"  placeholder="비밀번호"/>
						<label for="pwd-c">&nbsp;</label>
						<input type="password" name="pwd-c" id="pwd-c"  placeholder="비밀번호를 한번더 입력해주세요"/>
					</div>
					<div class="form-group form-btn">
						<button type="submit" role="button">SIGN IN</button>
						<button type="button" role="button"><i class="material-icons">cached</i>회원가입 하기</button>
					</div>
				</fieldset>
			</form>
		</div>
	</main>
	<footer>
		
	</footer>
	<script src="${pageContext.request.contextPath}/src/js/signForm.js"></script>
</body>
</html>