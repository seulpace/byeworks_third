<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- daygrid -->
    <link href="${pageContext.request.contextPath}/resources/css/daygrid/main.css" rel="stylesheet">
    <!-- timegrid -->
    <link href="${pageContext.request.contextPath}/resources/css/timegrid/main.css" rel="stylesheet">

    <!-- <script src='../packages/core/main.js'> -->
    <script src="${pageContext.request.contextPath}/resources/js/core/main.js"></script>
    <!-- <script src='../packages/core/locales/ko.js'></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/core/locales/ko.js"></script>
    <!-- <script src='../packages/interaction/main.js'></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/dateJS/date.js"></script>
    <!-- <script src='../packages/daygrid/main.js'></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/daygrid/main.js"></script>
    <!-- <script src='../packages/timegrid/main.js'></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/timegrid/main.js"></script>
    
        <!-- <script src='../packages-premium/resource-common/main.js'></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/resource-common/main.js"></script>
        <!-- <script src='../packages-premium/resource-daygrid/main.js'></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/resource-daygrid/main.js"></script>
        <!-- <script src='../packages-premium/resource-timegrid/main.js'></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/resource-timegrid/main.js"></script>









<style>
        .checkbox-container{
        margin-top: 7px;
      	}
		input[type="radio"] {
		    display:none;
		}
		
		input[type="radio"] + label {
		    color:black;
		    font-family:Arial, sans-serif;
		}
		
		input[type="radio"] + label span {
		    display:inline-block;
		    width:19px;
		    height:19px;
		    margin:-2px 10px 0 0;
		    vertical-align:middle;
		    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -38px top no-repeat;
		    cursor:pointer;
		}
		
		input[type="radio"]:checked + label span {
		    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -57px top no-repeat;
		}
		body {
		    margin: 0;
		    padding: 0;
		    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		    font-size: 14px;
		  }
	
		  #calendar {
		    max-width: 80%;
		    margin: 50px auto;
		  }
		
</style>
<script>

  document.addEventListener('DOMContentLoaded', function() {



    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'resourceDayGrid', 'resourceTimeGrid' ],
      //라이센스따온거 이거는 근데 어쩔수없음 ㅠ
      schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
      defaultView: 'resourceTimeGridDay',
      // 날짜 초기값
      defaultDate: new Date(),
      // '2020-02-07'
      editable: false,
      selectable: true,
      eventLimit: true, // allow "more" link when too many events
      locale:'ko',
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'resourceTimeGridDay,resourceTimeGridTwoDay,timeGridWeek,dayGridMonth'
      },
      views: {
        resourceTimeGridTwoDay: {
           type: 'resourceTimeGrid',
          duration: { days: 2 },
           buttonText: '2 days',
        }
      },

      //// uncomment this line to hide the all-day slot
      //allDaySlot: false,

      resources: [
        { id: 'a', title: 'A 회의실' },
        { id: 'b', title: 'B 회의실', eventColor: 'green' },
        // { id: 'c', title: 'Room C', eventColor: 'orange' },
        // { id: 'd', title: 'Room D', eventColor: 'red' }
      ],
      events: [
        { id: '1', resourceId: 'a', start: '2020-02-06', end: '2020-02-08', title: 'event 1' },
        { id: '2', resourceId: 'a', start: '2020-05-07 09:00:00', end: '2020-05-07 14:00:00', title: 'event 2' },
        { id: '3', resourceId: 'b', start: '2020-05-07 12:00:00.0', end: '2020-05-08 06:00:00.0', title: 'event 3' },
        { id: '4', resourceId: 'b', start: '2020-04-26 12:00:00.0', end: '2020-04-27 06:00:00.0', title: 'event 4' },
        // { id: '4', resourceId: 'c', start: '2020-02-07T07:30:00', end: '2020-02-07T09:30:00', title: 'event 4' },
        // { id: '5', resourceId: 'd', start: '2020-02-07T10:00:00', end: '2020-02-07T15:00:00', title: 'event 5' }
      ],

      select: function(arg) {
        console.log(
          'select',
          arg.startStr,
          arg.endStr,
          arg.resource ? arg.resource.id : '(no resource)'
        );
      },
      dateClick: function(arg) {
        console.log(
          'dateClick',
          arg.date,
          arg.resource ? arg.resource.id : '(no resource)'
        );
      }
    });

    calendar.render();
  });

</script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>


<!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row" style="display: inline-block;" >
            <div id='calendar'></div>
            
          </div>
<!-- ㅊㅊ -->

