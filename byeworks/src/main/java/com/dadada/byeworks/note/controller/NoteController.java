package com.dadada.byeworks.note.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dadada.byeworks.member.model.dto.MemberAddress;
import com.dadada.byeworks.member.model.service.MemberService;
import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.note.model.service.NoteService;
import com.dadada.byeworks.note.model.vo.Note;

@Controller
public class NoteController {
	
	@Autowired
	private NoteService ntService; 
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("selectList.not")
	public ModelAndView selectNoteList(ModelAndView mv, HttpSession session) {
		
		// 로그인 한 유저의 pk
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// 내가 받은 리스트
		ArrayList<Note> receiveList = ntService.receiveList(no);
		// 내가 보낸 리스트
		ArrayList<Note> sendList = ntService.sendList(no);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for(Note n : receiveList) {
			n.setSendDateStr(sdf.format(n.getSendDate()));
		}
		for(Note n : sendList) {
			n.setSendDateStr(sdf.format(n.getSendDate()));
		}
		 
		mv.addObject("receiveList", receiveList).addObject("sendList", sendList);
		mv.setViewName("note/note");
		return mv;
	}
	
	@RequestMapping("sendForm.not")
	public ModelAndView sendForm(HttpSession session, ModelAndView mv) {
		
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<MemberAddress> list = mService.selectAddrList(no);
		
		mv.addObject("list", list).setViewName("note/submitNote");
		
		return mv;
	}
}
