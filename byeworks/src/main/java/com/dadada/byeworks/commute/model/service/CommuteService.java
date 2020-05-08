package com.dadada.byeworks.commute.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.commute.model.vo.Commute;

public interface CommuteService {

	
	// 직원 출퇴근 조회하기
	ArrayList<Commute> commuteList();
}
