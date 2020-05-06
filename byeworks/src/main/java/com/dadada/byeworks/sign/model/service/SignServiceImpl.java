package com.dadada.byeworks.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dao.SignDao;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;
import com.dadada.byeworks.sign.model.dto.SignAndAnnualSign;
import com.dadada.byeworks.sign.model.dto.SignAndQuit;
import com.dadada.byeworks.sign.model.vo.SignAttachment;
import com.dadada.byeworks.sign.model.vo.SignLine;
import com.dadada.byeworks.sign.model.vo.SignRefer;

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
	
	//연차 결재 등록-------------------------------------------
	/**
	 * 연차 결재 등록 메소드(여러가지방법으로 해보는중. controller에서부터 각 요청을 쪼개서 하는지 아니면 Dao에서 쪼개서 하는지)
	 */
	@Override
	public int insertSignAnnual(SignAndAnnualSign signAndAnnualSign, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist) {

		return sDao.insertSignAnnual(sqlSession, signAndAnnualSign, slist, rlist, alist);
	}

	//사직 결재 등록---------------------------------------------
	
	/**
	 * 결재테이블 등록 메소드
	 */
	@Override
	public int insertSignQ(SignAndQuit signAndQuit) {
		 
		return sDao.insertSignQ(sqlSession, signAndQuit);
	}

	/**
	 * 사직테이블 등록 메소드
	 */
	@Override
	public int insertQuit(SignAndQuit signAndQuit) {
		
		return sDao.insertQuit(sqlSession, signAndQuit);
	}

	/**
	 * 결재자테이블 등록 메소드
	 */
	@Override
	public int insertSignLineList(SignLine slist) {
		
		return sDao.insertSignLineList(sqlSession, slist);
	}

	/**
	 * 참조자테이블 등록 메소드
	 */
	@Override
	public int insertReferList(SignRefer rlist) {
		
		return sDao.insertReferList(sqlSession, rlist);
	}

	/**
	 * 첨부파일 테이블 등록 메소드
	 */
	@Override
	public int insertAttachmentList(ArrayList<SignAttachment> alist) {
		
		return sDao.insertAttachmentList(sqlSession, alist);
	}

	

}
