<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>1</td>
                          <td>김가네</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2011/04/25</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>2</td>
                          <td>김밥은</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2011/07/25</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>3</td>
                          <td>맛있지만</td>
                          <td>김종선(결재완료)->류호석(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2009/01/12</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>4</td>
                          <td>쓸데없이</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2012/03/29</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>5</td>
                          <td>비싸다</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2008/11/28</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>6</td>
                          <td>고로</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2012/12/02</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>7</td>
                          <td>김밥은</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2012/08/06</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>8</td>
                          <td>싸다김밥을</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2010/10/14</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>9</td>
                          <td>이용하자</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2009/09/15</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                          <th><input type="checkbox"></th>
                          <td>10</td>
                          <td>맛도 준수 값도 준수</td>
                          <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                          <td>김김밥</td>
                          <td>2008/12/13</td>
                          <td>대기</td>
                        </tr>
                        <tr>
                            <th><input type="checkbox"></th>
                            <td>10</td>
                            <td>맛도 준수 값도 준수</td>
                            <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                            <td>김김밥</td>
                            <td>2008/12/13</td>
                            <td>대기</td>
                          </tr>
                          <tr>
                            <th><input type="checkbox"></th>
                            <td>10</td>
                            <td>맛도 준수 값도 준수</td>
                            <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                            <td>김김밥</td>
                            <td>2008/12/13</td>
                            <td>대기</td>
                          </tr>
                          <tr>
                            <th><input type="checkbox"></th>
                            <td>10</td>
                            <td>맛도 준수 값도 준수</td>
                            <td>김종선(결재완료)->류호수(결재완료)->김종광(결재완료)</td>
                            <td>김김밥</td>
                            <td>2008/12/13</td>
                            <td>대기</td>
                          </tr>
                        
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