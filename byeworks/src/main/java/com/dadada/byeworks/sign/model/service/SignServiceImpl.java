package com.dadada.byeworks.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dao.SignDao;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;

@Service
public class SignServiceImpl implements SignService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SignDao sDao;
	
	@Override
	public ArrayList<DepartmentDto> selectDepartmentList() {
		
		ArrayList<DepartmentDto> list = sDao.selectDepartmentList(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<Member> selectEmpList(int departmentNo) {
		
		return sDao.selectEmpList(sqlSession, departmentNo);
	}

}
