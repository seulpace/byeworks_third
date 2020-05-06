package com.dadada.byeworks.bizAddress.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.bizAddress.model.vo.BizGroup;

public interface BizAddressService {
	
	// 그룹 리스트 조회
	ArrayList<BizGroup> selectGroupList();

	// 그룹 추가
	int insertGroup(int memberNo, String groupName);
	
	// 그룹명 수정
	int updateGroup(int gno, String groupName);
	
	// 그룹 삭제
	int deleteGroup(int gno);
}
