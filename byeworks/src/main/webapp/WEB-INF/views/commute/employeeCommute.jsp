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
		<!-- page content -->
        <div class="right_col" role="main">   
          
         
          <h2>전사원 출퇴근 조회</h2>
            <div class="x_title">
              <div class="clearfix"></div>
              
            </div>
            <div class="x_content">
              <div class="calendar-exibit">
                <div class="col-md-3">
                  <fieldset>
                    <div class="control-group">
                      <div class="controls">
                        <div class="col-md-11 xdisplay_inputx form-group row has-feedback">
                          <input type="text" class="form-control has-feedback-left" id="single_cal1" value="" name="" aria-describedby="inputSuccess2Status">
                          <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                          <span id="inputSuccess2Status" class="sr-only">(success)</span>
                        </div>
                      </div>
                    </div>
                  </fieldset>
                
                </div>
              </div>
              <div class="col-md-12"></div>
              <div class="row" style="display: block;">
                <div class="col-md-12 col-sm-12">
                  <table id="datatable" class="table table-bordered" style="width:100%">
                    <thead>
                      <tr>
                        <th>사원</th>
                        <th>사번</th>
                        <th>부서</th>
                        <th>직책</th>
                        <th>출근시간</th>
                        <th>퇴근시간</th>
                        <th>비고</th>
                      </tr>
                    </thead>


                    <tbody>
                      <tr>
                        <td>홍길동</td>
                        <td>20200423112</td>
                        <td>사업팀</td>
                        <td>사원</td>
                        <td>6:00</td>
                        <td>9:00</td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>강강강</td>
                        <td>20200423112</td>
                        <td>사업팀</td>
                        <td>사원</td>
                        <td>9:10</td>
                        <td>6:00</td> 
                        <td>지각</td>
                      </tr>
                      <tr>
                        <td>강강강</td>
                        <td>20200423113</td>
                        <td>사업팀</td>
                        <td>사원</td>
                        <td></td>
                        <td></td> 
                        <td>연차</td>
                      </tr>
                      
                    </tbody>
                  </table>
                  
                </div>
              </div>    

            </div>
          
     

          <div class="clearfix"></div>

        </div>
        <!-- /page content -->
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