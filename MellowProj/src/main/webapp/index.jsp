<%@page import="com.mellow.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!--여기부터 넣어주삼 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--여기까지 넣어주삼 -->
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
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
<script src="js/datatables-simple-demo.js"></script>
<script type="text/javascript">
<% UserVO vo = (UserVO)session.getAttribute("userInfo");%>
</script>
<!--여기부터 넣어주삼 -->
<script>
$(document).ready(function(){
	cosAllView();
 });

function cosAllView(){

		   var user_id = $("#user_id").val();
		   console.log(user_id)
	      $.ajax({
	          url : "coslistAll.do",
	             type : "get",
	             data : {"user_id" : user_id },
	             success : function(res){
	            	 
	            	 cosAll(res)
	             },
	             error : 
	                function(){ 
	                console.log("no");
	                alert("error"); }
	   });
	   
}
	   
function cosCloseView(){
		   var user_id = $("#user_id").val();
		   console.log(user_id)
	      $.ajax({
	          url : "coslistClose.do",
	             type : "get",
	             data : {"user_id" : user_id },
	             success : function(res){
	            	 cosAll(res)
	             },
	             error : 
	                function(){ 
	                console.log("no");
	                alert("error"); }
	   });
	   
}
	   
function cosOpenView(){
		   var user_id = $("#user_id").val();
		   console.log(user_id)
	      $.ajax({
	          url : "coslistOpen.do",
	             type : "get",
	             data : {"user_id" : user_id },
	             success : function(res){
	            	 cosAll(res)
	             },
	             error : 
	                function(){ 
	                console.log("no");
	                alert("error"); }
	   });
	   
}
	   
function cosAll(data){
	$("#cosView").html("");
	   console.log(data)
	    
	   $.each(data,function(index,obj){ //obj->{"idx":1,"title":"aaa" ~ } 
		    var list =`<div class="cos_item">
	          
       <table class="cos_table">
        <tr id ="cosImg">
        <td><img class="cos_img" src="\${obj.cos_file}" width="200px;" height="150px;" onclick ="cosInfo(\${index},'\${obj.cos_name}')"/></td>             
        <td><img class="trash_img" src="assets/img/trash-can.png" width="20px;" height="20px;" onclick="cosDelAll(\${obj.req_seq},\${obj.listType})"/></td>
        
        </tr>
        <tr>
           <td id="cosInfo_a\${index}">\${obj.cos_name}</td>
        </tr>
        <tr>
           <td id = "cosInfo_b\${index}">종류 : \${obj.cos_type}</td>
        </tr>
        <tr>
           <td id="cosInfo_c\${index}">폐기 : \${obj.discard_date} </td>
        </tr>
        
        
    	
        
       
        
       </table>   
               
      </div>`
			   $("#cosView").append(list);
	       });
	   
	   
	    
	 }


function cosDelAll(req_seq,listType){
	 var user_id = $("#user_id").val();
	   console.log(user_id);
	   console.log(req_seq);
	   console.log(listType);
	   
   $.ajax({
       url : "cosDelete.do",
          type : "get",
          data : {"user_id" : user_id,
       	       "req_seq" : req_seq},
          success : function(){
        		  
        	  if(listType=='2'){
        		  console.log("미개봉")
        		  cosCloseView()
        	  }else if(listType=='3'){
        		  console.log("개봉")
        		  cosOpenView()
        	  }else{
        		  console.log("전체")
        		  cosAllView()
        	  }
        	  
          },
          error : 
             function(){ 
             console.log("no");
             alert("error"); }
});
	
}

