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
	
	
	@Override
	public ArrayList<Commute> commuteList() {
		
		
		return cDao.commuteList(sqlSession);
	}
	
	
	
}
