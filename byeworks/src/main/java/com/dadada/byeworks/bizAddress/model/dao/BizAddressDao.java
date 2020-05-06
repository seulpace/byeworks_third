package com.dadada.byeworks.bizAddress.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.bizAddress.model.vo.BizAddress;
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
	
	// 업체 주소록 전체 조회
	public ArrayList<BizAddress> selectBizAddrList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("bizAddressMapper.selectBizAddrList", memberNo);
	}

	public ArrayList<BizAddress> selectBizListGroup(SqlSessionTemplate sqlSession, int memberNo, int groupNo){
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("memberNo", memberNo);
		map.put("groupNo", groupNo);
		
		return (ArrayList)sqlSession.selectList("bizAddressMapper.selectBizListGroup", map);
	}
}
