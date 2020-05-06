<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>