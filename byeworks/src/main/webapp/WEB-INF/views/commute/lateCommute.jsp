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
          
          <div class="col-md-6 col-sm-6  ">
            <h2>지각 월별 조회</h2>
              <div class="x_title">

                <div class="clearfix"></div>
                
              </div>
              <div class="x_content">
                <div class="col-md-7 col-sm-7" style="float:right">
                 <div>
	                <select class="form-control-sm" id="commuteLateYear" name="commuteLateYear">
	                     <option class="dropdown-item"  value="">년도</option>
		                 <option class="dropdown-item"  value="2020">2020</option>
		                 
		             </select> 
	                 <select class="form-control-sm" id="commuteLate" name="commuteLate">
		                 <option class="dropdown-item"  value="">월</option>
		                 <option class="dropdown-item"  value="01">1월</option>
		                 <option class="dropdown-item"  value="02">2월</option>
		                 <option class="dropdown-item"  value="03">3월</option>
		                 <option class="dropdown-item"  value="04">4월</option>
		                 <option class="dropdown-item"  value="05">5월</option>
		                 <option class="dropdown-item"  value="06">6월</option>
		                 <option class="dropdown-item"  value="07">7월</option>
		                 <option class="dropdown-item"  value="08">8월</option>
		                 <option class="dropdown-item"  value="09">9월</option>
		                 <option class="dropdown-item"  value="10">10월</option>
		                 <option class="dropdown-item"  value="11">11월</option>
		                 <option class="dropdown-item"  value="12">12월</option>
	                </select> 
		                           
	              </div>	
                </div>

                <table class="lateTable">
                  <thead>
                    <tr>
                      <th>이름</th>
                      <th>사번</th>
                      <th>부서</th>
                      <th>직책</th>
                      <th>지각횟수</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                    
                  </tbody>
                </table>

                <canvas id="lineChart"></canvas>

              </div>  

          <div class="clearfix"></div>

        </div>
        <!-- /page content -->
        <!-- footer content -->
        <jsp:include page="../common/footer.jsp"/>
        
      </div>
    </div>
    <script>
    
    $(function(){
		
		$("#commuteLate").change(function(){
			var commuteLateDay = $("select[id='commuteLateYear']").val() + '/' + $("select[id='commuteLate']").val();
			
			console.log(commuteDay);
			
			$.ajax({
				url:"myCommute.co",
				data:{"commuteLateDay":commuteLateDay},
				type:"get",
				success:function(list){
					var value = "";
					$.each(list, function(i, obj){
						value += "<tr>" +
		    	                      "<th scope="row">" + obj.empName + "</th>" + 
		    	                      "<td>" + obj.empNos + "</td>" + 
		    	                      "<td>" + obj.empDept + "</td>" + 
		    	                      "<td>" + obj.empPos + "</td>" +
		    	                      "<td>" + obj.commuteAnnual + "</td>" + 
		    	                    "</tr>";
		    						
					});
					$("#lateTable tbody").html(value);
				}, error:function(){
					console.log("통신실패");
				}
			});
		});
	});
    </script>
    <!-- 메인 틀을 구성하기 위한 JS 추가 코드 -->
	<!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/basic/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
	
</body>
</html>