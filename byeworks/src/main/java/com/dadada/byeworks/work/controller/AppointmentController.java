package com.dadada.byeworks.work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dadada.byeworks.member.model.service.MemberService;
import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.AppointmentDto;
import com.dadada.byeworks.sign.model.service.SignService;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class AppointmentController {
	@Autowired
	private SignService sService;
	@Autowired
	private MemberService mService;

	/** 김다흰 : 발령 내역 조회
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("appointmentList.adto")
	public ModelAndView selectAppointmentList(HttpSession session, ModelAndView mv) {
		
		ArrayList<Integer> list1 = new ArrayList();
		list1.add(2);
		list1.add(3);
		 
		ArrayList<Integer> list2 = new ArrayList();
		list2.add(4);
		list2.add(5);
		
		ArrayList<Integer> list3 = new ArrayList();
		list3.add(6);
		list3.add(7);
		
		
		ArrayList<AppointmentDto> appList1 = sService.selectAppointmentList(list1);
		ArrayList<AppointmentDto> appList2 = sService.selectAppointmentList(list2);
		ArrayList<AppointmentDto> appList3 = sService.selectAppointmentList(list3);
		mv.addObject("appList1", appList1);
		mv.addObject("appList2", appList2);
		mv.addObject("appList3", appList3);
		mv.setViewName("work/appointmentList");
		
		return mv;
		
	}

	
	/** 김다흰 : 발령서 작성 페이지 이동
	 * @return
	 */
	@RequestMapping("appointmentForm.adto")
	public String appointmentForm() {
		
		return "work/appointmentForm";
	}


	/** 김다흰 : 이름 검색시 사번 정보
	 * @param memberName
	 * @param response
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping(value="searchMemberName.me")
	public void searchMemberName(String memberName, HttpServletResponse response) throws JsonIOException, IOException {
		
		
		ArrayList<Member> list = mService.searchMemberName(memberName);
		
		response.setContentType("application/json; charset=utf-8");
		
	
		new Gson().toJson(list, response.getWriter());
	}
	
	
	@RequestMapping("appointment.app")
	public ModelAndView appointmentInsert(ModelAndView mv, AppointmentDto appd) {
		
	
		if(appd.getAppointLev() == 0 && appd.getDeptAfter() == 9) {
			
		   int num1 = appd.getDeptBefore(); 
		   appd.setDeptAfter(num1);
		   
		}else if(appd.getAppointLev() == 1 && appd.getPositionAfter() == 9) {
			int num2 = appd.getPositionBefore();
			appd.setPositionAfter(num2);
		}
		mv.addObject("type", "A").setViewName("work/directEnrollForm");
		mv.addObject("appd", appd).setViewName("work/directEnrollForm");
		
		
		System.out.println(appd);
		return mv;
	}

}
