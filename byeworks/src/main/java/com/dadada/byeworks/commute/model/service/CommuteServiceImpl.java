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
	@Override
	public ArrayList<Commute> commuteList(String commuteDateStr) {
		
		
		return cDao.commuteList(sqlSession, commuteDateStr);
	}

	@Override
	public ArrayList<Commute> myCommute(int commuteMember, String commuteDay) {

		
		return cDao.myCommute(sqlSession, commuteMember, commuteDay);
	}
	
	
	
}
