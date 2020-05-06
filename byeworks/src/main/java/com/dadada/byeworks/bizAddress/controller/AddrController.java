package com.dadada.byeworks.bizAddress.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dadada.byeworks.bizAddress.model.service.BizAddressService;
import com.dadada.byeworks.bizAddress.model.vo.BizAddress;
import com.dadada.byeworks.bizAddress.model.vo.BizAddressFav;
import com.dadada.byeworks.bizAddress.model.vo.BizGroup;
import com.dadada.byeworks.member.model.vo.Member;

@Controller
public class AddrController {
	
	@Autowired
	private BizAddressService bService;
	
	@RequestMapping("selectList.bzad")
	public ModelAndView selectBizAddrList(HttpSession session, ModelAndView mv) {
		
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// 그룹 전체 조회
		ArrayList<BizGroup> gList = bService.selectGroupList();
		mv.addObject("gList", gList);
		
		// 혹시 그룹으로 조회된 값인지 확인하기
		ArrayList<BizAddress> list = (ArrayList<BizAddress>)session.getAttribute("groupList");
		
		// 있으면
		if(list != null) {
			mv.addObject("list", list);
			// 일단 걘 지워주고
			session.removeAttribute("groupList");
		} else { // 없으면 전체 주소록을 조회해준다
			list = bService.selectBizAddrList(no);
			mv.addObject("list", list);
		}
		
		mv.setViewName("bizAddress/bizAddress");
		
		return mv;
	}
	
	/**
	 * 그룹 전체 조회
	 * @param mv
	 * @return
	 */
	@RequestMapping("selectList.bzgr")
	public ModelAndView selectGroupList(ModelAndView mv) {
		
		ArrayList<BizGroup> list = bService.selectGroupList();
		
		mv.addObject("list", list);
		
		mv.setViewName("bizAddress/bizGroup");
		
		return mv;
	}
	
	/**
	 * 그룹 추가
	 * @param memberNo
	 * @param groupName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("insert.bzgr")
	public String insertGroup(String memberNo, String groupName) {
		
		int result = bService.insertGroup(Integer.parseInt(memberNo), groupName);
		
		return String.valueOf(result);
	}
	
	/**
	 * 그룹명 수정
	 * @param gno
	 * @param groupName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("update.bzgr")
	public String updateGroup(String gno, String groupName) {
		
		int result = bService.updateGroup(Integer.parseInt(gno), groupName);
		
		return String.valueOf(result);
	}
	
	/**
	 * 그룹 삭제
	 * @param gno
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delete.bzgr")
	public String deleteGroup(String gno) {
		System.out.println(gno);
		int result = bService.deleteGroup(Integer.parseInt(gno));
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("group.bzad")
	public String selectBizListGroup(HttpSession session, String groupNo) {
		
		int no = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		ArrayList<BizAddress> groupList = bService.selectBizListGroup(no, Integer.parseInt(groupNo));
		
		// 조회 시에 읽어오려고 넣어준다
		session.setAttribute("groupList", groupList);
		session.setAttribute("groupNo", groupNo);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping("bookmark.bzad")
	public String bookmarkBizAddr(BizAddressFav af) {
		// 받아온 정보를 insert 해준다
		int result = bService.bookmarkBizAddr(af);
		
		return String.valueOf(result);
	}
	

}
