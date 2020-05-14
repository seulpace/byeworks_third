package com.dadada.byeworks.alarm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dadada.byeworks.alarm.model.service.AlarmService;
import com.dadada.byeworks.alarm.model.vo.Alarm;
import com.dadada.byeworks.member.model.vo.Member;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService alService;

	@RequestMapping("go.al")
	public ModelAndView selectList(HttpSession session, ModelAndView mv) {
		
		// 나한테 온 알람만 봐야 하니까 ^^
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		ArrayList<Alarm> aList = alService.selectNoteList(no);
		
		// 받아온 쪽지의 날짜를 영어로 표현하기 위해
		SimpleDateFormat sdf = new SimpleDateFormat("MMM-dd", Locale.ENGLISH);
		for(Alarm a : aList) {
			String newDate = sdf.format(a.getAlarmDate());
			
			a.setSendMonth(newDate.substring(0, newDate.lastIndexOf("-")));
			a.setSendDate(newDate.substring(newDate.lastIndexOf("-")+1));			
		}
		
		mv.addObject("aList", aList);
		mv.setViewName("alarm/alarm");
		
		return mv;
	}
	
	@RequestMapping("deleteAll.al")
	public String deleteAllNote(HttpSession session) {
		
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int result = alService.deleteAllNote(no);
		
		if(result > 0) {
			return "redirect:/go.al";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteOne.al")
	public String deleteOneNote(HttpSession session, String alarmNo) {
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int result = alService.deleteOneNote(Integer.parseInt(alarmNo));
		
		if(result > 0) {
			return "redirect:/go.al";
		} else {
			return "common/errorPage";
		}
	}
}
