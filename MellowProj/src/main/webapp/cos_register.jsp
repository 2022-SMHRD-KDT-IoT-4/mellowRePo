<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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



<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare./ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
<script src="js/datatables-simple-demo.js"></script>



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
	background-repeat: no-repeat;
	background-size: cover;
	overflow: hidden;
	user-select: none
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
<!-- 시간위젯 자바스크립트 -->
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


</head>

<body class="sb-nav-fixed">


	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
		<!-- Sidebar Toggle-->


		<!--Dayspedia.com widget-->
		<div class="DPDC" cityid="54406" lang="en"
			id="dayspedia_widget_58044d7e23cf17ec" host="https://dayspedia.com"
			ampm="true" nightsign="true" sun="false"
			style="width: 100%; background-image: none; background-color: initial;"
			auto="false">





			<a class="DPl" href="index.jsp" target="_blank"
				style="display: block !important; text-decoration: none !important; border: none !important; cursor: pointer !important; background: transparent !important; line-height: 0 !important; text-shadow: none !important; position: absolute; z-index: 1; top: 0; right: 0; bottom: 0; left: 0">

			</a>
			<div class="DPDCh"
				style="font-size: 12px; display: block; text-align: center; margin-left: auto; margin-right: auto; font-weight: normal;"></div>
			<div class="DPDCt"
				style="font-size: 48px; text-align: center; margin-left: auto; margin-right: auto;">
				<span class="DPDCth">0</span><span class="DPDCtm">0</span><span
					class="DPDCts" style="display: inline-block;"></span><span
					class="DPDCt12" style="display: inline-block;"></span> <span
					class="DPDCdt"
					style="font-size: 12px; text-align: center; margin-left: auto; margin-right: auto;">Thu,
					July 28</span>
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
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>





	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Layouts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a> <a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>


		<div id="layoutSidenav_content">




			<div class="cos_sub_reg">

				<h1>화장품 등록</h1>
				<img class="cos_circle" src="assets/img/cos_circle.png"
					width="700px" height="700px" />

			</div>



			<div class="cos_bar">


				<form class="form-inline" action="/action_page.php">
				
				<div class="col-sm-10_sel">
					<div class="barcode_list">
					<label class="col-sm-2_sel col-form-label" for="barcode">Barcode</label> 
					<input class="form-control" type="email" id="barcode_id" placeholder="Please scan the barcode" name="barcode_name">
					<button class="btn btn-outline-warning cos_sel" type="submit">검색</button>
					</div>
				</div>
				</form>

				<!--  
				<form class="form-horizontal_1">
					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">바코드</label>
						<div class="col-sm-10_sel">
							<input type="text" class="form-control" id="staticEmail"
								placeholder="640509 040147">
						    <button type="submit" class="btn btn-outline-warning cos_sel">조회</button>
						</div>
					</div>
				</form>
				-->



			</div>


			<hr class="hr1">



			<div class="cos_bar_res">

				<img class="cos_found" src="assets/img/found.png" width="350px"
					height="300px" />


				<form class="form-horizontal">

					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">화장품
							종류</label>

						<div class="col-sm-10">
							<select class="form-select form-select1"
								aria-label="Default select example">
								<option disabled selected>화장품 종류 선택</option>
								<option value="1">스킨</option>
								<option value="2">토너</option>
								<option value="3">로션</option>
								<option value="4">크림</option>
								<option value="5">에센스</option>
								<option value="6">세럼</option>
								<option value="7">클렌저</option>
								<option value="8">자외선차단제</option>
								<option value="9">메이크업 베이스</option>
								<option value="10">파우더</option>
								<option value="11">팩트</option>
								<option value="12">아이쉐도우</option>
								<option value="13">블러셔</option>
								<option value="14">아이라이너</option>
								<option value="15">마스카라</option>
								<option value="16">립제품</option>


							</select>
						</div>

					</div>

					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">화장품명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="staticEmail"
								placeholder="N°1 DE CHANEL 레드 까멜리아 파운데이션">
						</div>
					</div>

					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">유통기한</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="staticEmail"
								placeholder="2022.09.27">
						</div>
					</div>

					<div class="mb-3 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">사용기한</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="staticEmail"
								placeholder="2022.07.25 ~ 2023.04.18">
						</div>
					</div>

					<div class="col-12_reg">
						<button type="submit" class="btn btn-outline-primary submit_reg1">등록</button>
						<button type="submit" class="btn btn-outline-danger submit_reg2">취소</button>
					</div>




				</form>

			</div>









		</div>
	</div>










</body>
</html>
