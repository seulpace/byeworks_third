package com.dadada.byeworks.sign.controller;




import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;
import com.dadada.byeworks.sign.model.dto.SignAndQuit;
import com.dadada.byeworks.sign.model.service.SignService;
import com.dadada.byeworks.sign.model.vo.AnnualSign;
import com.dadada.byeworks.sign.model.vo.Appointment;
import com.google.gson.Gson;

@Controller
public class SignController {
	@Autowired
	private SignService sService;
	
	@RequestMapping("enrollForm.si")
	public String enrollSignForm() {
		
		return "sign/enrollSignForm";
	}
	
	@RequestMapping("insetSignQuit.si")
	public String enrollSign(SignAndQuit signAndQuit) {
		
		System.out.println(signAndQuit);

		
		return "sign/totalSignList";
	}

	@RequestMapping("insertSignAnnual.si")
	public String enrollSign(AnnualSign annualSign) {
		
		return "sign/totalSignList";
	}
	
	@RequestMapping("insertSignAppointment.si")
	public String enrollSign(Appointment Appointment) {
		
		return "sign/totalSignList";
	}


	
	
	@RequestMapping("totalSignList.si")
	public String totalSignList() {
		
		return "sign/totalSignList";
	}
	
	
	
	@RequestMapping("waitingSignList.si")
	public String waitingSignList() {
		
		return "sign/waitngSignList";
	}
	
	@RequestMapping("progressingSignList.si")
	public String progressingSignList() {
		
		return "sign/progressingSignList";
		
	}
	
	@RequestMapping("referSignList.si")
	public String referSignList() {
		
		return "sign/referSignList";
	}
	
//	@RequestMapping("selectSignList.si")
//	public String selectSignList(int status) {
//		
//		String url = "";
//		
//		if(status == 0) {
//			
//			url = "sign/confirmedSignList";
//			
//		}else if(status == 1){
//			
//			url = "sign/returnSignList";
//			
//		}else if(status == 2){
//			
//			url = "sign/cancelSignList";
//			
//		}
//		
//		return url;
		

//	} --> 이렇게 하게되면 메뉴바에 누른 상태 화면 표시 안됨. 매개변수넘겨서 안하고 각각의 url mapping 값 따로줌.
	
	@RequestMapping("confirmedSignList.si")
	public String selectSignList() {
		return "sign/confirmedSignList";
	}
	
	@RequestMapping("returnSignList.si")
	public String returnSignList() {
		return "sign/returnSignList";
	}
	
	@RequestMapping("cancelSignList.si")
	public String cancelSignList() {
		return "sign/cancelSignList";
	}
	
	@RequestMapping("doSignList.si")
	public String doSignList() {
		return "sign/doSignList";
	}
	
	@ResponseBody
	@RequestMapping(value="selectDepartmentList.si", produces="application/json; charset=utf-8")
	public String selectDepartmentList() {
		
		ArrayList<DepartmentDto> list = sService.selectDepartmentList();
		
	
		
		Gson gson= new Gson();
		
		return gson.toJson(list);
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectEmpList.si", produces="application/json; charset=utf-8")
	public String selectEmpList(int departmentNo) {
		
		System.out.println(departmentNo);
		ArrayList<Member> list = sService.selectEmpList(departmentNo);
		
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
}
