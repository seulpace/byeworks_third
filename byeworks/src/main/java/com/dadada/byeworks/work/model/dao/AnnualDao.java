package com.dadada.byeworks.work.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.work.model.vo.Annual;

@Repository
public class AnnualDao {

	// 김다흰
	// 직원 연차 조회
	public ArrayList<Annual> annualUseList(SqlSessionTemplate sqlSession, String annualUseDay){
		
		ArrayList<Annual> arr = (ArrayList)sqlSession.selectList("annualMapper.annualUseList", annualUseDay);
//		System.out.println(arr);
//		System.out.println(annualUseDay);
		return arr;
	}
}
