package com.dadada.byeworks.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dao.SignDao;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;
import com.dadada.byeworks.sign.model.dto.SignAndAnnualSign;
import com.dadada.byeworks.sign.model.dto.SignAndAppointment;
import com.dadada.byeworks.sign.model.dto.SignAndQuit;
import com.dadada.byeworks.sign.model.dto.SignDto;
import com.dadada.byeworks.sign.model.vo.Sign;
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
	
	//승진/발령 결재 등록-------------------------------------------------------
	@Override
	public int insertSignAp(SignAndAppointment signAndAppointment, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist) {
		
		int result1 = sDao.insertSignAp(sqlSession, signAndAppointment);
		int result2 = sDao.insertAppointment(sqlSession, signAndAppointment);
		int result6 = 0;
		if(result1>0) {
			int result3 = sDao.insertSignLineList(sqlSession, slist);
			
			int result4 = sDao.insertReferList(sqlSession, rlist);
		
			int result5 = sDao.insertAttachmentList(sqlSession, alist);
			
			result6 = result3*result4*result5;
		}

		return result1*result2*result6;
	}

	//결재 리스트 조회(type에 따라 조회해오는 결과틀림)----------------------------------
	@Override
	public ArrayList<Sign> selectSignList(int mno, int type) {
		
		return sDao.selectSignList(sqlSession, mno, type);
	}

	//결재 상세보기 (문서type별)
	@Override
	public SignAndAnnualSign selectSignAnnual(int sno) {
		System.out.println(sno);
		return sDao.selectSignAnnual(sqlSession,sno);
	}

	@Override
	public SignAndQuit selectSignQuit(int sno) {
		
		return sDao.selectSignQuit(sqlSession, sno);
	}

	@Override
	public SignAndAppointment selectSignAppointment(int sno) {
		
		return sDao.selectSignAppointment(sqlSession, sno);
	}
	//결재선 상세보기
	@Override
	public ArrayList<SignLine> selectSignLine(int sno) {
		
		return sDao.selectSignLine(sqlSession, sno);
	}
	//참조자 상세보기
	@Override
	public ArrayList<SignRefer> selectSignRefer(int sno) {
		
		return sDao.selectSignRefer(sqlSession, sno);
	}
	//첨부파일 상세보기
	@Override
	public ArrayList<SignAttachment> selectAttachment(int sno) {
		
		return sDao.selectAttachment(sqlSession, sno);
	}
	
	//결재 상신 올리기
	@Override
	public int signUp(int sno) {
		int result1 = sDao.signUp(sqlSession,sno);
		int result2 = sDao.signLineUp(sqlSession,sno);
		return result1*result2;
	}

	
	@Override
	public int updateSignQuit(SignAndQuit signAndQuit, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist) {

		int result1 = sDao.updateSignQ(sqlSession, signAndQuit);
		int result2 = sDao.updateSignQuit(sqlSession, signAndQuit);
		int result9 = 1;
		if(result1>0 && result2>0) {
			
			int result3 = sDao.deleteSignLineList(sqlSession,slist.getSlist().get(0).getSignNo());
			int result6 = sDao.updateSignLineList(sqlSession, slist.getSlist());
			
			int result4=1;
			int result5=1;
			int result7=1;
			int result8=1;
			
			if(rlist.getRlist()!=null) {
			result4 = sDao.deleteSignReferList(sqlSession, rlist.getRlist().get(0).getSignNo());
			result7 = sDao.updateReferList(sqlSession, rlist.getRlist());
			}
			if(!alist.isEmpty()) {
			 result5 = sDao.deleteSignAttachmentList(sqlSession, alist.get(0).getSignNo());
			 result8 = sDao.updateAttachmentList(sqlSession, alist);
			}
			result9 = result3*result4*result5*result6*result7*result8;
			
		}
		
		return  result1*result2*result9;
	}

	@Override
	public int updateSignAnnual(SignAndAnnualSign signAndAnnualSign, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist) {
		
		int result1 = sDao.updateSignAN(sqlSession, signAndAnnualSign);
		int result2 = sDao.updateSignAnnual(sqlSession, signAndAnnualSign);
		int result9 = 1;
		if(result1>0 && result2>0) {
			
			int result3 = sDao.deleteSignLineList(sqlSession,slist.getSlist().get(0).getSignNo());
			int result6 = sDao.updateSignLineList(sqlSession, slist.getSlist());
			
			int result4=1;
			int result5=1;
			int result7=1;
			int result8=1;
			
			if(rlist.getRlist()!=null) {
			result4 = sDao.deleteSignReferList(sqlSession, rlist.getRlist().get(0).getSignNo());
			result7 = sDao.updateReferList(sqlSession, rlist.getRlist());
			}
			if(!alist.isEmpty()) {
			 result5 = sDao.deleteSignAttachmentList(sqlSession, alist.get(0).getSignNo());
			 result8 = sDao.updateAttachmentList(sqlSession, alist);
			}
			result9 = result3*result4*result5*result6*result7*result8;
			
		}
		
		return  result1*result2*result9;
	}

	@Override
	public int updateSignAnnual(SignAndAppointment signAndAppointment, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist) {
		
		int result1 = sDao.updateSignAP(sqlSession, signAndAppointment);
		int result2 = sDao.updateSignAppointment(sqlSession, signAndAppointment);
		int result9 = 1;
		if(result1>0 && result2>0) {
			
			int result3 = sDao.deleteSignLineList(sqlSession,slist.getSlist().get(0).getSignNo());
			int result6 = sDao.updateSignLineList(sqlSession, slist.getSlist());
			
			int result4=1;
			int result5=1;
			int result7=1;
			int result8=1;
			
			if(rlist.getRlist()!=null) {
			result4 = sDao.deleteSignReferList(sqlSession, rlist.getRlist().get(0).getSignNo());
			result7 = sDao.updateReferList(sqlSession, rlist.getRlist());
			}
			if(!alist.isEmpty()) {
			 result5 = sDao.deleteSignAttachmentList(sqlSession, alist.get(0).getSignNo());
			 result8 = sDao.updateAttachmentList(sqlSession, alist);
			}
			result9 = result3*result4*result5*result6*result7*result8;
			
		}
		
		return  result1*result2*result9;
	}

	
	



}
