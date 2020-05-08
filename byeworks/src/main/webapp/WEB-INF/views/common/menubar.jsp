<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Byeworks</title>
	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/LogoExample.png" type="image/png" />
    <title>ByeWorks</title>
    
    <!--용환  공지사항 추가부분 -->
 	<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
 	<link href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
 	<!--용환 Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
 
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/resources/css/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath}/resources/css/animate/animate.css/animate.min.css" rel="stylesheet">    
    <!-- 체크박스 -->
    <link href="${pageContext.request.contextPath}/resources/css/iCheck/blue.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">  
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath}/resources/css/jqvmap/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- jQuery custom content scroller -->
    <link href="${pageContext.request.contextPath}/resources/css/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
    
    <!-- 데이터테이블 -->
    <link href="${pageContext.request.contextPath}/resources/css/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/datatables/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/datatables/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/datatables/scroller.bootstrap.min.css" rel="stylesheet">
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<div class="col-md-3 left_col menu_fixed">
		<div class="left_col scroll-view">
			<div class="navbar nav_title" style="border: 0;">
				<a href="main.do" class="site_title">
					<img src="${pageContext.request.contextPath}/resources/images/whiteLogo.png" style="width:10%; margin-bottom:3%; margin-right:1%">
               		<span>ByeWorks</span>
               	</a>
           	</div>

           	<div class="clearfix"></div>

           	<!-- menu profile quick info -->
           	<div class="profile clearfix">
             	<div class="profile_pic" >
               		<img src="${pageContext.request.contextPath}/resources/profile_modify/${ loginUser.profileModify }" style="height:50px;"alt="..." class="img-circle profile_img">
             	</div>
             	<div class="profile_info">
               		<span>환영합니다,</span>
               		<h2>${ loginUser.memberName }</h2>
             	</div>
           	</div>
           	<!-- /menu profile quick info -->

           	<br />

           	<!-- sidebar menu -->
           	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
             	
             	<!-- 연락처 -->
             	<div class="menu_section">
               		<h3>연락처</h3>
               		<ul class="nav side-menu"> 
                 		<li><a><i class="fa fa-users"></i> 주소록 <span class="fa fa-chevron-down"></span></a>
                   			<ul class="nav child_menu">
                     			<li><a>사내 주소록<span class="fa fa-chevron-down"></span></a>
                     				<ul class="nav child_menu">
                         				<li class="sub_menu"><a href="selectList.ad">주소록 전체 조회</a></li>
				                        <li><a href="selectMarkList.ad">즐겨찾기</a></li>
                       				</ul>
                     			</li>
                     			<li><a>업체 주소록<span class="fa fa-chevron-down"></span></a>
                       				<ul class="nav child_menu">
                         				<li class="sub_menu"><a href="selectList.bzgr">그룹 관리</a></li>
                         				<li><a href="selectList.bzad">주소록 전체 조회</a></li>
				                        <li><a href="markList.bzad">즐겨찾기</a></li>
				                        <li><a href="wasteBasket.bzad">휴지통</a></li>
                       				</ul>
                     			</li>
                   			</ul>
                 		</li>
               		</ul>
             	</div>
				
				<!-- 인사/근태 -->
             	<div class="menu_section">
               		<h3>인사근태</h3>
               		<ul class="nav side-menu"> 
                 		<li><a><i class="fa fa-user"></i> 인사 관리 <span class="fa fa-chevron-down"></span></a>
                   			<ul class="nav child_menu">
                     			<li><a href="myPage.me">내 정보 관리</a></li>
                     			
                     			<li><a href="memberList.me">전체 사원 조회 (인)</a></li>
                     			<li><a>발령<span class="fa fa-chevron-down"></span></a>
                       				<ul class="nav child_menu">
                         				<li class="sub_menu"><a href="businessAddress.html">발령내역</a>
			                         	</li>
			                         	<li><a href="businessAddressWastebasket.html">발령서</a>
			                         	</li>
                       				</ul>
                     			</li>
                   			</ul>
                 		</li>
	                 	<li><a><i class="fa fa-briefcase"></i> 근태 관리 <span class="fa fa-chevron-down"></span></a>
	                   		<ul class="nav child_menu">
	                     		<li><a href="form.html">출퇴근 이력 조회</a></li>
	                     	<c:if test= "${fn:contains(loginUser.department, '인사팀')}">
	                     		<li><a href="form.html">출퇴근 현황 조회 (인)</a></li>
	                     		<li><a href="form.html">지각 초과 직원 조회 (인)</a></li>
	                     	</c:if>
	                   		</ul>
	                 	</li>
                 		<li><a><i class="fa fa-inbox"></i> 연차 관리 <span class="fa fa-chevron-down"></span></a>
                   			<ul class="nav child_menu">
                     			<li><a href="general_elements.html">연차 신청</a></li>
                     			<li><a href="media_gallery.html">연차 현황 조회</a></li>
                     			<li><a href="media_gallery.html">연차 현황 조회 (인)</a></li>
                   			</ul>
                 		</li>
               		</ul>
             	</div>

             	<div class="menu_section">
                	<h3>전자결재</h3>
                	<ul class="nav side-menu">
                		<li><a><i class="fa fa-sitemap"></i> 결재관리 <span class="fa fa-chevron-down"></span></a>
                  			<ul class="nav child_menu">
                      
                      			<li><a>내 결재 문서<span class="fa fa-chevron-down"></span></a>
                        			<ul class="nav child_menu">
                          				<li class="sub_menu"><a href="selectSignList.si?mno=${loginUser.memberNo }&type=1">전체문서</a> <!-- 전체결재리스트이동 -->
                          				</li>
			                          	<li><a href="selectSignList.si?mno=${loginUser.memberNo }&type=2">대기</a> <!-- 대기중결재리스트이동 -->
			                          	</li>
			                          	<li><a href="selectSignList.si?mno=${loginUser.memberNo }&type=3">진행</a> <!-- 진행중결재리스트이동 -->
			                          	</li>
			                          	<li><a href="selectSignList.si?mno=${loginUser.memberNo }&type=4">완료</a> <!-- 완료된결재리스트이동 -->
			                          	</li>
			                          	<li><a href="selectSignList.si?mno=${loginUser.memberNo }&type=5">반려</a> <!-- 반려된결재리스트이동 -->
			                          	</li>
			                          	<li><a href="selectSignList.si?mno=${loginUser.memberNo }&type=6">회수</a> <!-- 회수된결재리스트이동 -->
			                          	</li>
			                          	<li><a href="selectSignList.si?mno=${loginUser.memberNo }&type=7">참조</a> <!-- 참조된결재리스트이동 -->
			                          	</li>
                        			</ul>
                      			</li>
                      			<li><a href="doSignList.si">결재할 문서</a> <!-- 해야할결재리스트 이동 -->
                      			</li>
		                      	<li><a href="enrollForm.si">결재 작성하기</a> <!-- 결재 등록화면 이동 -->
		                      	</li>
                  			</ul>
                		</li>
                	</ul>
				</div>

				<!-- 일정 관리 -->
             	<div class="menu_section">
               		<h3>프로젝트 및 일정</h3>
               		<ul class="nav side-menu"> 
                 		<li><a><i class="fa fa-calendar"></i> 일정 관리 <span class="fa fa-chevron-down"></span></a>
                   			<ul class="nav child_menu">
                     			<li><a href="index2.html">개인 일정 관리</a></li>
                     			<li><a href="index2.html">팀 일정 관리</a></li>
                   			</ul>
                 		</li>
                 		<li><a><i class="fa fa-bar-chart"></i> 프로젝트 관리 <span class="fa fa-chevron-down"></span></a>
                   			<ul class="nav child_menu">
                     			<li><a href="form.html">프로젝트 생성</a></li>
                     			<li><a href="form.html">프로젝트 조회</a></li>
                   			</ul>
                 		</li>
               		</ul>
             	</div>

				<!-- 공지사항 및 예약 -->
             	<div class="menu_section">
               		<h3>공지사항 및 예약</h3>
               		<ul class="nav side-menu"> 
                 		<li><a><i class="fa fa-info"></i> 공지사항 <span class="fa fa-chevron-down"></span></a>
                   			<ul class="nav child_menu">
		                     	<li><a href="list.not">공지사항 조회</a></li>
		                   	</ul>
                 		</li>
                 		<li><a><i class="fa fa-unlock-alt"></i> 예약 관리 <span class="fa fa-chevron-down"></span></a>
	                   		<ul class="nav child_menu">
	                     		<li><a href="index2.html">회의실 예약</a></li>
	                     		<li><a href="index2.html">내가 예약한 현황 조회</a></li>
	                   		</ul>
	                 	</li>
               		</ul>
             	</div>
           </div>
		</div>
	</div>

	<!-- top navigation -->
	<div class="top_nav">
		<div class="nav_menu">
			<div class="nav toggle">
               	<a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
            <nav class="nav navbar-nav">
	            <ul class=" navbar-right">
					<li class="nav-item dropdown open" style="padding-left: 15px;">
						<a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
	                   		<img src="${pageContext.request.contextPath}/resources/profile_modify/${ loginUser.profileModify }" alt="">${ loginUser.memberName }
	                 	</a>
	                 	<div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
	                   		<a class="dropdown-item"  href="myPage.me"> Profile</a>
	                   		<a class="dropdown-item"  href="note.html"> Note</a>
	                   		<a class="dropdown-item"  href="logout.me"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
	                 	</div>
	               	</li>
	               	<li role="presentation" class="nav-item dropdown open">
	                 	<a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
	                   		<i class="fa fa-envelope-o"></i>
	                   		<span class="badge bg-green">6</span>
	                 	</a>
	                 	<ul class="dropdown-menu list-unstyled msg_list" role="menu" aria-labelledby="navbarDropdown1">
	                   		<li class="nav-item">
	                     		<a class="dropdown-item">
	                       			<span class="image"><img src="${pageContext.request.contextPath}/resources/images/img.jpg" alt="Profile Image" /></span>
	                       			<span>
	                         			<span>John Smith</span>
	                         			<span class="time">3 mins ago</span>
	                       			</span>
	                       			<span class="message">
	                        			 쪽지가 도착했습니다.
	                       			</span>
	                     		</a>
	                   		</li>
                   			<li class="nav-item">
                     			<div class="text-center">
                       				<a class="dropdown-item">
	                         			<strong>모든 알람 보러가기</strong>
	                         			<i class="fa fa-angle-right"></i>
                       				</a>
	                     		</div>
	                   		</li>
	                 	</ul>
	               	</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- /top navigation -->
	
	<!-- 각종 JS들 -->
	<script src="${pageContext.request.contextPath}/resources/js/build/custom.min.js"></script>
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js"></script>    
    <!-- Bootstrap 용환-검색땜에 추가해야함 -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.bundle.min.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/resources/js/iCheck/icheck.min.js"></script>    
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="${pageContext.request.contextPath}/resources/js/chart/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- Skycons -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/skycons.js"></script>
    <!-- Flot -->
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.time.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.stack.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.orderBars.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/jquery.flot.spline.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/flot/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="${pageContext.request.contextPath}/resources/js/dateJS/date.js"></script>
    <!-- JQVMap -->
    <script src="${pageContext.request.contextPath}/resources/js/jqvmap/jquery.vmap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jqvmap/jquery.vmap.world.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jqvmap/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/resources/js/etc/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/etc/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath}/resources/js/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.fixedHeader.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.keyTable.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/responsive.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/dataTables.scroller.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datatables/vfs_fonts.js"></script>
	<!-- jQuery custom content scroller -->
    <script src="${pageContext.request.contextPath}/resources/css/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
</body>
</html>