var cnt =0;
var rest_a=""
var rest_b=""
var rest_c ="";
function cosInfo(index,cos_name){
	   console.log(cos_name);
	 	console.log(index);
	   
  $.ajax({
      url : "cosInfo.do",
         type : "get",
         data : {"cos_name" : cos_name},
         success : function(data){
       		  
       	  console.log(data)
  		if(cnt==0){
  			console.log(cnt)
  			rest_a = $("#cosInfo_a"+index).html();
  			rest_b = $("#cosInfo_b"+index).html();
  			rest_c = $("#cosInfo_c"+index).html();
  			document.getElementById("cosInfo_a"+index).innerHTML = "브랜드명 : "+data.brand_name;
  			document.getElementById("cosInfo_b"+index).innerHTML = "사용법 : "+data.cos_dosage;
  			document.getElementById("cosInfo_c"+index).innerHTML = "효능 : "+data.cos_effect;
  			cnt=1;
  		}else{
  			console.log(cnt);
  			document.getElementById("cosInfo_a"+index).innerHTML = rest_a;
  			document.getElementById("cosInfo_b"+index).innerHTML = rest_b;
  			document.getElementById("cosInfo_c"+index).innerHTML = rest_c;
  			cnt=0
  		}
       
         },
         error : 
            function(){ 
            console.log("no");
            alert("error"); }
});
	
}

var bDisplay = true; function doDisplay(){ 	
    var con = document.getElementById("myDIV"); 	
    if(con.style.display=='none'){ 		
        con.style.display = 'block'; 	
    }else{ 		
        con.style.display = 'none'; 	
    } 
} 
</script>
<!--여기까지 넣어주삼 -->
<style media="screen" id="dayspedia_widget_58044d7e23cf17ec_style">
/*COMMON*/
.DPDC {
   display: table;
   position: relative;
   box-sizing: border-box;
   font-size: 100.01%;
   font-style: normal;
   font-family: Arial;
   background-position: 50% 50%;
   margin-bottom: 1%;
   margin-left: 26%; background-repeat : no-repeat;
   background-size: cover;
   overflow: hidden;
   user-select: none;
   width: 30%;
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
<!--여기부터 넣어주삼 -->
	<input type="hidden" value="${userInfo.user_id}" id="user_id">
<!--여기까지넣어주삼 -->


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
   
   
      <div class="cos_list">
      
         <div class="cos_sub">
            <h5>보유 화장품 목록</h5>
         </div>
         
         
 <!--여기부터 넣어주삼 -->        
   <div class="cos_btn_div">
         
         <div class="cos_btns">
            <input type="button" onclick="cosAllView()" id ="cosAll_btn" class="btn btn-outline-success btn-rounded" data-mdb-ripple-color="dark" value="전체">
            <input type="button" onclick="cosCloseView()" id ="cosClose_btn" class="btn btn-outline-danger btn-rounded" data-mdb-ripple-color="dark" value="미개봉">
            <input type="button" onclick="cosOpenView()" id ="cosOpen_btn" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" value="개봉">
         </div>
            
         <div class="cos_reg_btn">
             <input type="button" onclick="location.href='cos_register2.jsp'" class="btn btn-outline-info btn-rounded" data-mdb-ripple-color="dark" value="등록">
         </div>
         
         
   </div>
  <!--여기까지 넣어주삼 -->       
         
 <!--여기부터 넣어주삼 -->        
         
         <div class="cos_reg_div" id="cosView">
         
      
<!--여기까지넣어주삼 -->      
      
      </div>
      

      <div class="cli">

         <div class="tomorrow" data-location-id="065362" data-language="KO"
            data-unit-system="METRIC" data-skin="light"
            data-widget-type="upcoming"
            style="display:felx; width: 98vw; justify-content: center; margin: 0 auto;">
         </div>
      
         
         
      </div>



      <div class="card cara_img">
         <div class="card-body">
            <h5 class="fw-bold" style="font-size: 17px;'">오늘의 추천 화장품</h5>
            <br>
            <p class="card-text">Act+Acre</p>
            <p class="card-text">Restorative Hair Mask</p>
         </div>
         <img src="assets/img/cos_skin.jpg" class="card-img-bottom" alt="...">
      </div>









   </div>













   <script>
   <!-- 날씨위젯 자바스크립트 -->
      (function(d, s, id) {
         if (d.getElementById(id)) {
            if (window.__TOMORROW__) {
               window.__TOMORROW__.renderWidget();
            }
            return;
         }
         const fjs = d.getElementsByTagName(s)[0];
         const js = d.createElement(s);
         js.id = id;
         js.src = "https://www.tomorrow.io/v1/widget/sdk/sdk.bundle.min.js";

         fjs.parentNode.insertBefore(js, fjs);
      })(document, 'script', 'tomorrow-sdk');

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
   </script>




</body>
</html>