<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/login.css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/login.js"></script>
	
</head>
<body>

		<section class="login-form">
				<h2>melloW</h2>
				<h1>W</h1>
				<h2>Warehouse</h2>
<!--여기부터 넣어주삼 -->
				<form action="login.do" method="post">
					<div class="int-area">
							<input type="text" name="user_id" id="id"
							autocapitalize="off" required>
							<label for="id">USER NAME</label>
					</div>		
					
					<div class="int-area">
							<input type="password" name="user_pw" id="pw"
							autocapitalize="off" required>
							<label for="pw">PASSWORD</label>
					</div>
					<div class="btn-area">
						 <button id="btn" type="submit">LOGIN</button>
					</div>
				</form>
	<!--여기까지 넣어주삼 -->			
				<div class="caption">
						<a href="">Forgot Password?</a>
				</div>
		
		
		</section>
		
		
		<script>
		
		$(document).ready(function(){
			
			  var id = $('#id');
			   var pw = $('#pw');
			   var btn = $('#btn');
						   
						  
						   $(btn).on('click', function() {
								if($(id).val()==""){
									$(id).next('label').addClass('warning');
									setTimeout(() => {
										$('label').removeClass('warning');
									}, 1500);
									
								}
								else if($(pw).val()==""){
									$(pw).next('label').addClass('warning');
									setTimeout(() => {
										$('label').removeClass('warning');
									}, 1500);
								}
						});
			
			
		});
		
		
		 
		</script>
		
	
</body>
</html>