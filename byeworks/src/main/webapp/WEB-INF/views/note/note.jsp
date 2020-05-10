<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
 
    <!-- alertifyJs -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
 
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
        
			<c:if test="${ !empty sessionScope.sendMsg }">
			<script>
				alertify.alert("${sessionScope.sendMsg}"); 
			</script>
			<c:remove var="sendMsg" scope="session"/>
			</c:if>
        
	        <!-- 메뉴바 -->
	        <jsp:include page="../common/menubar.jsp"/>
			
			<div class="right_col" role="main">
	          	<!-- top tiles -->
	          	<div class="">
	            	<div class="page-title">
	              		<div class="title_left">
	                	<h3>쪽지함</h3>
	              	</div>
	            </div>
	
	            <div class="clearfix"></div>
	            <br>
	
	            <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
	              	<li class="nav-item">
	                	<a class="nav-link active" id="recNoteTab" data-toggle="tab" href="#recNote" role="tab" aria-controls="recNote" aria-selected="true">받은 쪽지함</a>
	              	</li>
	              	<li class="nav-item">
	                	<a class="nav-link" id="sendNoteTab" data-toggle="tab" href="#sendNote" role="tab" aria-controls="sendNote" aria-selected="false">보낸 쪽지함</a>
	              	</li>
	            </ul>
	  
	            <div class="tab-content" id="myTabContent">
	              	<div class="tab-pane fade show active" id="recNote" role="tabpanel" aria-labelledby="recNoteTab">
						<!-- 본문 테이블 -->
	                	<div class="row" style="display: block;">
	                  		<div class="col-md-12 col-sm-12 ">
	                    		<div class="x_panel">                  
	                      			<div class="x_content">
	                        			<div class="row">
	                          				<div class="col-sm-12">
	                            				<div class="card-box table-responsive">
	                              					<table id="datatable" class="table table-bordered" style="width:100%" data-order="">
	                                					<thead>
	                                  						<tr>
							                                    <th style="width:5%"></th>
							                                    <th style="width:15%" >보낸 사람</th>
							                                    <th >제목</th>
							                                    <th style="width:20%">보낸 시간</th>
	                                  						</tr>
	                                					</thead>
	                                					<tbody>
	                                						<c:forEach items="${ receiveList }" var="r">
	                                  						<tr
	                                  						<c:if test="${ r.readCheck eq 0 }">
	                                  						style="background:lightgray;"
	                                  						</c:if>
	                                  						>
	                                    						<th style="text-align: center;">
	                                    							<input type="hidden" value="${ r.noteNo }">
	                                      							<div class="checkbox">
	                                       	 							<label>
	                                          								<input type="checkbox" class="flat">
	                                        							</label>
	                                      							</div>
	                                      							<!-- 디테일 보여주기 위한 폼 -->
																	<form id="detailForm${ r.noteNo }" action="detail.nt" method="post">
																		<input type="hidden" name="noteNo" value="${ r.noteNo }">
																	</form>
	                                    						</th>
	                                    						<td>${ r.sendName }</td>
	                                    						<td>${ r.noteTitle }</td>
	                                    						<td>${ r.sendDateStr }</td>
	                                  						</tr>
	                                  						</c:forEach>
	                                					</tbody>
	                              					</table>
	
	                              					<br>
	                              					
	                              					<!-- 버튼들 -->
	                              					<div style="padding-left: 15px; padding-right: 15px;">
						                                <button class="btn btn-dark" style="float: left;" id="sendBtn"><small>쪽지 보내기</small></button>
						                                <button class="btn btn-dark" style="float: left;" data-toggle="modal" data-target=".updateGroup"><small>답장</small></button>
	                                					<div style="float:right;">
	                                  						<button class="btn btn-diy" style="color:white;" data-toggle="modal" data-target=".addAddress"><small>삭제하기</small></button>
	                                					</div>  
	                              					</div>
	                            				</div>
	                          				</div>
	                        			</div>
	                      			</div>
	                    		</div>
	                  		</div>
	                	</div>
	             	</div>
	              	<!-- 일반 주소록 끝 -->
	              
	              	<div class="tab-pane fade" id="sendNote" role="tabpanel" aria-labelledby="sendNoteTab">              
	                	<!-- 본문 테이블 -->
	                	<div class="row" style="display: block;">
	                  		<div class="col-md-12 col-sm-12 ">
	                    		<div class="x_panel">                  
	                      			<div class="x_content">
	                        			<div class="row">
	                          				<div class="col-sm-12">
	                            				<div class="card-box table-responsive">
	                              					<table id="datatable-checkbox" class="table table-bordered" style="width:100%" data-order="">
	                                					<thead>
	                                  						<tr>
							                                    <th ></th>
							                                    <th >받는 사람</th>
							                                    <th >제목</th>
							                                    <th >보낸 시간</th>
							                                    <th >수신 확인</th>
	                                  						</tr>
	                                					</thead>
	                                					<tbody>
	                                						<c:forEach items="${ sendList }" var="s">
	                                  						<tr>
	                                    						<th style="text-align: center;">
	                                    							<input type="hidden" value="${ s.noteNo }">
	                                      							<div class="checkbox">
	                                        							<label>
	                                          								<input type="checkbox" class="flat">
	                                        							</label>
	                                      							</div>
																	<!-- 디테일 보여주기 위한 폼 -->
																	<form id="detailForm${ s.noteNo }" action="detail.nt" method="post">
																		<input type="hidden" name="noteNo" value="${ s.noteNo }">
																	</form>
	                                    						</th>
							                                    <td>${ s.receiveName }</td>
							                                    <td>${ s.noteTitle }</td>
							                                    <td>${ s.sendDateStr }</td>
							                                    <td>
							                                    	<c:choose>
							                                    	<c:when test="${ s.readCheck eq 0 }">
							                                    		<strong>읽음</strong>
							                                    	</c:when>
							                                    	<c:when test="${ s.readCheck eq 1 }">
							                                    		읽지 않음
							                                    	</c:when>
							                                    	<c:when test="${ s.readCheck eq 2 }">
							                                    		발송 취소
							                                    	</c:when>
							                                    	</c:choose>
							                                    </td>
	                                  						</tr>
	                                  						</c:forEach>
	                                					</tbody>
	                              					</table>
	
	                              					<br>
	                              					
	                              					<!-- 버튼들 -->
	                              					<div style="padding-left: 15px; padding-right: 15px;">
	                                					<div style="float:right;">
	                                  						<button class="btn btn-diy" style="color:white;" data-toggle="modal" data-target=".addAddress"><small>발송 취소</small></button>
	                                					</div>  
	                              					</div>
	                            				</div>
	                          				</div>
	                        			</div>
	                      			</div>
	                    		</div>
	                  		</div>
	                	</div>
	              	</div>
	              	<!-- 즐겨찾기 끝 -->
				</div>
				<!-- 탭 끝 -->
			</div>
		</div>
	        
		<!-- footer content -->
		<jsp:include page="../common/footer.jsp"/>
	        
	</div>
</div>
	<script>
		$(function(){
			// 쪽지 보내기
			$("#sendBtn").click(function() {
				location.href = "sendForm.nt";
			});
			
			// 쪽지 세부조회
			$("table>tbody>tr").click(function() {
				var noteNo = $(this).children().eq(0).children().eq(0).val();
				var formName = "#detailForm" + noteNo;
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