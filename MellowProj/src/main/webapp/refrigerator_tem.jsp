<%@page import="com.mellow.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport"
   content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>


<link href="css/styles.css" rel="stylesheet" />

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
<script
   src="https://cdnjs.cloudflare./ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
<script src="js/datatables-simple-demo.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>








<script type="text/javascript">
<% UserVO vo = (UserVO)session.getAttribute("userInfo");%>
</script>

<script>
$(document).ready(function(){
	  toastr.options = {
			  "closeButton": false,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": true,
			  "positionClass": "toast-bottom-right",
			  "preventDuplicates": true,
			  "onclick":function() { location.replace('index.jsp'); },
			  "showDuration": "100",
			  "hideDuration": "1000",
			  "timeOut": "30000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			}
 toastr_msg();
 setInterval(toastr_msg, 10000);
 
});


function toastr_msg(){
	  
	  var user_id = $("#user_id").val();
	  var date = [];
	  var name = [];
	
   $.ajax({
          url : "coslistAll.do",
          type : "get",
          data : {"user_id" : user_id },
          success : function(res){
        	  
        	  
        	  for(var i  in res){
    				
        		    name[i] = res[i].cos_name;
    				date[i] = parseInt(res[i].discard_date.replace(/-/g,''));
    				  				
    			}
        	  
        	  var today = new Date();

        	  var year = today.getFullYear();
        	  var month = ('0' + (today.getMonth() + 1)).slice(-2);
        	  var day = ('0' + today.getDate()).slice(-2);

        	  var dateString = year + month  + day;
        	  var dateString =  parseInt(dateString);


        	  console.log(dateString);
        	  console.log(name);
			  console.log(date);
			  
			  console.log(date[0]-dateString)
			  
			  
			  for(j in date){
				  
			  if(date[j]-dateString == 7){
			  	toastr.success(name[j]+"의 <br> 사용기한이 7일 남았습니다.");
			   }else if(date[j]-dateString == 5){
			    toastr.info(name[j]+"의 <br> 사용기한이 5일 남았습니다.");
			  }else if(date[j]-dateString == 3){
			    toastr.warning(name[j]+"의 <br> 사용기한이 3일 남았습니다.");
			  }else if(date[j]-dateString == 2){
			    toastr.danger(name[j]+"의 <br> 사용기한이 2일 남았습니다.");
			  }else if(date[j]-dateString == 1){
			    toastr.danger(name[j]+"의 <br> 사용기한이 1일 남았습니다.");
			  }else if(date[j]-dateString <= 0){
			    toastr.danger(name[j]+"의 <br> 사용기한이 지났습니다.<br>바로 폐기해 주세요");
			  }
			 
			  
			 }
		         
				 
          },
          error : 
             function(){ 
             console.log("no");
             alert("error"); 
             }
});
   
   


}
var btnoption = "";


function btn_click(num){
	
	 		
				if(num == '3'){
				   
				      $("#fri_tem_basic").prop('src','assets/img/20.png');
				      btnoption = "3";
				}else if(num == '2'){
					
					  $("#fri_tem_basic").prop('src','assets/img/15.png');
				      btnoption = "2";
					
				}else if(num == '1'){
					
				      $("#fri_tem_basic").prop('src','assets/img/10.png')
				      btnoption="1";
				      
				}
			
				   

	   
	   $.ajax({
	        url : "btn.do",
	        type : "get",
	        data : {"btnoption" : btnoption },
	        success : function(){
			     console.log("성공"+ btnoption);				
			     
	        },
	        error : 
	           function(){ 
	           console.log("no");
	           alert("error"); 
	           }
	     });
	   
	
	
}

</script>

<style media="screen" id="dayspedia_widget_58044d7e23cf17ec_style">
/*COMMON*/
.DPDC {
	display: table;
	position: relative;
	box-sizing: border-box;S
	font-size: 100.01%;
	font-style: normal;
	font-family: Arial;
	background-position: 50% 50%;
	margin-bottom: 1%;
	background-repeat : no-repeat;
	background-size: cover;
	overflow: hiden;
	user-select: none;
	width: 30%;
	left: 16%;
	background-image: none;
	background-color: initial;
	background-repeat: no-repeat;
}

.DPDCh {
	width: fit-content;
	line-height: 1.4
}

.DPDCtm::before, .DPDCts::before {
	display: inline-block;
	content: ':';
	vertical-align: middle;
	margin: -.34em 0 0 -.07em;
	width: .32em;
	text-align: center;
	opacity: .72;
	filter: alpha(opacity = 72)
}

.DPDCt12 {
	display: inline-block;
	vertical-align: text-top;
	font-size: 40%
}

/*CUSTOM*/
.DPDCt, .DPDCd {
	color: #ffffff;
	font-weight: bold
} /* time & date color, font-weight */
.DPDCt {
	font-size: 48px
} /* time font-size */
.DPDCd {
	font-size: 16px
} /* headline & date font-size */
</style>





</head>

<body class="sb-nav-fixed">

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.jsp">MelloWarehoue</a>
		<!-- Sidebar Toggle-->


		<!--Dayspedia.com widget-->
		<div class="DPDC" cityid="54406" lang="en"
			id="dayspedia_widget_58044d7e23cf17ec" host="https://dayspedia.com"
			ampm="true" nightsign="true" sun="false" auto="false">





			<a class="DPl" href="index.jsp" target="_blank"
				style="display: block !important; text-decoration: none !important; border: none !important; cursor: pointer !important; background: transparent !important; line-height: 0 !important; text-shadow: none !important; position: absolute; z-index: 1; top: 0; right: 0; bottom: 0; left: 0">

			</a>
			<div class="DPDCh"
				style="font-size: 12px; display: block; text-align: center; margin-left: auto; margin-right: auto; font-weight: normal;"></div>
			<div class="DPDCt"
				style="font-size: 48px; text-align: center; margin-left: auto; margin-right: auto;">
				<span class="DPDCth">0</span><span class="DPDCtm">0</span><span
					class="DPDCts" style="display: inline-block;"></span><span
					class="DPDCt12" style="display: inline-block;"></span>
			</div>

			<div class="DPDCd"
				style="font-size: 12px; text-align: center; margin-left: auto; margin-right: auto; display: none;">
				<span class="DPDCdt"
					style="font-size: 12px; text-align: center; margin-left: auto; margi	n-right: auto;"></span>
				<span class="DPDCtn"
					style="width: 10px; height: 10px; display: none;"><i></i></span>
			</div>





			<!--/DPDC-->
		</div>
		<!--Dayspedia.com widget ENDS-->


		<!-- Navbar Search-->

		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"> <span
					class="menu_text">메뉴</span><i class="fas fa-dice-d20"></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="index.jsp">화장품
							목록 조회</a></li>
					<li><a class="dropdown-item" href="refrigerator_tem.jsp">냉장고
							온도 제어</a></li>
					<li><a class="dropdown-item" href="led_con.jsp">거울 LED 제어</a></li>
				</ul></li>
		</ul>
	</nav>






      <div id="layoutSidenav_content">
      
      
      
      			<div class="fri_tem_div">
      				
      				
      				<div class="fri_tem_title">
      				
      					<h5>냉장고 온도 설정</h5>
      				</div>
      				
      				<div class="fri_tem_img">
      						<img class="fri_20" id="fri_tem_basic"src="assets/img/20.png"/>
      						<input type='hidden' class='form-control' id='user_id' name ='user_id' value ='${userInfo.user_id}'>
      					
      				</div>
      				
 
      				
      				<div class="fri_tem_cho">
      				
      					<div class="fri_tem_cho_20" >
      					
      						 <input class="fri_tem_btn20 btn btn-warning btn-rounded" type="button" id="tem_btn20" value="메이크업
20°C" onclick="btn_click('3')">
      					
      					</div>
      					
      					<div class="fri_tem_cho_15">
      				  			<input class="fri_tem_btn15 btn btn-info btn-rounded"type="button" id="tem_btn15" value="기초제품
15°C" onclick="btn_click('2')">
      					</div>
      					
      					<div class="fri_tem_cho_10">
      							<input class="fri_tem_btn10 btn btn-primary btn-rounded"type="button" id="tem_btn10" value="쿨링제품
10°C" onclick="btn_click('1')">
      					</div>
      					
      				
      				</div>
      			
			 
						

      			
   
      		
      			</div>




       
       
       
       	
       









   </div>



   <script>
   $(function() {
	   var s, t;
	   s = document.createElement("script");
	   s.type = "text/javascript";
	   s.src = "//cdn.dayspedia.com/js/dwidget.min.vb46adaa2.js";
	   t = document.getElementsByTagName('script')[0];
	   t.parentNode.insertBefore(s, t);
	   s.onload = function() {
	      window.dwidget = new window.DigitClock();
	      window.dwidget.init("dayspedia_widget_58044d7e23cf17ec");
	   };
   });
   
</script>



   

</body>
</html>