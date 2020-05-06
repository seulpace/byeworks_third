package com.dadada.byeworks.bizAddress.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.bizAddress.model.vo.BizGroup;

@Repository
public class BizAddressDao {
	
	// 그룹 전체 조회
	public ArrayList<BizGroup> selectGroupList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bizAddressMapper.selectGroupList");
	}
	
	// 그룹 추가
	public int insertGroup(SqlSessionTemplate sqlSession, int memberNo, String groupName) {
		BizGroup bg = new BizGroup();
		bg.setMemberNo(memberNo);
		bg.setGroupName(groupName);
		
		return sqlSession.insert("bizAddressMapper.insertGroup", bg);
	}
	
	// 그룹명 수정
	public int updateGroup(SqlSessionTemplate sqlSession, int gno, String groupName) {
		BizGroup bg = new BizGroup();
		bg.setGroupNo(gno);
		bg.setGroupName(groupName);
		
		System.out.println(gno + ", " + groupName);
		
		return sqlSession.update("bizAddressMapper.updateGroup", bg);
	}
	
	// 그룹 삭제
	public int deleteGroup(SqlSessionTemplate sqlSession, int gno) {
		return sqlSession.update("bizAddressMapper.deleteGroup", gno);
	}

}
