package com.dadada.byeworks.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@RequestMapping("list.not")
	public String goNotice() {
		return "notice/NoticeListView";
	}
}
