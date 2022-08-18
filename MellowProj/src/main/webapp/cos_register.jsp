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


<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
   href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css"
   rel="stylesheet" />
<script
   src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
<!-- fullcalendar 언어 CDN -->
<script
   src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>


<link
   href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
   rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"></script>



<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>


<!--여기부터 넣어주삼 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--여기까지 넣어주삼 -->

<script
   src="https://cdnjs.cloudflare./ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>



<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>




<script type="text/javascript">
<% UserVO vo = (UserVO)session.getAttribute("userInfo");%>
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
 setInterval(toastr_msg, 5000);
 
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
			    toastr.error(name[j]+"의 <br> 사용기한이 2일 남았습니다.");
			  }else if(date[j]-dateString == 1){
			    toastr.error(name[j]+"의 <br> 사용기한이 1일 남았습니다.");
			  }else if(date[j]-dateString <= 0){
			    toastr.error(name[j]+"의 <br> 사용기한이 지났습니다.<br>바로 폐기해 주세요");
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
</script>


<script>

$(function(){

	 	  
	  
   $("#barcode_btn").on("click",function(){
	   
      var barcode = $("#barcode_id").val();
      console.log(barcode)
      $.ajax({
          url : "barcode.do",
             type : "get",
             data : {"barcode" : barcode},
             success : listView,
                //listView,
             error : 
                function(){ 
                console.log("no");
                alert("error"); }
      
   });
   
   });
   });
   
function listView(data){

	 $("#view").html("");
   console.log(data.cos_file)
    
    var list = `<img class='cos_found2' src='\${data.cos_file}'/>
    
    
             <form class='form-horizontal' action = 'regist.do'>
            <div class='mb-3 row'>
               <label for='staticEmail' class='col-sm-2 col-form-label'>화장품종류</label>
             <div class='col-sm-10'>
             <input type='hidden' class='form-control' id='barcode' name ='barcode' value ='\${data.barcode}'>
             <input type='text' class='form-control' id='cos_type' name ='cos_type' value ='\${data.cos_type}'>
             
             </div>
             </div>

             <div class='mb-3 row'>
             <label for='staticEmail' class='col-sm-2 col-form-label'>화장품명</label>
               <div class='col-sm-10'>
               <input type='text' class='form-control' id='cos_name' value ='\${data.cos_name}'>
               <input type='hidden' class='form-control' id='user_id' name ='user_id' value ='${userInfo.user_id}'>
               </div>
                 </div>
                 <div class='mb-3 row'>
                 <label for='staticEmail' class='col-sm-2 col-form-label'>유통기한</label>
                 <div class='col-sm-10'>
                 <input type='text' class='form-control' id='datepicker' name = 'exp_date'>
                 </div>
               </div>
               

        <div class='mb-3 row'>
        <label for='staticEmail' class='col-sm-2 col-form-label'>개봉여부</label>
         
         
        <div class='col-sm-10'>
        <select class='form-select form-select1' aria-label='Default select example' id='open_yn' name ='open_yn'>
        <option disabled selected>개봉 여부</option>
        <option value='N'>미개봉</option>
        <option value='Y'>개봉</option>
        </select>
        </div>
        </div>
        <div class='col-12_reg'>
        <button type='submit' class='btn btn-outline-primary submit_reg1'>등록</button>
        <button type='submit' class='btn btn-outline-danger submit_reg2'>취소</button>
        </div>

        </form>`
       console.log(list)
       $("#view").append(list);
       $('.submit_reg2').focus();
       
        


       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
       
    
 }
 
</script>


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
					style="font-size: 12px; text-align: center; margin-left: auto; margin-right: auto;"></span>
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
					<li><a class="dropdown-item" href="cos_retrieve.jsp">화장품
							목록 조회</a></li>
					<li><a class="dropdown-item" href="refrigerator_tem.jsp">냉장고
							온도 제어</a></li>
					<li><a class="dropdown-item" href="">거울 LED 제어</a></li>
				</ul></li>
		</ul>
	</nav>






      <div id="layoutSidenav_content">




   			<div class="new_cos_reg">
				<h5>신규 화장품 등록</h5>
			</div>



         <div class="cos_bar">

            <div class="col-sm-10_sel">
               <div class="barcode_list">
                  <label class="col-sm-2_sel col-form-label" for="barcode">Barcode</label>
                  <input class="form-control" type="text" id="barcode_id"
                     placeholder="Please scan the barcode" name="barcode_name">
                  <button class="btn btn-outline-primary cos_sel" type="button"
                     id="barcode_btn">검색</button>
               </div>
            </div>


         </div>
         
         

       <hr class="hr1">
       

       			
       			
       			<div class="cos_bar_res2" id="view">
       			       			
       				<input type='hidden' class='form-control' id='user_id' name ='user_id' value ='${userInfo.user_id}'>
       			
       			
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


 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
</body>
</html>