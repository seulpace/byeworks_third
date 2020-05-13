package com.dadada.byeworks.commute.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dadada.byeworks.commute.model.service.CommuteService;
import com.dadada.byeworks.commute.model.vo.Commute;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;

	/** 김다흰 : 직원 출퇴근 페이지 이동
	 * @param model
	 * @return
	 */
	@RequestMapping("commuteList.co")
	public String commuteList() {
		
		return "commute/employeeCommute";
	}
	
	/** 김다흰 : 날짜 선택 전사원 출퇴근 조회
	 * @param commuteDateStr
	 * @param response
	 * @throws IOException 
	 * @throws JsonIOException 
	 */
	@RequestMapping(value="commuteDate.co")
	public void commuteDate(String commuteDateStr, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Commute> list = cService.commuteList(commuteDateStr);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
		
	}
	
	
	/** 김다흰 : 내 출퇴근 페이지 이동
	 * @return
	 */
	@RequestMapping("myCommuteList.co")
	public String myCommuteList() {
		
		return "commute/myCommute";
	}
	
	/** 김다흰 : 내 출퇴근 조회 보기
	 * @param mv
	 * @param session
	 * @return
	 * @throws IOException 
	 * @throws JsonIOException 
	 */
	@ResponseBody
	@RequestMapping(value="myCommute.co", produces="application/json; charset=utf-8")
	public String myCommute(int commuteMember, String commuteDateStr){
		
	
		
		ArrayList<Commute> myCommuteList = cService.myCommute(commuteMember, commuteDateStr);
		
	
	
		return new Gson().toJson(myCommuteList);
	
	}
	
	/** 김다흰 : 월별 지각 조회하기 페이지 이동
	 * @return
	 */
	@RequestMapping("lateCommute.co")
	public String lateCommute() {
		
		return "commute/lateCommute";
	}
	/** 김다흰 : 월별 지각 사원 리스트
	 * @param commuteDateStr
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value= "lateCommuteList.co", produces="application/json; charset=utf-8")
	public String lateCommuteList(String commuteDateStr) {
		ArrayList<Commute> lateCommuteList = cService.lateCommuteList(commuteDateStr);
		
		return new Gson().toJson(lateCommuteList);
		
	}
	
	
}
