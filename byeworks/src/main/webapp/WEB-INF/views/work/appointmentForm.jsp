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
          <div class="row" style="display: inline-block;" >
            <div class="col-md-12 ">
              <div class="x_panel">
                <div class="x_title">
                  <h2>발령</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <br>
                  <form id="appointmentInsert" action="appointment.app" method="post" class="form-horizontal form-label-left" >
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">이름</label>
                      <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-kdh" id="appointmentName" name="appointmentName" style="border-bottom: 1px solid #425b80;">
                      </div>
                      <div class="com-md-2 col-sm-2"></div>
                      <div class="col-md-3 col-sm-3">
                        <button type="button" class="btn btn-primary" id="searchMemberName" data-toggle="modal" data-target=".bs-example-modal-sm">검색</button>
					  </div>
                        <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
                          <div class="modal-dialog modal-sm">
                            <div class="modal-content">
      
                              <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel2"></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                </button>
                              </div>
                              <div class="modal-body" id="empNoList">
	                        	  
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                <button type="button" data-dismiss="modal" id="insertEmpNo" class="btn btn-primary">등록하기</button>
                              </div>
      
                          	</div>
                        	</div>
                     	 </div>
                  	  </div>
                    
                   
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">사번</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-kdh"  id="appEmpno" name="appEmpno" readonly="readonly" value="">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="control-label col-md-3 col-sm-3 ">입사일</label>
                      <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-kdh" id="enrollday" name="enrollday" readonly="readonly" value="">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="department" class="control-label col-md-3 col-sm-3 ">소속</label>
                      <div class="col-md-3 col-sm-3">
                        <input type="text" class="form-kdh" id="departmentName" name="departmentName" readonly="readonly" value="">
                         <input type="hidden" name="deptBefore" id="deptBefore"/>
                      </div>
                      <div class="com-md-2 col-sm-2"></div>
                      <div class="col-md-3 col-sm-3">
                        <select id="deptAfter" name="deptAfter">
                          <option value="9">--------------------</option>
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
                        <div class="col-md-3 col-sm-3">
                          <input type="text" class="form-kdh" readonly="readonly" id="positionName" name="positionName" value="">
                          <input type="hidden" name="positionBefore" id="positionBefore"/>
                        </div>
                        <div class="com-md-2 col-sm-2"></div>
                        <div class="col-md-3 col-sm-3">
                          <select id="positionAfter" name="positionAfter">
                                <option value="9">--------------------</option>
                                <option value="1">임원</option>
                                <option value="2">부장</option>
                                <option value="3">과장</option>
                                <option value="4">사원</option>
                          </select>
                        </div>
                    </div>
                  
                  	<input type="hidden" value="A" name="docType">
                    <input type="hidden" value="" id="appointmentLev" name="appointmentLev">     
                    <input type="hidden" value="" id="appointmentMem" name="appointmentMem">      	
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
		<script>
		 
					
		
		
                    	$(function(){
                    		
                    		$("#searchMemberName").click(function(){
                    			$.ajax({
                    				url:"searchMemberName.me",
                    				data:{"memberName":$("#appointmentName").val()},
                    				type:"get",
                    				success:function(list){
                    					
                    					var value="";
                    					$.each(list, function(i, m){
                    						

        	                                value += '<input type="radio" id="searchMemberNo" name="searchMemberNo" value='+ m.memberNo +'>' +
        	                                		 '<label for="empno">* 사번:</label>' +
        					                		 '<input type="text" class="form-control" id="empno" name="empno" value='+ m.empNo +' readonly><br>';
        					        	
                    					});
                    					$("#empNoList").html(value);
                    				
                    					
                    				},error:function(){
                    					console.log("실패");
                    				}
                    				
                    			});
                    		});
                    		$("#insertEmpNo").click(function(){
                    			if($('input[name="searchMemberNo"]').is(':checked')){
                    				
                    				$.ajax({
                    					url:"retireList.me",
            	        				data:{mno:$('input[name="searchMemberNo"]:checked').val()},
            	        				type:"get",
            	        				success:function(m){
            	        					$("#appointmentMem").val(m.memberNo);
            	        					$("#appEmpno").val(m.empNo);
            	        					$("#enrollday").val(m.enrollday);
            	        					$("#positionName").val(m.position);
            	        					$("#departmentName").val(m.department);
                    						$("#positionBefore").val(m.positionNo);
                    						console.log(m.positionNo);
                    						$("#deptBefore").val(m.departmentNo);
            	        				},error:function(){
            	        					console.log("x");
            	        				}
                    				});
                    				
                    			}
                    		});
                    				
                    		
                    		$("#deptAfter").change(function(){
                        		
                        		$("#appointmentLev").val(0);
                        		
                        	});
                    		$("#positionAfter").change(function(){
                        		
                        		$("#appointmentLev").val(1);
                        	});
                    		
                    		
                    		
                    	});
                    
                    	
                    	
                    
                    </script>
        <!-- footer content -->
        <jsp:include page="../common/footer.jsp"/>
        
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