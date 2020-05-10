<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
                        <th rowspan="3" style="vertical-align: middle;">결재선</th>
                        <c:forEach items="${ slist }" var="s">
                        	<th>${ s.position }</th>
                       	</c:forEach>
                      </tr>
                      
                      <tr>
         				  
         				  	
	                      		<c:forEach items="${ slist }" var="s" varStatus="status">
	                      		
	                      		  <c:if test = "${loginUser.memberNo ne s.memberNo }">
	                      			<c:choose>
	                      				<c:when test="${ s.status eq 'C' }">
	                        				<td>승인</td>
	                      				</c:when>
	                      		
	                      				<c:when test="${ s.status eq 'O' }">
	                      					<td>진행</td>
	                      				</c:when>
	                      				
	                      				<c:when test="${ s.status eq 'N' }">
	                      					<td>대기</td>
	                      				</c:when>
	                      		
	                      				<c:otherwise>
	                      					<td>반려</td>
	                      				</c:otherwise>			
	                      			</c:choose>
	                      		   </c:if> 
	                      		   
	                      		   
	                      		   <c:if test = "${ loginUser.memberNo eq s.memberNo}">
	                      		   	<c:choose>
	                      		   		<c:when test = "${ count.first }">
	                      		   		  <td><button id="signLineConfirm">승인</button><button id="signLineReturn">반려</button></td>
	          							</c:when>
	          							
	          							
	  
	          						</c:choose>	
	                      		   </c:if>
	                      		   
	                      	
	                      		   
	                      		 
	                      		
                      			</c:forEach>
                      		
							
                      </tr>
					  
					  
					  
                      <tr>
                      <c:forEach items="${ slist }" var="s">
                        <td>${ s.memberName }</td>
                      </c:forEach>
                      </tr>

                      </table>
                      	
                      	<div><h6>참조자</h6></div>
                      	<div>
                      		<c:forEach items="${ rlist }" var="r">
                      			<span>${ r.memberName } <c:choose><c:when test="${ r.status eq 'C'}">(확인)</c:when><c:otherwise>(미확인)</c:otherwise></c:choose></span>&nbsp;/&nbsp;                   		
                      		</c:forEach>
                      		
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
                              			<td>오전반차</td>
                              		</c:when>
                              		
                              		<c:when test= "${ list.annualType eq 2 }">
                              			<td>오후반차</td>
                              		</c:when>

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
          	
          	<c:if test = "${!empty alist  }">
          	<div>
          		<h6>첨부파일 :</h6> 
          		<c:forEach items="${ alist }" var="a">
          			<a href="${pageContext.servletContext.contextPath }/resources/sign_files/${ a.maName }" download="${ a.oaName }">${ a.oaName}</a>&nbsp;&nbsp; // &nbsp;&nbsp;
          		</c:forEach>
          		
          	</div>
			</c:if>	
						
						
			
			<div align="center">
			
			<c:if test="${ list.signStatus eq 'N' }">
			<button id="signUpBtn">결재상신</button>
			<button id="signUpdateBtn">결재 수정</button>
			</c:if>
			
			</div>


            	</div>
          
          </div>
          
          </div>
          </div>
          
          <script>
          	$(function(){
          		$("#signUpBtn").on("click",function(){
          					
          			location.href = "signUp.si?sno=${ list.signNo }&mno=${ list.memberNo}";
          			
          		});
          		
          		$("#signUpdateBtn").on("click",function(){
          			
          			location.href = "signFormUpdate.si?sno=${ list.signNo}&mno=${ list.memberNo}&type=${list.docuType}";
          		});
          		
          		
          		
          		
          		
          	});
          
          </script>
          

	<!-- footer include -->
	<jsp:include page="../common/footer.jsp"/>
	<!-- 메인 틀을 구성하기 위한 JS 추가 코드 -->
	<!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/basic/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
</body>
</html>