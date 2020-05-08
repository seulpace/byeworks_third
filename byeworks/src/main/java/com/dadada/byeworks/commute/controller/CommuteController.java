package com.dadada.byeworks.commute.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dadada.byeworks.commute.model.service.CommuteService;
import com.dadada.byeworks.commute.model.vo.Commute;
import com.google.gson.Gson;
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
}
