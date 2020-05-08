package com.dadada.byeworks.commute.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.commute.model.vo.Commute;

@Repository
public class CommuteDao {

	public ArrayList<Commute> commuteList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("commuteMapper.commuteList");
	}
	
	
	
}
