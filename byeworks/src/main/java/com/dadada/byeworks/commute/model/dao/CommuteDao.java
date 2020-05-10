package com.dadada.byeworks.commute.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.commute.model.vo.Commute;

@Repository
public class CommuteDao {

	// 김다흰
	// 직원 일별 출퇴근 조회
	public ArrayList<Commute> commuteList(SqlSessionTemplate sqlSession, String commuteDateStr){
		
		return (ArrayList)sqlSession.selectList("commuteMapper.commuteList", commuteDateStr);
	}
	
	
	// 김다흰
	// 내 출퇴근 조회
	public ArrayList<Commute> myCommute(SqlSessionTemplate sqlSession, int commuteMember, String commuteDay){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("commuteMember", commuteMember);
		map.put("commuteDate", commuteDay);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.myCommute", map);
	}

}
