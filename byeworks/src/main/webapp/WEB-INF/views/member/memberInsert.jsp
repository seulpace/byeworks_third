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
          <!-- top tiles -->
          <div class="row" style="display: inline-block;" >
            <div class="col-md-12 ">
              <div class="x_panel">
                <div class="x_title">
                  <h2>사원 등록</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form class="form-horizontal form-label-left" id="updateMember" method="post" enctype="multipart/form-data" action="memberInsert.me"> 
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">프로필사진</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="file" name="profileModify" id="profileModify" >
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">이름</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" id="memberName" name="memberName">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="department" class="control-label col-md-3 col-sm-3 ">소속</label>
                      <div class="col-md-9 col-sm-9 ">
                        <select id="department">
                          <option value="">--------------------</option>
                          <option value="2">사업팀1</option>
                          <option value="3">사업팀2</option>
                          <option value="4">인사팀1</option>
                          <option value="5">인사팀2</option>
                          <option value="6">총무팀1</option>
                          <option value="7">총무팀2</option>
                        </select>
                      </div> 
                    </div>
                    <div class="form-group row">
                      <label for="position" class="control-label col-md-3 col-sm-3 ">직위</label>
                        <div class="col-md-9 col-sm-9 ">
                          <select id="position">
                                <option value="">--------------------</option>
                                <option value="1">임원</option>
                                <option value="2">부장</option>
                                <option value="3">과장</option>
                                <option value="4">사원</option>
                          </select>
                        </div>
                    </div>
                    
                    <div class="form-group row ">
                      <label class="control-label col-md-3 col-sm-3 ">사내 전화</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" id="extension" name="extension">
                      </div>
                    </div>
                 
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">휴대전화</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" id="phone" name="phone">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">개인이메일</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="email" class="form-control" id="email" name="email">
                      </div>
                    </div>
                   
                    <div class="form-group row ">
                      <label class="control-label col-md-3 col-sm-3 ">주소</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control"  id="address" name="address">
                      </div>
                    </div>
                    <div class="form-group row ">
                      <label class="control-label col-md-3 col-sm-3 ">생년월일</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="String" class="form-control"  id="birth" name="birth">
                      </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-9 col-sm-9  offset-md-3">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">사원등록</button>

                            <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
                              <div class="modal-dialog modal-sm">
                                <div class="modal-content">

                                  <div class="modal-header">
                                    <h4 class="modal-title" id="myModalLabel2">사원 등록</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                    </button>
                                  </div>
                                  <div class="modal-body">
                                    <h4>사원 등록하시겠습니까?</h4>
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
                                    <button type="submit" class="btn btn-primary">네</button>
                                  </div>

                                </div>
                              </div>
                            </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
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