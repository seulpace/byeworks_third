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
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>쪽지 보내기</h3>
              </div>
            </div>

            <div class="clearfix"></div>
            <br>

            <!-- 본문 테이블 -->  
            <div class="row" style="display: block;">
              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">                  
                  <div class="x_content">
                    <div class="row">
                      <div class="col-sm-12">
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                          <div class="item form-group">
                            <label class="col-form-label col-md-2 col-sm-2 label-align" for="first-name">제목 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 ">
                              <input type="text" id="first-name" required="required" class="form-control ">
                            </div>
                          </div>
                          <div class="item form-group">
                            <label class="col-form-label col-md-2 col-sm-2 label-align" for="last-name">받는 사람 <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6">
                                <input type="text" id="last-name" name="last-name" required="required" class="form-control">
                            </div>
                            <button type="button" class="btn btn-diy" style="float:left; color:white;" data-toggle="modal" data-target=".searchAddress"><small>찾아보기</small></button>
                          </div>

                          <div class="x_panel">
                            <div class="x_title">
                              <h2>내용 작성</h2>
                              <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                              </ul>
                              <div class="clearfix"></div>
                            </div>

                            <div class="x_content">
                              
                              <form>
                                <textarea style="resize: none; width: 100%; height: 250px;">

                                </textarea>
                                <div class="ln_solid">
                                  <br>
                                  <div style="padding-left: 15px; padding-right: 15px;">
                                    <div style="float:right;">
                                      <button class="btn btn-diy" style="color:white;"><small>뒤로 가기</small></button>
                                      <button class="btn btn-warning"><small>보내기</small></button>
                                    </div>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </div>  
                        </form>
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
        
        <!-- Modal -->
        <div class="modal fade searchAddress" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">

          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">주소록 찾아보기</h4>
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">

            <!-- 모달창 그룹 추가 본문 내용 -->
            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
              <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>이름</th>
                    <th>부서</th>
                    <th>직책</th>
                    <th>이메일</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                    <td>Tiger Nixon</td>
                    <td>사업팀</td>
                    <td>팀장</td>
                    <td>61hi@naver.com</td>
                  </tr>
                  
                </tbody>
              </table>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          </div>

        </div>
      </div>
    </div>
        
      </div>
    </div>
    
    <!-- 메인 틀을 구성하기 위한 JS 추가 코드 -->
	<!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/basic/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
	
</body>
</html>