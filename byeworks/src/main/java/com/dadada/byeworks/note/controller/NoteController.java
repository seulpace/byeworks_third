package com.dadada.byeworks.note.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dadada.byeworks.alarm.model.service.AlarmService;
import com.dadada.byeworks.alarm.model.vo.Alarm;
import com.dadada.byeworks.member.model.dto.MemberAddress;
import com.dadada.byeworks.member.model.service.MemberService;
import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.note.model.service.NoteService;
import com.dadada.byeworks.note.model.vo.Note;
import com.google.gson.Gson;

@Controller
public class NoteController {
	
	@Autowired
	private NoteService ntService; 
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private AlarmService alService;
	
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
	
	// 쪽지 작성하는 폼으로 가는 메서드
	// 사내 주소록에서 쪽지 작성하기, 받은 쪽지함 등에서 쪽지 보내기, 답장하기 등이 해당 메서드를 거친다
	@RequestMapping("sendForm.nt")
	public ModelAndView sendForm(HttpSession session, ModelAndView mv, String receiveNo, String receiveName, String receiveTitle) {
		
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
		
		// 답장하기의 경우에만 title이 들어오기 때문에 re 붙여주기
		if(receiveTitle != null) {
			String rTitle = "RE: " + receiveTitle;
			session.setAttribute("rTitle", rTitle);
		}
		
		mv.addObject("list", list).setViewName("note/submitNote");
		
		return mv;
	}
	
	@RequestMapping("send.nt")
	public String sendNote(HttpSession session, Note n) {
		
		// 쪽지에 insert
		int result = ntService.sendNote(n);
		
		// 쪽지에 넣자마자 쪽지의 가장 큰 시퀀스를 받아오자
		int noteNo = ntService.returnSequence();
		
		// alarm에 insert 해야 한다...
		Alarm a = new Alarm();
		
		// 날짜 받아오기
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		a.setAlarmDate(date);
		a.setAlarmGroup(1);
		a.setGroupNo(noteNo);
		a.setSendNo(n.getSendNo());
		a.setReceiveNo(n.getReceiveNo());
		
		// alarm에 넣어주기
		int result2 = alService.insertAlarm(a);
		
		String view = "";
		
		if(result * result2 > 0) {
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
	
	@ResponseBody
	@RequestMapping(value="cancel.nt", produces="application/json; charset=utf-8")
	public String cancelNote(String no) {
		
		// no를 분리해서 리스트에 담기
		List<String> list = Arrays.asList(no.split("\\s*,\\s*")); 
		
		ArrayList<Integer> intList = new ArrayList<>();
		
		for(String s : list) {
			intList.add(Integer.parseInt(s));
		}
		
		// readCheck를 2로 업데이트 시키기
		ntService.cancelNote(intList);
		
		// 업데이트 한 리스트를 반환하기
		ArrayList<Note> nList = ntService.selectList(intList);
		
		Gson gson = new Gson();
		
		return gson.toJson(nList);
	}
	
	@ResponseBody
	@RequestMapping("delete.nt")
	public String deleteNote(String no, String classStr) {
		// no를 분리해서 리스트에 담기
		List<String> list = Arrays.asList(no.split("\\s*,\\s*")); 
		
		ArrayList<Integer> intList = new ArrayList<>();
		
		for(String s : list) {
			intList.add(Integer.parseInt(s));
		}
		
		int result = ntService.deleteNote(intList, classStr);
		
		return String.valueOf(result);
	}
	
}
