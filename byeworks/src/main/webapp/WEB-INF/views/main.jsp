<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/LogoExample.png" type="image/png" />

	<!-- menubar 위에 있던 파일의 경우에 css가 적용되지 않아 두 개의 css 따로 적용  -->
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/basic/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/css/custom.min.css" rel="stylesheet">
 
 	<title>Byeworks</title>
 	
 	<style>
 		table>tbody>tr:hover{
 			cursor:pointer;
 		}
 	</style>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
        
	        <!-- 메뉴바 -->
	        <jsp:include page="common/menubar.jsp"/>

        	<div class="right_col" role="main">
          	
	          	<!-- top tiles -->
	          	<div class="well" style="overflow: auto">
	            	<button class="btn btn-danger"style="display: none;"><small>출근하기</small></button>
	            	<button class="btn btn-danger" ><small>퇴근하기</small></button>
	          	</div>

          		<div class="row" style="display: block;">
            		<div class="col-md-6 col-sm-6  ">
              			<div class="x_panel">
                			<div class="x_title">
                  				<h2>공지사항</h2>
                  				<div class="clearfix"></div>
                			</div>
	                		<div class="x_content">
	                  			<table class="table" id="noticeTable">
	                    			<thead>
	                      				<tr>
	                        				<th></th>
	                        				<th>제목</th>
	                      				</tr>
	                    			</thead>
	                    			<tbody>
	                    				<c:forEach items="${ nList }" var="n" varStatus="status">
		                      			<tr>
					                        <th scope="row">
					                        	<input type="hidden" value="${ n.noticeNo }">
					                        	${ status.count }
					                        	
					                        	<form id="goNotice${ n.noticeNo }" action="detail.not" method="post">
					                        		<input type="hidden" value="${ n.noticeNo }" name="nno">
					                        	</form>
					                        </th>
					                        <td>${ n.noticeTitle }</td>
		                      			</tr>
		                      			</c:forEach>
		                    		</tbody>
		                  		</table>
		                	</div>
						</div>
					</div>

	            	<div class="col-md-6 col-sm-6">
	              		<div class="x_panel">
	                		<div class="x_title">
	                  			<h2>프로젝트 진행률</h2>
	                  			<div class="clearfix"></div>
	                		</div>
	                		<div class="x_content">
	                  			<table class="table">
	                    			<thead>
	                      				<tr>
					                        <th></th>
					                        <th>프로젝트명</th>
					                        <th>진행률</th>
	                      				</tr>
	                    			</thead>
	                    			<tbody>
	                      				<tr>
					                        <th scope="row">1</th>
					                        <td>어쩌고 프로젝트</td>
					                        <td>65%</td>
	                      				</tr>
	                      				<tr>
					                        <th scope="row">2</th>
					                        <td>이러저러 프로젝트</td>
					                        <td>80%</td>
	                      				</tr>
	                      				<tr>
					                        <th scope="row">3</th>
					                        <td>ㅇㅇ</td>
					                        <td>90%</td>
	                      				</tr>
	                    			</tbody>
	                  			</table>
	                		</div>
						</div>
					</div>
				</div>

				<div class="row" style="display: block;">
	            	<div class="calendar-exibit">
	              		<div class="col-md-3">
	                		<div class="daterangepicker dropdown-menu ltr single opensright show-calendar picker_4 xdisplay">
	                  
	                  			<div class="calendar left single" style="display: block;">
	                    			<div class="daterangepicker_input">
	                      				<input class="input-mini form-control active" type="text" name="daterangepicker_start" value="" style="display: none;">
	                   					<i class="fa fa-calendar glyphicon glyphicon-calendar" style="display: none;"></i>
	                   					<div class="calendar-time" style="display: none;">
	                     					<div></div>
	                     					<i class="fa fa-clock-o glyphicon glyphicon-time"></i>
	                   					</div>
	                    			</div>
	                    			<div class="calendar-table">
	                      				<table class="table-condensed" style="text-align: center;">
	                        				<thead>
	                          					<tr>
	                            					<th class="prev available">
	                              						<i class="fa fa-chevron-left glyphicon glyphicon-chevron-left"></i>
	                            					</th>
	                            					<th colspan="5" class="month">Oct 2016</th>
	                            					<th class="next available">
	                              						<i class="fa fa-chevron-right glyphicon glyphicon-chevron-right"></i>
	                            					</th>
	                          					</tr>
	                          					<tr>
						                            <th>Su</th>
						                            <th>Mo</th>
						                            <th>Tu</th>
						                            <th>We</th>
						                            <th>Th</th>
						                            <th>Fr</th>
						                            <th>Sa</th>
	                          					</tr>
	                       	 				</thead>
	                        				<tbody>
	                          					<tr>
						                            <td class="weekend off available" data-title="r0c0">25</td>
						                            <td class="off available" data-title="r0c1">26</td>
						                            <td class="off available" data-title="r0c2">27</td>
						                            <td class="off available" data-title="r0c3">28</td>
						                            <td class="off available" data-title="r0c4">29</td>
						                            <td class="off available" data-title="r0c5">30</td>
						                            <td class="weekend available" data-title="r0c6">1</td>
	                          					</tr>
	                          					<tr>
						                            <td class="weekend available" data-title="r1c0">2</td>
						                            <td class="available" data-title="r1c1">3</td>
						                            <td class="available" data-title="r1c2">4</td>
						                            <td class="available" data-title="r1c3">5</td>
						                            <td class="available" data-title="r1c4">6</td>
						                            <td class="available" data-title="r1c5">7</td>
						                            <td class="weekend available" data-title="r1c6">8</td>
	                          					</tr>
	                          					<tr>
						                            <td class="weekend available" data-title="r2c0">9</td>
						                            <td class="available" data-title="r2c1">10</td>
						                            <td class="available" data-title="r2c2">11</td>
						                            <td class="available" data-title="r2c3">12</td>
						                            <td class="available" data-title="r2c4">13</td>
						                            <td class="available" data-title="r2c5">14</td>
						                            <td class="weekend available" data-title="r2c6">15</td>
					                          	</tr>
					                          	<tr>
						                            <td class="weekend available" data-title="r3c0">16</td>
						                            <td class="available" data-title="r3c1">17</td>
						                            <td class="today active start-date active end-date available" data-title="r3c2">18</td>
						                            <td class="available" data-title="r3c3">19</td>
						                            <td class="available" data-title="r3c4">20</td>
						                            <td class="available" data-title="r3c5">21</td>
						                            <td class="weekend available" data-title="r3c6">22</td>
	                          					</tr>
	                          					<tr>
	                          						<td class="weekend available" data-title="r4c0">23</td>
						                            <td class="available" data-title="r4c1">24</td>
						                            <td class="available" data-title="r4c2">25</td>
						                            <td class="available" data-title="r4c3">26</td>
						                            <td class="available" data-title="r4c4">27</td>
						                            <td class="available" data-title="r4c5">28</td>
						                            <td class="weekend available" data-title="r4c6">29</td>
	                          					</tr>
	                          					<tr>
						                            <td class="weekend available" data-title="r5c0">30</td>
						                            <td class="available" data-title="r5c1">31</td>
						                            <td class="off available" data-title="r5c2">1</td>
						                            <td class="off available" data-title="r5c3">2</td>
						                            <td class="off available" data-title="r5c4">3</td>
						                            <td class="off available" data-title="r5c5">4</td>
						                            <td class="weekend off available" data-title="r5c6">5</td>
	                          					</tr>
	                        				</tbody>
	                      				</table>
	                    			</div>
	                  			</div>
	                		</div>                
	              		</div>
	            	</div>

	            	<div class="col-md-9">
	              		<div class="x_panel">
	                		<div class="x_title">
	                  			<h2>4월 팀 일정</h2>
	                  			<div class="clearfix"></div>
	                		</div>
	                		<div class="x_content">
	                  			<table class="table">
	                    			<thead>
	                      				<tr>
					                        <th></th>
					                        <th>일정명</th>
					                        <th>시작일</th>
					                        <th>종료일</th>
	                      				</tr>
	                    			</thead>
	                    			<tbody>
	                      				<tr>
					                        <th scope="row">1</th>
					                        <td>팀 회식</td>
					                        <td>17일</td>
					                        <td>17일</td>
	                      				</tr>
	                      				<tr>
					                        <th scope="row">2</th>
					                        <td>프로젝트 구축 관리 기간</td>
					                        <td>20일</td>
					                        <td>24일</td>
	                      				</tr>
	                      				<tr>
					                        <th scope="row">3</th>
					                        <td>회사 창립기념일</td>
					                        <td>22일</td>
					                        <td>22일</td>
	                      				</tr>
	                    			</tbody>
	                  			</table>
	                		</div>
	              		</div>
	            	</div>
	          	</div>
			</div>
	
	        <!-- footer content -->
	        <jsp:include page="common/footer.jsp"/>
	        <!-- /footer content -->
		</div>
    </div>
    
    <script>
    	$(function(){
    		// 공지사항 상세보기
		    $("#noticeTable>tbody>tr").click(function() {
		    	var nno = $(this).children().eq(0).children().eq(0).val();
		    	
		    	var formName = "#goNotice" + nno;
		    	$(formName).submit();
		    });
    	});
    </script>
    
    <!-- 메인 틀을 구성하기 위한 JS 추가 코드 -->
	<!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/basic/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
	
  </body>
</html>
