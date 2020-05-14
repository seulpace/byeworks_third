package com.dadada.byeworks.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dadada.byeworks.alarm.model.service.AlarmService;
import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.notice.model.service.NoticeService;
import com.dadada.byeworks.notice.model.vo.Notice;
import com.dadada.byeworks.schedule.model.service.ScheduleService;
import com.dadada.byeworks.schedule.model.vo.Schedule;

@Controller
public class MainController {

	// 공지사항 조회를 하기 위해
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private ScheduleService sService;
	
	@Autowired
	private AlarmService alService;
	
	/**
	 * 이슬희: 메인 가는 메서드
	 * @return
	 */
	@RequestMapping("main.do")
	public ModelAndView goMain(ModelAndView mv, HttpSession session) {
		
		// 공지사항 조회
		ArrayList<Notice> nList = nService.selectMainList();
		mv.addObject("nList", nList);
		
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// 일정 조회
		ArrayList<Schedule> sList = sService.selectMainList(no);
		mv.addObject("sList", sList);
		
		// 알람 개수 조회
		int alarmCount = alService.countAlarm(no);
		session.setAttribute("alarmCount", alarmCount);
		
		mv.setViewName("main");
		
		return mv;
	}
	
	/**
	 * 이슬희: 로그인 화면 가는 메서드
	 * @return
	 */
	@RequestMapping("login.do")
	public String goLogin() {
		return "login/login";   
	}
	
	/**
	 * 이슬희: 에러페이지 여는 서블릿
	 * @return
	 */
	@RequestMapping("error.do")
	public String goError() {
		return "common/errorPage";
	}
}
