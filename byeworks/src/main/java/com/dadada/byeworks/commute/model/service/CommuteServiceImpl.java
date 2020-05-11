package com.dadada.byeworks.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dadada.byeworks.commute.model.dao.CommuteDao;
import com.dadada.byeworks.commute.model.vo.Commute;

@Service("cService")
public class CommuteServiceImpl implements CommuteService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommuteDao cDao;
	
	// 김다흰
	// 직원 출퇴근 조회하기
	@Override
	public ArrayList<Commute> commuteList(String commuteDateStr) {
		
		
		return cDao.commuteList(sqlSession, commuteDateStr);
	}

	// 김다흰
	// 내 출퇴근 조회하기
	@Override
	public ArrayList<Commute> myCommute(int commuteMember, String commuteDateStr) {

		
		return cDao.myCommute(sqlSession, commuteMember,commuteDateStr);
	}
	
	// 김다흰
	// 직원 지각 조회하기
	@Override
	public ArrayList<Commute> lateCommuteList(String commuteDateStr) {

		return cDao.lateCommuteList(sqlSession, commuteDateStr);
	}
	
	
	
}
