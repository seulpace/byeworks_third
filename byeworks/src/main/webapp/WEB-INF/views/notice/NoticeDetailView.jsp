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
    <style>
      #enrollForm>table{width:100%;}
      #enrollForm>table *{ margin:5px;}
      .form-notice {
            /* display: block; */
            width: 600px;
            height: calc(1.5em + .75rem + 2px);
            padding: .375rem .75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        }

        .btn-primary {
          margin-left: 130px;
        }
        
        .notice_panel {
    position: relative;
    width: 100%;
    margin-bottom: 10px;
    padding: 10px 17px;
    display: inline-block;
    background: #fff;
    border: 1px solid #E6E9ED;
    -webkit-column-break-inside: avoid;
    -moz-column-break-inside: avoid;
    column-break-inside: avoid;
    opacity: 1;
    -webkit-transition: all .2s ease;
    transition: all .2s ease;
}
    </style>
</head>
<body class="nav-md">
	<div class="container body">
    	<div class="main_container">
        
        <!-- 메뉴바 -->
        <jsp:include page="../common/menubar.jsp"/>
	

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="page-title">
              <div class="title_left">
                <h3>공지사항 <small>상세조회</small></h3>
              </div>


            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <!-- <div class="x_title"> -->
                    <!-- <h2>(공지사항제목입력되는곳)<small>작성자 : </small></h2> -->
                    <!-- <div class="clearfix"></div> -->
                  <!-- </div> -->
                  
                  <!-- <div class="btn-group">
                    <a class="btn" title="Insert picture (or just drag &amp; drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
                    <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage">
                  </div> -->

                  <!-- <div class="x_content"> -->
                    <br>


                    <!-- <p>Riusmod tempor incididunt ut labor erem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                      nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                      mollit anim id est laborum.
                    </p> -->
                    <div class="notice_panel">
                    <table align="center">
                      <tr>
                          <th><label for="title" style="margin-right:60px ;">제목</label></th>
                          <td><p style="width: 600px;">${ n.noticeTitle }</p></td>
                      </tr>
                      <tr>
                          <th><label for="writer">작성자</label></th>
                          <td><p>${ n.memberName }</p></td>
                          <!-- n.memberName으로 수정해줘야함  -->
                      </tr>
                      <tr>
                          <th><label for="upfile">첨부파일</label></th>
                          <td colspan="3">
                    		<c:choose>	
			                    <c:when test="${ !empty n.fileName }">
			                        <a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${n.FRename}" download="${ n.fileName }">${ n.fileName }</a>
			                    </c:when>
		                    	<c:otherwise>
		                        	첨부파일이 없습니다.
		                        </c:otherwise>
                    		</c:choose>
                          </td>
                      </tr>
                      <br>
                      <tr>
                          <th colspan="5"><label for="content">내용</label></th>
                      </tr>
                      <tr>
                          <th colspan="5">
                            <!-- <textarea class="form-control" required name="" id="content" rows="10" style="resize:none;"></textarea> -->
                            <br>
                            
                <textarea class="form-control" required name="noticeContent" id="content" rows="10" style="resize:none; background:white;" readonly>${ n.noticeContent }</textarea>






                            
                          </th>
                      </tr>
                    </table>
                    
                 
                    <br><br><br><br><br>
                    <c:if test="${ loginUser.memberNo eq n.memberNo }">
                    <div class="item form-group">
                      <div class="col-md-6 col-sm-6 offset-md-3">
                        <button class="btn btn-primary" onclick="postFormSubmit(2);">수정하기</button>
                        <button class="btn btn-success" type="button" onclick="goBackMy()">목록으로</button>
                        <button class="btn btn-danger" onclick="postFormSubmit(1);">삭제하기</button>
                      </div>
                      </div> <!-- 노티스 패널 -->
                      <form id="postForm" action="" method="post">
                      	<input type="hidden" name="nno" value="${ n.noticeNo }">
                      	<input type="hidden" name="fileName" value="${ n.FRename }">
                      </form>
                      
                      <script>
                      	function postFormSubmit(num) {
                      		if(num == 1) { //삭제하기 클릭시
                      			$("#postForm").attr("action", "delete.not");
                      		}else{ // 수정하기 클릭시
                      			$("#postForm").attr("action", "updateForm.not");
                      		}
                      			$("#postForm").submit();
                      	}
                      </script>
                      
                    </div>
                    </c:if>
                    
                    
                  <!-- </div> -->


                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
        
        <!-- footer content -->
        <jsp:include page="../common/footer.jsp"/>
        
      </div>
    </div>
    <script>
    	function goBackMy() {
    		window.history.back();
    	}
    
    </script>
    
        <!-- 메인 틀을 구성하기 위한 JS 추가 코드 -->
	<!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/basic/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
</body>
</html>