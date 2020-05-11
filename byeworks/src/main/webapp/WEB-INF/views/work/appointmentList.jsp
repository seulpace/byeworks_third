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
 
 	<title>Byeworks</title>
</head>
<body class="nav-md">
	<div class="container body">
    	<div class="main_container">
        
        <!-- 메뉴바 -->
        <jsp:include page="../common/menubar.jsp"/>
<div class="right_col" role="main">   
    <div class="col-md-12 col-sm-12  ">
      <div class="x_panel">
        <div class="x_title">
          <h2><i class="fa fa-bars"></i> 발령 내역 </h2>
          
          <div class="clearfix"></div>
        </div>
        <div class="x_content">

          <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="businessTeam" data-toggle="tab" href="#businessTeam" role="tab" aria-controls="home" aria-selected="true">사업팀</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="hrTeam" data-toggle="tab" href="#hrTeam" role="tab" aria-controls="profile" aria-selected="false">인사팀</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="generalTeam" data-toggle="tab" href="#generalTeam" role="tab" aria-controls="contact" aria-selected="false">총무팀</a>
            </li>
          </ul>
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="businessTeam" role="tabpanel" aria-labelledby="home-tab">
              <div class="col-md-12 col-sm-12 ">
                <div class="row" style="display: block;">
                  <div class="col-md-12 col-sm-12  "></div>
                    <div class="x_panel">
                      <div class="x_content">
                        <table class="table">
                        
                          <thead>
                            <tr>
                              <th>사번</th>
                              <th>이름</th>
                              <th>직책</th>
                              <th>부서</th>
                              <th>발령상태</th>
                            </tr>
                          </thead>
                          
	                          <tbody>
	                          	<c:choose>
	                          		<c:when test="${ !empty appList1 }">
				                          <c:forEach items="${ appList1 }" var="adto">
					                            <tr>
					                              <th scope="row">${adto.appEmpno}</th>
					                              <td>${adto.appointmentMem}</td>
					                              <td>${adto.departmentName}</td>
					                              <td>${adto.positionName}</td>
					                              <td>${adto.appointmentLev}</td>
					                            </tr>  
				              			 </c:forEach>   
				              		</c:when>
				              		<c:otherwise>
				              			발령 내역이 없습니다.
				              		</c:otherwise>	
				              	</c:choose>	 
	                          </tbody>
			                     
                        </table>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="tab-pane fade" id="hrTeam" role="tabpanel" aria-labelledby="profile-tab">
              <div class="col-md-12 col-sm-12 ">
                <div class="row" style="display: block;">
                  <div class="col-md-12 col-sm-12  "></div>
                    <div class="x_panel">
                      <div class="x_content">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>사번</th>
                              <th>이름</th>
                              <th>직책</th>
                              <th>부서</th>
                              <th>발령상태</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:choose>
	                          		<c:when test="${ !empty list2 }">
				                          <c:forEach items="${ list2 }" var="adto">
					                            <tr>
					                              <th scope="row">${adto.appEmpno}</th>
					                              <td>${adto.appointmentMem}</td>
					                              <td>${adto.departmentName}</td>
					                              <td>${adto.positionName}</td>
					                              <td>${adto.appointmentLev}</td>
					                            </tr>  
				              			 </c:forEach>   
				              		</c:when>
				              		<c:otherwise>
				              			발령 내역이 없습니다.
				              		</c:otherwise>	
				              	</c:choose>	 
                            
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="tab-pane fade" id="generalTeam" role="tabpanel" aria-labelledby="contact-tab">
              <div class="col-md-12 col-sm-12 ">
                <div class="row" style="display: block;">
                  <div class="col-md-12 col-sm-12  "></div>
                    <div class="x_panel">
                      <div class="x_content">
                        <table class="table">
                          <thead>
                            <tr>
                              <th>사번</th>
                              <th>이름</th>
                              <th>직책</th>
                              <th>부서</th>
                              <th>발령상태</th>
                            </tr>
                          </thead>
                          <tbody>
                             <c:choose>
	                          		<c:when test="${ !empty list3 }">
				                          <c:forEach items="${ list3 }" var="adto">
					                            <tr>
					                              <th scope="row">${adto.appEmpno}</th>
					                              <td>${adto.appointmentMem}</td>
					                              <td>${adto.departmentName}</td>
					                              <td>${adto.positionName}</td>
					                              <td>${adto.appointmentLev}</td>
					                            </tr>  
				              			 </c:forEach>   
				              		</c:when>
				              		<c:otherwise>
				              			발령 내역이 없습니다.
				              		</c:otherwise>	
				              	</c:choose>	 
                            
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
        <!-- footer content -->
        <jsp:include page="../common/footer.jsp"/>
        
      </div>
    </div>
    
    <!-- 메인 틀을 구성하기 위한 JS 추가 코드 -->
	<!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/basic/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
	
</body>
</html>