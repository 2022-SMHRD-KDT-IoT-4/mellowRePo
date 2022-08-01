<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />

        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
        
        			
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
						        
						        
						        
						<!--시간위젯 자바스크립트 -->
						    	var s, t; s = document.createElement("script"); s.type = "text/javascript";
								s.src = "//cdn.dayspedia.com/js/dwidget.min.vb46adaa2.js";
								t = document.getElementsByTagName('script')[0]; t.parentNode.insertBefore(s, t);
								s.onload = function() {
									window.dwidget = new window.DigitClock();
									window.dwidget.init("dayspedia_widget_58044d7e23cf17ec");
								};
								
						<!--캘린더위젯 자바스크립트 -->
						
						var app = {
								settings: {
									container: $('.calendar'),
									calendar: $('.front'),
									days: $('.weeks span'),
									form: $('.back'),
									input: $('.back input'),
									buttons: $('.back button')
								},

								init: function() {
									instance = this;
									settings = this.settings;
									this.bindUIActions();
								},

								swap: function(currentSide, desiredSide) {
									settings.container.toggleClass('flip');

							    currentSide.fadeOut(900);
							    currentSide.hide();
							    desiredSide.show();

								},

								bindUIActions: function() {
									settings.days.on('click', function(){
										instance.swap(settings.calendar, settings.form);
										settings.input.focus();
									});

									settings.buttons.on('click', function(){
										instance.swap(settings.form, settings.calendar);
									});
								}
							}

							app.init();
						
	
        				</script>
        				
        				
        				
      
						
						
						
        
        
    </head>
    <body class="sb-nav-fixed">
    
    	
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
			
			<!--Dayspedia.com widget--><div class="DPDC" cityid="54406" lang="en" id="dayspedia_widget_58044d7e23cf17ec" host="https://dayspedia.com" ampm="true" nightsign="true" sun="false" style="width: 100%; background-image: none; background-color: initial;" auto="false">

	<style media="screen" id="dayspedia_widget_58044d7e23cf17ec_style">
				/*COMMON*/
		.DPDC{display:table;position:relative;box-sizing:border-box;font-size:100.01%;font-style:normal;font-family:Arial;background-position:50% 50%;margin-bottom:1%;background-repeat:no-repeat;background-size:cover;overflow:hidden;user-select:none}
		.DPDCh{width:fit-content;line-height:1.4}
		.DPDCtm::before,.DPDCts::before{display:inline-block;content:':';vertical-align:middle;margin:-.34em 0 0 -.07em;width:.32em;text-align:center;opacity:.72;filter:alpha(opacity=72)}
		.DPDCt12{display:inline-block;vertical-align:text-top;font-size:40%}
	

		/*CUSTOM*/

		.DPDCt,.DPDCd{color:#ffffff;font-weight:bold} /* time & date color, font-weight */


		.DPDCt{font-size:48px} /* time font-size */
		.DPDCd{font-size:16px} /* headline & date font-size */
	</style>
	
	
	<a class="DPl" href="index.jsp" target="_blank" style="display:block!important;text-decoration:none!important;border:none!important;cursor:pointer!important;background:transparent!important;line-height:0!important;text-shadow:none!important;position:absolute;z-index:1;top:0;right:0;bottom:0;left:0">
	
	</a>
	<div class="DPDCh" style="font-size: 12px; display: block; text-align: center; margin-left: auto; margin-right: auto; font-weight: normal;"></div>
	<div class="DPDCt" style="font-size: 48px; text-align: center; margin-left: auto; margin-right: auto;">
		<span class="DPDCth">0</span><span class="DPDCtm">0</span><span class="DPDCts" style="display: inline-block;"></span><span class="DPDCt12" style="display: inline-block;"></span>
		<span class="DPDCdt" style="font-size: 12px; text-align: center; margin-left: auto; margin-right: auto;">Thu, July 28</span>
	</div>
	
	<div class="DPDCd" style="font-size: 12px; text-align: center; margin-left: auto; margin-right: auto; display: none;">
		 <span class="DPDCdt" style="font-size: 12px; text-align: center; margin-left: auto; margin-right: auto;"></span>
		 <span class="DPDCtn" style="width: 10px; height: 10px; display: none;"><i></i></span>
	 </div>
	
	
	


	<!--/DPDC-->
	</div><!--Dayspedia.com widget ENDS-->
            

            <!-- Navbar Search-->
			
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
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
            
            <div id = cli>
  	
                    	<script>
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
        				</script>

        <div class="tomorrow"
				           data-location-id="065362"
				           data-language="KO"
				           data-unit-system="METRIC"
				           data-skin="light"
				           data-widget-type="upcoming"
				           style="padding-bottom:22px;position:relative;">

        </div>
        </div>
        
         
          <!-- inspired by http://colorhunt.co/c/8184 and 
    		https://dribbble.com/shots/2407357-Calendar%60 -->

    <div class="container">
      <div class="calendar">
        <div class="front">
          <div class="current-date">
            <h1>Friday 29th</h1>
            <h1>July 2022</h1>	
          </div>

          <div class="current-month">
            <ul class="week-days">
              <li>MON</li>
              <li>TUE</li>
              <li>WED</li>
              <li>THU</li>
              <li>FRI</li>
              <li>SAT</li>
              <li>SUN</li>
            </ul>

            <div class="weeks">
              <div class="first">
                <span class="last-month">28</span>
                <span class="last-month">29</span>
                <span class="last-month">30</span>
                <span class="last-month">31</span>
                <span>01</span>
                <span>02</span>
                <span>03</span>
              </div>

              <div class="second">
                <span>04</span>
                <span>05</span>
                <span class="event">06</span>
                <span>07</span>
                <span>08</span>
                <span>09</span>
                <span>10</span>
              </div>

              <div class="third">
                <span>11</span>
                <span>12</span>
                <span>13</span>
                <span>14</span>
                <span class="active">15</span>
                <span>16</span>
                <span>17</span>
              </div>

              <div class="fourth">
                <span>18</span>
                <span>19</span>
                <span>20</span>
                <span>21</span>
                <span>22</span>
                <span>23</span>
                <span>24</span>
              </div>

              <div class="fifth">
                <span>25</span>
                <span>26</span>
                <span>27</span>
                <span>28</span>
                <span>29</span>
                <span>30</span>
                <span>31</span>
              </div>
            </div>
          </div>
        </div>

        <div class="back">
          <input placeholder="What's the event?">
          <div class="info">
            <div class="date">
              <p class="info-date">
              Date: <span>Jul 29th, 2022</span>
              </p>
              <p class="info-time">
                Time: <span>6:35 PM</span>
              </p>
            </div>
            <div class="address">
              <p>
                Address: <span>129 W 81st St, New York, NY</span>
              </p>
            </div>
            <div class="observations">
              <p>
                Observations: <span>Be there 15 minutes earlier</span>
              </p>
            </div>
          </div>

          <div class="actions">
            <button class="save">
              Save <i class="ion-checkmark"></i>
            </button>
            <button class="dismiss">
              Dismiss <i class="ion-android-close"></i>
            </button>
          </div>
        </div>

      </div>
    </div>
         <footer class="py-4 bg-light mt-auto mainfooter">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>

                        </div>
                    </div>
                </footer>
                  
                
            </div>
        </div>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare./ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
    