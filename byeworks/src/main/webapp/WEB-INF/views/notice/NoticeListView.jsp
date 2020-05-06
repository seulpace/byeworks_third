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
          		<div class="">
            		<div class="page-title">
              			<div class="title_left">
                			<h3>공지사항 <small>전체목록</small></h3>
              			</div>
					</div>

            		<div class="clearfix"></div>

            		<div class="row">
              			<div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><small>공지사항</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>

                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">

                    <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>조회수</th>
                          <th>등록일</th>

                        </tr>
                      </thead>


                      <tbody>
                        <tr>
                          <td>12</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>11</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>10</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>9</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>                      
                        <tr>
                          <td>8</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>7</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>6</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>                    
                        <tr>
                          <td>4</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>3</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>공지사항 시스템</td>
                          <td>인사팀</td>
                          <td>20</td>
                          <td>2019/04/25</td>
                        </tr>                        
                      </tbody>
                    </table>
                  </div>
                  </div>
              </div>
            </div>
                </div>
              </div>

	<jsp:include page="../common/footer.jsp"/>
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