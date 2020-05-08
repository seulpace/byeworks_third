package com.dadada.byeworks.commute.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dadada.byeworks.commute.model.service.CommuteService;
import com.dadada.byeworks.commute.model.vo.Commute;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;

	@RequestMapping("commuteList.co")
	public String commuteList(Model model) {
		
		ArrayList<Commute> list = cService.commuteList();
		
		
		model.addAttribute("list", list);
		return "commute/employeeCommute";
	}
	
}
