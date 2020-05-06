package com.dadada.byeworks.sign.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;

@Repository //데이터 CRUD관련한 객체의 빈
public class SignDao {

	public ArrayList<DepartmentDto> selectDepartmentList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("signMapper.selectDepartmentList");
	}

	public ArrayList<Member> selectEmpList(SqlSessionTemplate sqlSession, int departmentNo) {
		
		System.out.println(departmentNo);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectEmpList", departmentNo);
	}

}
