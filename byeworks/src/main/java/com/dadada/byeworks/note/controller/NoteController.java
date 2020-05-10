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
	
	@RequestMapping("selectList.nt")
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
	
	@RequestMapping("sendForm.nt")
	public ModelAndView sendForm(HttpSession session, ModelAndView mv, String receiveNo, String receiveName) {
		
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<MemberAddress> list = mService.selectAddrList(no);
		
		// 사내 주소록에서 눌렀을 경우 받는 사람 번호와 받는 사람 이름이 입력되어야 한다
		if(receiveNo != null) {
			// 만약 받는 사람 주소가 있을 경우 int형으로 변환
			int rNo = Integer.parseInt(receiveNo);
			
			// session에 담아주기
			session.setAttribute("rNo", rNo);
			session.setAttribute("rName", receiveName);
		}
		
		mv.addObject("list", list).setViewName("note/submitNote");
		
		return mv;
	}
	
	@RequestMapping("send.nt")
	public String sendNote(HttpSession session, Note n) {
		
		int result = ntService.sendNote(n);
		
		String view = "";
		
		if(result > 0) {
			session.setAttribute("sendMsg", "발송되었습니다");
			view = "redirect:selectList.nt";
		} else {
			view = "common/errorPage";
		}
				
		return view;
	}
	
	@RequestMapping("detail.nt")
	public ModelAndView goDetail(String noteNo, ModelAndView mv, HttpSession session) {
		
		Note n = null;
		
		if(noteNo != null) {
			n = ntService.detailNote(Integer.parseInt(noteNo));
			
			// 만약 쪽지의 정보를 가져왔는데
			// 그 쪽지의 받는 사람 번호와 내 번호가 동일하면 읽은 거니까 그때 읽음으로 업데이트 처리
			if(n.getReceiveNo() == ((Member)session.getAttribute("loginUser")).getMemberNo()) {
				ntService.updateReadcheck(n);
			}
		}
		
		mv.addObject("n", n).setViewName("note/detailNote");
		
		return mv;
	}
}
