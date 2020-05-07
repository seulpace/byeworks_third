package com.dadada.byeworks.bizAddress.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.bizAddress.model.vo.BizAddress;
import com.dadada.byeworks.bizAddress.model.vo.BizAddressFav;
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
	
	// 업체 주소 전체 조회
	ArrayList<BizAddress> selectBizAddrList(int memberNo);
	
	// 그룹 별 업체 주소 조회
	ArrayList<BizAddress> selectBizListGroup(int memberNo, int groupNo);
	
	// 업체 주소 북마크
	int bookmarkBizAddr(BizAddressFav af);
	
	// 업체 주소 북마크 제거
	int removeBookmarkBizAddr(BizAddressFav af);
}
