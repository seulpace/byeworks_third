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
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3> 결재 할 문서 조회</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">
                           <button style="width: 100px;height: 30px;border-radius: 5px;">결 재</button> 
                           <br><br>
                    <table id="datatable" class="table table-striped table-bordered" style="width:100%;text-align: center;">
                      <thead>
                        <tr>
                          <th style="width:5%">선택</th>
                          <th style="width: 5%;">번호</th>
                          <th style="width: 20%">제목</th>
                          <th style="width: 35%">진행상태</th>
                          <th style="width: 10%">작성자</th>
                          <th style="width: 15%">작성일자</th>
                          <th style="width: 10%">결재상태</th>
                        </tr>
                      </thead>


                      <tbody>
                      
                      <c:forEach items="${ list }" var="l">
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>${ l.signNo }</td>
                          <td>${ l.title }</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>${ l.memberName }</td>
                          <td>${ l.signUpDate }</td>
                          
                           
                         		 <c:choose>                       		
                          			<c:when test="${ l.signStatus eq 'C' && l.flag eq 'Y' }">
                          				<td>완료</td>
                          			</c:when>
                          			
                          			<c:when test="${ l.signStatus eq 'R' && flag eq 'R' }">
                          				<td>반려</td>
                          			</c:when>
                          			
                          			<c:when test="${ l.signStatus eq 'O' && flag eq 'O' }">
                          				<td>진행</td>
                          			</c:when>
                          			
                          			<c:when test="${ l.signStatus eq 'D' && flag eq 'N' }">
                          				<td>회수</td>
                          			</c:when>
                          			
                          			<c:otherwise>
                          				<td>대기</td>
                          			</c:otherwise>
                          		</c:choose>
                        </tr>
                      </c:forEach>
                     
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