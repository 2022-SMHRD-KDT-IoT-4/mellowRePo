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




</head>

<body class="sb-nav-fixed">


	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.jsp">MelloWarehoue</a>
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
						
						
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="fas fa-list">
								<i class="fas fa-book-open"></i>
							</div> My cosmetics list 
						</a>
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="fas fa-barcode">
								<i class="fas fa-book-open"></i>
							</div> Cosmetics registration
						</a>
						
					   <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 
						</a>
						
						
						
						
						
					</div>
				</div>
			</nav>
		</div>


		<div id="layoutSidenav_content">

			<div id=cli>

				<div class="tomorrow" data-location-id="065362" data-language="KO"
					data-unit-system="METRIC" data-skin="light"
					data-widget-type="upcoming"
					style="padding-bottom: 22px; position: relative; height: 500px; width: 500px;"></div>
			   </div>






		


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
