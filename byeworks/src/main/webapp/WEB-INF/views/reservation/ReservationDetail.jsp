<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script>
      $(document).ready(function(){
      
      $('tr.breakrow').nextUntil('tr.breakrow').hide();
      
          $('#tableMain').on('click', 'tr.breakrow',function(){
              $('tr.breakrow').nextUntil('tr.breakrow').hide();
              $(this).nextUntil('tr.breakrow').slideDown();
              $('#tableMain').on('dblclick', 'tr.breakrow',function(){
              $(this).nextUntil('tr.breakrow').slideUp();
              });
      });
      });
      
      </script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>



        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="clearfix"></div>

            <div class="  invoice-header">
              <h1>
                            <i class="fa fa-globe"></i> 내가 예약한 현황
              </h1>
            </div>

            <!-- 구분 -->
            <div class="x_content">

              

              <div class="table-responsive">

                <table id="tableMain"  class="table table-striped jambo_table bulk_action">
                  <thead>
                      <tr class="tableheader">
                        <th>회의제목</th>
                        <th>날짜</th>
                        <th> - </th>
                      </tr>
                  </thead>
                  <tbody>
            
                  <tr class="breakrow">
                    <td>코로나로인한 휴가</td>
                    <td>2020-02-17</td>
                    <td><button type="submit" class="btn btn-success">취소하기</button></td>
                  </tr>
                  <tr>
                      <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">사용시간 13:00 ~ 17:00 </td>
                  </tr>
                  <tr>
                    <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">
                      <div id="bor">회의실 위치 : 3층 A회의실</div>
                    </td>
                  </tr>
                  <tr>
                    <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">
                      <div id="bor">회의실 내용</div>
                      <br>
                      코로나로인한 어쩌구저쩌구
                    </td>
                  </tr>

                  <tr class="breakrow">
                    <td>코로나로인한 휴가</td>
                    <td>2020-02-17</td>
                    <td><button type="submit" class="btn btn-success">취소하기</button></td>
                  </tr>
                  <tr>
                      <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">사용시간 13:00 ~ 17:00 </td>
                  </tr>
                  <tr>
                    <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">
                      <div id="bor">회의실 위치 : 3층 A회의실</div>
                    </td>
                  </tr>
                  <tr>
                    <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">
                      <div id="bor">회의실 내용</div>
                      <br>
                      코로나로인한 어쩌구저쩌구
                    </td>
                  </tr>

                  <tr class="breakrow">
                    <td>코로나로인한 휴가</td>
                    <td>2020-02-17</td>
                    <td><button type="submit" class="btn btn-success">취소하기</button></td>
                  </tr>
                  <tr>
                      <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">사용시간 13:00 ~ 17:00 </td>
                  </tr>
                  <tr>
                    <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">
                      <div id="bor">회의실 위치 : 3층 A회의실</div>
                    </td>
                  </tr>
                  <tr>
                    <td id="pop" colspan="3" style="font-weight:bold; background-color: white;">
                      <div id="bor">회의실 내용 : </div>
                      <br>
                      코로나로인한 어쩌구저쩌구
                    </td>
                  </tr>

                  
                              
                                 
              </table>


              </div>
        
      
            </div>
          </div>
        </div>
        <!-- /page content -->

	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>