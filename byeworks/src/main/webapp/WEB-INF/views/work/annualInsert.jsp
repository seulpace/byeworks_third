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
          <!-- top tiles -->
          <div style="display: inline-block;" >
            <div class="col-md-12 ">
              <div class="x_panel">
                <div class="x_title">
                  <h2>연차신청</h2> 
                  <div class="clearfix"></div>
                  
                </div>
                
                <div class="x_content">
                  <br />
                  <form class="form-horizontal form-label-left">
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">현황</label>
                      <div class="col-md-9 col-sm-9">
                        <div class="form-kdh">총 휴가일 : 일 / 사용일 : 일 / 잔여일 : 일</div>
                      </div>
                      <div class="col-md-3 col-sm-3">
                        
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">작성자</label>
                      <div class="col-md-9 col-sm-9">
                        <input type="text" class="form-kdh" readonly="readonly" value=${"loginUser.memberName"}>
                      </div>
                      
                    </div>
                    
                   
                   
                    <div class="form-group row">
                      <label class="control-label col-md-2 col-sm-2 ">연차 기간</label>
                      <div class="col-md-10">
                        <form id="annualPeriod" action="" method="get">
                          <fieldset>
                            <div class="control-group">
                              <div class="controls">
                                <div class="input-prepend input-group">
                                  <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                  <input type="text" name="annualPeriod" id="annualPeriod" class="form-control" value="" />
                                </div>
                              </div>
                            </div>
                          </fieldset>
                      	</form>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="annual" class="control-label col-md-3 col-sm-3 ">연차 종류</label>
                      <div class="col-md-3 col-sm-3">
                        <select id="annualType" name="annualType">
                          <option value="">--------------------</option>
                          <option value="0">연차</option>
                          <option value="1">오전 반차</option>
                          <option value="2">오후 반차</option>
                        </select>
                      </div>  
                    </div> 
                    
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">연차 사유</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-kdh" name="annualContent" id="annualContent" >
                      </div>
                    </div>
                  
                   
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-9 col-sm-9  offset-md-3">
                        <button type="submit" class="btn btn-success">전자결재로 이동</button>
                      </div>
                    </div>

                  </form>
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