<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Calendar cal = Calendar.getInstance();
	int month = cal.get(cal.MONTH) + 1;
%>
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
	         
	    
	            	<button class="btn btn-danger" type="button" id="commuteWorkBtn" onclick=""><small>출근하기</small></button>
	            
	       
	          	</div>
	          <script>
	          
	          		function test(checkCommute){
	          			var sysdate= new Date(); 
	          			
	          			var url='';
          				var type='get';
          				var data={
          						"sysdate" : sysdate,
          						"commuteMember" : ${loginUser.memberNo}
          				}
          				var str='';
          				
          				if(checkCommute==0){
          					url="commuteWorkTime.do";
          					str="퇴근하기";
          				}else{
          					url="commuteLeavedTime.do";
          					str="출근하기"
          				}
          	
          			
          				$.ajax({
								url:url,
								type:type,
								data: data,
								success:function(){
								
								    $("#commuteWorkBtn").html(str);
								
								    
								},
								error: function(){
									console.log("ajax 통신 실패");
								}

    					});
	          		}
	          	
	          		$(function(){
	          		
	          			
         				
	          		// 출근하기 넣는 에이작스 
	          			
	          		
	          			$("#commuteWorkBtn").click(function(){
	          				$.ajax({
	          					url:"wheterCommute.co",
	          					success:function(result){
	          						
			          				//checkCommute = result;
			          				console.log(result);
			          				
			          				test(result);
			          				
			          				
	          					}
	          					
	          				}); 
	          				
	    							
	    				});
	          			
	          			
	          		
	          			// 출근여부 확인후 버튼 클릭시 퇴근하는 값 update
	          			
	          			/* 
	          			if(${! empty c.commuteWork}){
	          				
	          				$("#commuteWorkBtn").click(function{
	          					console.log("될까");
	          				});
	          			} */
	          		});
	          			
	          		
	          
	          </script>
				
          		<div class="row" style="display: block;">
					<!-- 왼쪽 영역 -->
            		<div class="col-md-6 col-sm-6">
            			<div class="row" style="display:block;">
            				<div class="x_panel">
            					<!-- 공지사항 보여주는 부분 -->
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
							<div class="x_panel">
                				<div class="x_title" style="margin:0">
                  					<h2>진행 중인 프로젝트</h2>
                  					<div class="clearfix"></div>
                				</div>
	                			<div class="x_content">
                    				<div class="dashboard-widget-content">
                      					<ul class="quick-list">
					                        <li><i class="fa fa-bars"></i><a href="#">Subscription</a></li>
					                        <li><i class="fa fa-bar-chart"></i><a href="#">Auto Renewal</a> </li>
					                        <li><i class="fa fa-support"></i><a href="#">Help Desk</a> </li>
					                        <li><i class="fa fa-heart"></i><a href="#">Donations</a> </li>
                      					</ul>

                      					<div class="sidebar-widget">
                        					<h4>Goal</h4>
                        					<canvas width="150" height="80" id="chart_gauge_02" class="" style="width: 160px; height: 100px;"></canvas>
                        					<div class="goal-wrapper">
					                        	<span class="gauge-value pull-left">$</span>
					                        	<span id="gauge-text2" class="gauge-value pull-left">3,200</span>
					                        	<span id="goal-text2" class="goal-value pull-right">$5,000</span>
                        					</div>
                      					</div>
                    				</div>
		                		</div>
							</div>
            			</div>
					</div>
					
					<!-- 개인 일정 (오른쪽) -->
					<div class="col-md-6 col-sm-6">
						<div class="x_panel">
	                		<div class="x_title">
	                  			<h2>
	                  				<%=month %>월 일정 
	                  				<a href="my.sc" style="float:right"><small>일정 더 보러가기</small></a>
	                  			</h2>
	                  			<div class="clearfix"></div>
	                		</div>
	                		<div class="x_content">
                    		<!-- start accordion -->
                    			<div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                    				<c:if test="${ ! empty sList }">
	                    				<c:forEach items="${ sList }" var="s">
	                      				<div class="panel">
	                        				<a class="panel-heading" style="" role="tab" id="heading${ s.schNo }" data-toggle="collapse" data-parent="#accordion" href="#collapse${ s.schNo }" aria-expanded="true" aria-controls="collapse${ s.schNo }">
	                          					<h4 class="panel-title">${ s.title }</h4>
	                        				</a>
	                        				<div id="collapse${ s.schNo }" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${ s.schNo }">
	                        					<div style="margin-left:3%; margin-right:3%; margin-top:3%">
		                          					<div class="form-group row">
							                        	<label class="col-form-label col-md-2 col-sm-2">일자</label>
							                        	<div class="col-md-10 col-sm-10 ">
							                          		<input type="text" class="form-control" placeholder="일자 없음" value="${ s.beginDate } ~ ${ s.endDate }">
							                        	</div>
							                      	</div>
							                      	<div class="form-group row">
							                        	<label class="col-form-label col-md-2 col-sm-2 ">위치</label>
							                        	<div class="col-md-10 col-sm-10 ">
							                          		<input type="text" class="form-control" placeholder="위치 없음" value="${ s.location }">
							                        	</div>
							                      	</div>
							                      	<div class="form-group row">
							                        	<label class="col-form-label col-md-2 col-sm-2 ">메모</label>
							                        	<div class="col-md-10 col-sm-10 ">
							                          		<input type="text" class="form-control" placeholder="메모 없음" value="${ s.note }">
							                        	</div>
							                      	</div>
						                      	</div>
	                        				</div>
	                      				</div>
	                      				</c:forEach>
                      				</c:if>
                      				<c:if test="${ empty sList }">
                      					등록된 일정이 없습니다.
                      				</c:if>
                    			</div>
                    			<!-- end of accordion -->
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
