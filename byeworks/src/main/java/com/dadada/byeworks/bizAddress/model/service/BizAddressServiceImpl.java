package com.dadada.byeworks.bizAddress.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dadada.byeworks.bizAddress.model.dao.BizAddressDao;
import com.dadada.byeworks.bizAddress.model.vo.BizGroup;

@Service("bService")
public class BizAddressServiceImpl implements BizAddressService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BizAddressDao bDao;

	/**
	 * 그룹 전체 조회
	 */
	@Override
	public ArrayList<BizGroup> selectGroupList() {
		return bDao.selectGroupList(sqlSession);
	}

	/**
	 * 그룹 추가
	 */
	@Override
	public int insertGroup(int memberNo, String groupName) {
		return bDao.insertGroup(sqlSession, memberNo, groupName);
	}

	/**
	 * 그룹명 수정
	 */
	@Override
	public int updateGroup(int gno, String groupName) {
		return bDao.updateGroup(sqlSession, gno, groupName);
	}

	/**
	 * 그룹 삭제
	 */
	@Override
	public int deleteGroup(int gno) {
		return bDao.deleteGroup(sqlSession, gno);
	}

}