<div class="x_panel">
  <div class="x_title">
    <h2>회의실 예약하기</h2>
    <ul class="nav navbar-right panel_toolbox">
      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
      </li>
      <li><a class="close-link"><i class="fa fa-close"></i></a>
      </li>
    </ul>
    <div class="clearfix"></div>
  </div>
  <div class="x_content">
    <form class="" action="" method="post" novalidate="">

      <p>회의실 예약 시간은<code> 꼭! 시간 단위로</code> 예약해주세요</p>

      <span class="section">Personal Info</span>
      <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">예약자 이름<span class="required">*</span></label>
        <div class="col-md-6 col-sm-6">
          <input class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="로그인한 직원이름"" required="required">
        </div>
      </div>

      <!-- <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">회의실 명 및 위치*</label>
        <div class="col-md-6 col-sm-6 ">
          <select class="form-control">
            <option>3층 A회의실</option>
            <option>2층 B회의실</option>
          </select>
        </div>
      </div> -->

      <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">회의실 명 및 위치*</label>
        <div class="col-md-6 col-sm-6 ">
            <div class="checkbox-container">

              <input type="radio" id="r1" name="rr" />
              <label for="r1"><span></span>A회의실</label>
              <input type="radio" id="r2" name="rr" />
              <label for="r2"><span></span>B회의실</label>

            </div>
        </div>
      </div>



      <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">인원수 <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6">
          <input class="form-control" type="number" name="number" required="required"></div>
      </div>

      <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">날짜<span class="required">*</span></label>
        <div class="col-md-6 col-sm-6">
          <input class="form-control" type="date" name="date" required="required"></div>
      </div>
      <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">시간<span class="required">*</span></label>
        <div class="col-md-6 col-sm-6">
          <input type="time" name="time" required="required">
          <span> ~ </span>
          <input type="time" name="time" required="required">
        </div>
      </div>

<!-- 추가 -->
      <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">시간<span class="required">*</span></label>
        <div class="col-md-6 col-sm-6">

              <div class="fl">
                <select id="start" name="startTime" class="select-box" style="width:125px;">
                  <option value="07:00">오전 07:00</option>
                  <option value="07:30">오전 07:30</option>
                  <option value="08:00">오전 08:00</option>
                  <option value="08:30">오전 08:30</option>
                  <option value="09:00">오전 09:00</option>
                  <option value="09:30">오전 09:30</option>
                  <option value="10:00">오전 10:00</option>
                  <option value="10:30">오전 10:30</option>
                  <option value="11:00">오전 11:00</option>
                  <option value="11:30">오전 11:30</option>
                  <option value="12:00">오후 12:00</option>
                  <option value="12:30">오후 12:30</option>
                  <option value="13:00">오후 01:00</option>
                  <option value="13:30">오후 01:30</option>
                  <option value="14:00">오후 02:00</option>
                  <option value="14:30">오후 02:30</option>
                  <option value="15:00">오후 03:00</option>
                  <option value="15:30">오후 03:30</option>
                  <option value="16:00">오후 04:00</option>
                  <option value="16:30">오후 04:30</option>
                  <option value="17:00">오후 05:00</option>
                  <option value="17:30">오후 05:30</option>
                  <option value="18:00">오후 06:00</option>
                </select>
                 ~
                <select id="end" name="endTime" class="select-box" style="width:125px;">
                  <option value="07:30">오전 07:30</option>
                  <option value="08:00">오전 08:00</option>
                  <option value="08:30">오전 08:30</option>
                  <option value="09:00">오전 09:00</option>
                  <option value="09:30">오전 09:30</option>
                  <option value="10:00">오전 10:00</option>
                  <option value="10:30">오전 10:30</option>
                  <option value="11:00">오전 11:00</option>
                  <option value="11:30">오전 11:30</option>
                  <option value="12:00">오후 12:00</option>
                  <option value="12:30">오후 12:30</option>
                  <option value="13:00">오후 01:00</option>
                  <option value="13:30">오후 01:30</option>
                  <option value="14:00">오후 02:00</option>
                  <option value="14:30">오후 02:30</option>
                  <option value="15:00">오후 03:00</option>
                  <option value="15:30">오후 03:30</option>
                  <option value="16:00">오후 04:00</option>
                  <option value="16:30">오후 04:30</option>
                  <option value="17:00">오후 05:00</option>
                  <option value="17:30">오후 05:30</option>
                  <option value="18:00">오후 06:00</option>
                  <option value="18:30">오후 06:30</option>
                </select>
              </div>

        </div>
      </div>
<!-- 추가 -->

      <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">회의 제목*</label>
        <div class="col-md-6 col-sm-6 ">
          <input type="text" class="form-control" placeholder="회의 내용">
        </div>
      </div>








      <div class="field item form-group">
        <label class="col-form-label col-md-3 col-sm-3  label-align">회의 내용<span class="required">*</span>
        </label>
        <!-- 숫자9면 더 커짐  -->
        <div class="col-md-6 col-sm-6 ">
          <textarea class="form-control" rows="3" placeholder="회의내용" style="margin-top: 0px; margin-bottom: 0px; height: 106px;"></textarea>
        </div>
      </div>

    

      <div class="ln_solid">
        <div class="form-group">
          <div class="col-md-6 offset-md-3">
            <br><br>
      <button type="submit" class="btn btn-primary">등록하기</button>
      <button type="reset" class="btn btn-success">취소하기</button>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>




<!-- ㅊㅊ -->
        </div>

        
        <!-- /page content -->


	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>