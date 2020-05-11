package com.dadada.byeworks.work.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dadada.byeworks.work.model.dao.AnnualDao;
import com.dadada.byeworks.work.model.vo.Annual;

@Service("annService")
public class AnnualServiceImpl implements AnnualService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AnnualDao annDao;
	
	@Override
	public ArrayList<Annual> annualUseList(String annualUseDay) {
		//System.out.println(annualUseDay);
		return annDao.annualUseList(sqlSession, annualUseDay);
	}

	
}
