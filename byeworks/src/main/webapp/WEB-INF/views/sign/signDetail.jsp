<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/LogoExample.png" type="image/png" />
<title>ByeWorks</title>

</head>
<!-- menubar 위에 있던 파일의 경우에 css가 적용되지 않아 두 개의 css 따로 적용  -->
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/basic/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/css/custom.min.css" rel="stylesheet">
 
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">

	<!-- menubar include -->
	<jsp:include page="../common/menubar.jsp"/>

	<div class="right_col" role="main">
          <!-- top tiles -->
         
            <div style="width: 70%;margin-left: 100px;;" >
            <div class="panel-body">
                            
                <table class="table table-bordered">
                  
                    <tr>
                      <th>문서종류</th>
                      <c:choose>
                      	<c:when test ="${ list.docuType eq 'V' }">
                      		<td>휴가신청서</td>
                      	</c:when>
                      	
                      	<c:when test ="${ list.docuType eq 'Q' }">
                      		<td>사직서</td>
                      	</c:when>
                      	
                      	<c:otherwise>
                      		<td>발령/승진 위임서</td>
                      	</c:otherwise>
                      </c:choose>
                      <th>문서 번호</th>
                      <td>${ list.signNo }</td>
                      
                    </tr>
                    <tr>
                        <th>기안부서</th>
                        <td>${ list.department }</td>
                        <th>작성자</th>
                        <td>${ list.memberName }</td>  
                    </tr>  
                </table>
              </div>

              <div class="panel">
                  <div class="panel-body">
                    <table class="table table-bordered"  style="text-align: center;">
                          <tr>
                            <th rowspan="4" style="vertical-align: middle;">결재</th>
                            <th>과장</th>
                            <th>부장</th>
                            <th>이사</th>
                          </tr>

                          <tr>
                              <td rowspan="2">ㅇ</td>
                              <td rowspan="2">ㅇ</td>
                              <td rowspan="2">ㅇ</td>
                          </tr>

                          <tr></tr>

                          <tr>
                              <td>김가네</td>
                              <td>김밥은</td>
                              <td>비싸요</td>
                          </tr>

                      </table>
                      	<div>참조자</div>
                      	<div>
                      		<span>누구</span>
                      		<span>누구</span>
                      		<span>누구</span>
                      		<span>누구</span>
                      	</div>
                      	<br><br>
                      
                  </div>
              </div>
			<c:choose>
				<c:when test="${ list.docuType eq 'V' }">
            		<div>
                       <table class="table table-bordered">     
      					<tr>
                          <th style="width:150px;">연차종류</th>
                             
                              	<c:choose>
                              		<c:when test = "${ list.annualType eq 0 }">
                              			<td>연차</td>
                              		</c:when>
                              		
                              		<c:when test = "${ list.annualType eq 1 }">
                              			<td>오전반차<td>
                              		</c:when>
                              		
                              		<c:otherwise>
                              			<td>오후반차</td>
                              		</c:otherwise>

                               </c:choose>
                        </tr>
                        
                        <tr>
                          <th>연차사유</th>
                             <td>
                               <textarea readonly name="annualContent" style="width: 100%;resize: none;border:none;"rows="20">${ list.annualContent }</textarea>
                             </td>
                        </tr>
 
                        <tr>
                             <th>휴가시작 날짜</th>
                             <td>${ list.annualStartDay }</td>
                        </tr>
                        
                        <tr>
                        	<th>기간</th>
                        	<th>${ list.annualPeriod }</th>
                        </tr>

                            </table><br>
					
         			 </div>
				  </c:when>
				  
				  <c:when test="${ list.docuType eq 'Q' }">
				  		<div class="panel-body">
				  		
				  		<table class="table table-bordered" style="width:100%; text-align: center; height:200px">
                              
                              <tr>
                              	 <th>입사일</th>
                              	 <td>${ list.enrollDate }</td>
                              </tr>
                              
                              <tr>
                              	 <th>퇴사일</th>
                              	 <td>${ list.quitDate }</td>
                              </tr>
                              
                              <tr>
                                 <th>퇴사이유</th>
                                 <td>
                                    <textarea readonly style="width: 100%;resize: none;border:none;" name="reason"rows="20">${ list.reason }</textarea>
                                </td>
                              </tr>

                            </table><br>
				  		
				  
				  		</div>
				  </c:when>
				  
				  <c:otherwise>
				  		<div class="panel-body">
				  			  <table class="table table-bordered" style="width:100%; text-align: center; height:200px; border-spacing: 25px;">

								  <tr>
                                      <th>(승진/발령)종류</th>
                                      <c:choose>
                                      	<c:when test="${ list.appointmentLev eq 0 }">
                                      		<td>부서이동</td>
                                      	</c:when>
                                      	
                                      	<c:when test="${ list.appointmentLev eq 1 }">
                                      		<td>직위승진</td>
                                      	</c:when>
                                      	
                                      	<c:otherwise>
                                      		<td>부서이동+직위승진</td>
                                      	</c:otherwise>
                                      </c:choose>
                                  </tr>
								  
                                  <tr>
                                      <th>기존부서</th>
                                      <td>${ list.depBefore }</td>
                                  </tr>
                                  
                                  <tr>
                                  	  <th>발령부서</th>
                                  	  <td>${ list.depAfter }</td>
                                  </tr>
                                  
                                  <tr>
                                      <th>기존직위</th>
                                      <td>${ list.positionBefore }</td>
                                  </tr>
                                  	
                                  <tr>
                                  	  <th>발령직위</th>
                                  	  <td>${ list.positionAfter }</td>
                                  </tr>
                                  
                                  <tr>
                                    <th>시행일시</th>
                                    <td>${ list.appointmentDate }</td>
                                  </tr>
                                </table><br>
				  		
				  		</div>
				  </c:otherwise>
          	</c:choose>
						
						
						
			
			<div align="center"><button>결재 수정</button></div>


            	</div>
          
          </div>
          
          </div>
          </div>
          

	<!-- footer include -->
	<jsp:include page="../common/footer.jsp"/>
	<!-- 메인 틀을 구성하기 위한 JS 추가 코드 -->
	<!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/basic/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
</body>
</html>