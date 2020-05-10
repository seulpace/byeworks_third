package com.dadada.byeworks.commute.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.commute.model.vo.Commute;

public interface CommuteService {

	// 날짜별 직원 출퇴근 조회하기
	ArrayList<Commute> commuteList(String commuteDateStr);
	
	// 내 출퇴근 조회하기
	ArrayList<Commute> myCommute(int commuteMember, String commuteDay);
}
