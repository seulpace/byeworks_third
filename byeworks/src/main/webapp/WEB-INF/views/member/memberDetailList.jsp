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
 	<!-- alertifyJS 스크립트 -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <title>Byeworks</title>
</head>
<body class="nav-md">
   <div class="container body">
       <div class="main_container">
        <c:if test="${ !empty sessionScope.msg }">
			<script>
			alertify.alert("${sessionScope.msg}");	// alert("회원가입성공"); 으로 뜨기 때문에 안에 el 태그 string으로 취급해야함
			</script>
			<c:remove var="msg" scope="session"/>
		</c:if>
        <!-- 메뉴바 -->
        <jsp:include page="../common/menubar.jsp"/>

<!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row" style="display: inline-block;" >
            <div class="col-md-12 ">
              <div class="x_panel">
                <div class="x_title">
                  <h2>사원 상세 조회<small>${ m.memberName }</small></h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br />
                  <form class="form-horizontal form-label-left" method="post" action="">
                  <input type="hidden" value="${m.memberNo }">
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">프로필사진</label>
                      <div class="col-md-9 col-sm-9 ">
                        <span class="image"><img src="${pageContext.request.contextPath}/resources/profile_modify/${m.profileModify } " style="width:30%; margin-bottom:3%;" /></span>
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">이름</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" readonly="readonly" value="${ m.memberName }">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">소속</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" readonly="readonly" value="${ m.department }">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">직위</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" readonly="readonly" value="${ m.position }">
                      </div>
                    </div>
                     <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">사번</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" readonly="readonly" value="${ m.empNo }">
                      </div>
                    </div>
                     <div class="form-group row ">
                      <label class="control-label col-md-3 col-sm-3 ">사내 전화</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control"  id="extension" value="${ m.extension }">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">입사일</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" readonly="readonly" value="${ m.enrollday }">
                      </div>
                    </div>
                     <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">개인이메일</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" readonly="readonly" value="${ m.email }">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">휴대전화</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" readonly="readonly" value="${ m.phone }">
                      </div>
                    </div>
                   
                   
                    <div class="form-group row ">
                      <label class="control-label col-md-3 col-sm-3 ">주소</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control"  readonly="readonly" value="${ m.address }">
                      </div>
                    </div>
                    <div class="form-group row ">
                      <label class="control-label col-md-3 col-sm-3 ">생년월일</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control"  readonly="readonly" value="${ m.birth }">
                      </div>
                    </div>
                    <div class="form-group row ">
                      <label class="control-label col-md-3 col-sm-3 ">퇴사일</label>
                      <div class="checkbox">
                        <label>
                          <input type="text" readonly class="form-control" value="${ m.retireday }"> 
                        </label>
                      </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-9 col-sm-9  offset-md-3">
                        <button id="updateBtn" class="btn btn-success">확인</button>
                        <button type="button" class="btn btn-success" onclick="location.href='memberList.me'">목록</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
			<script>
				$(function(){
					if("${m.retireday}" == null){
						$("#retirecheck").attr("checked", true);
					}
				});
				
				
				$(function(){
					$("#updateBtn").click(function(){
						if($("#extension").val().trim().length != 0){
							$.ajax({
								url:"update.me",
								data:{extension:$("#extension").val(),
									  mno : ${m.memberNo}},
								type:"post",
								success : function(result){
									console.log("ajax 실패");
									if(result > 0){
										$("#extension").val();
									}
								}, error:function(){
									console.log("ajax 실패");
								}
							});
						}
					});
				});
				
				
			
			</script>

        <!-- /page content -->
          <!-- footer content -->
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