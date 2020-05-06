package com.dadada.byeworks.bizAddress.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dadada.byeworks.bizAddress.model.service.BizAddressService;
import com.dadada.byeworks.bizAddress.model.vo.BizGroup;

@Controller
public class AddrController {
	
	@Autowired
	private BizAddressService bService;
	
	@RequestMapping("selectList.bzad")
	public String selectBizAddrList() {
		return "bizAddress/bizAddress";
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
	
	@ResponseBody
	@RequestMapping("insert.bzgr")
	public String insertGroup(String memberNo, String groupName) {
		
		int result = bService.insertGroup(Integer.parseInt(memberNo), groupName);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("update.bzgr")
	public String updateGroup(String gno, String groupName) {
		
		int result = bService.updateGroup(Integer.parseInt(gno), groupName);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("delete.bzgr")
	public String deleteGroup(String gno) {
		System.out.println(gno);
		int result = bService.deleteGroup(Integer.parseInt(gno));
		
		return String.valueOf(result);
	}

}
