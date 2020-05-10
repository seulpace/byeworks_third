package com.dadada.byeworks.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dadada.byeworks.notice.model.service.NoticeService;

@Controller
public class MainController {

	// 공지사항 조회를 하기 위해
	@Autowired
	private NoticeService nService;
	
	/**
	 * 이슬희: 메인 가는 메서드
	 * @return
	 */
	@RequestMapping("main.do")
	public String goMain() {
		
		// 공지사항 조회
		
		
		return "main";
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
	
	//주석테스트!!
}
