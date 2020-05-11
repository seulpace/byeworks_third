

package com.dadada.byeworks.sign.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.AppointmentDto;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;
import com.dadada.byeworks.sign.model.dto.SignAndAnnualSign;
import com.dadada.byeworks.sign.model.dto.SignAndAppointment;
import com.dadada.byeworks.sign.model.dto.SignAndQuit;
import com.dadada.byeworks.sign.model.dto.SignDto;
import com.dadada.byeworks.sign.model.vo.Sign;
import com.dadada.byeworks.sign.model.vo.SignAttachment;
import com.dadada.byeworks.sign.model.vo.SignLine;
import com.dadada.byeworks.sign.model.vo.SignRefer;

@Repository //데이터 CRUD관련한 객체의 빈
public class SignDao {
	
	//조직도 관련 ajax 메소드-----------------------------------------------------------

	/**
	 *  전 부서 select 메소드 
	 */
	public ArrayList<DepartmentDto> selectDepartmentList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("signMapper.selectDepartmentList");
	}
	
	
	/**
	 *  부서별 직원 select 메소드
	 */
	public ArrayList<Member> selectEmpList(SqlSessionTemplate sqlSession, int departmentNo) {
		
		
		
		return (ArrayList)sqlSession.selectList("signMapper.selectEmpList", departmentNo);
	}
	
	//연차 결재 등록-------------------------------------------
		/**
		 * 연차 결재 등록 메소드(여러가지방법으로 해보는중. controller에서부터 각 요청을 쪼개서 하는지 아니면 Dao에서 쪼개서 하는지)
		 */
	public int insertSignAnnual(SqlSessionTemplate sqlSession, SignAndAnnualSign signAndAnnualSign, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist) {
		
		int result1 = sqlSession.insert("signMapper.insertSignA", signAndAnnualSign);
		int result2 = sqlSession.insert("signMapper.insertAnnualSign", signAndAnnualSign);
		int result3 = sqlSession.insert("signMapper.insertSignLine", slist.getSlist());
		int result4 = 1;
			if(rlist.getRlist()!=null) {
		 result4 = sqlSession.insert("signMapper.insertSignRefer", rlist.getRlist());
			}
		int result5 = 1;
		if(!alist.isEmpty()) {
			
			for(SignAttachment sa : alist) {
		result5 = sqlSession.insert("signMapper.insertSignAttachment", sa);
			}
		}
		return result1*result2*result3*result4*result5;
	}

	// 사직 결재 등록----------------------------------------------------------
	
	/**
	 * 결재테이블 등록 메소드
	 */
	public int insertSignQ(SqlSessionTemplate sqlSession, SignAndQuit signAndQuit) {
		
		return sqlSession.insert("signMapper.insertSignQ", signAndQuit);
	}

	/**
	 * 사직테이블 등록 메소드
	 */
	public int insertQuit(SqlSessionTemplate sqlSession, SignAndQuit signAndQuit) {
		
		return sqlSession.insert("signMapper.insertQuit", signAndQuit);
	}
	
	/**
	 * 결재자테이블 등록 메소드
	 */
	public int insertSignLineList(SqlSessionTemplate sqlSession, SignLine slist) {
		
		return sqlSession.insert("signMapper.insertSignLineList", slist.getSlist());
	}
	
	/**
	 * 참조자테이블 등록 메소드
	 */
	public int insertReferList(SqlSessionTemplate sqlSession, SignRefer rlist) {
		int result=0;
		
		if(rlist !=null) {
		  result = sqlSession.insert("signMapper.insertReferList", rlist.getRlist());
		}
		return result;
	}
	
	/**
	 * 첨부파일 테이블 등록 메소드
	 */
	public int insertAttachmentList(SqlSessionTemplate sqlSession, ArrayList<SignAttachment> alist) {
		
		int result = 0;
		for(SignAttachment sa : alist) {
			sqlSession.insert("signMapper.insertAttachmentList", sa);
		}
		return result;
	}


	public int insertSignAp(SqlSessionTemplate sqlSession, SignAndAppointment signAndAppointment) {
		int result = sqlSession.insert("signMapper.insertSignAp", signAndAppointment);
		return result;
	}
	
	public int insertAppointment(SqlSessionTemplate sqlSession, SignAndAppointment signAndAppointment) {
		int result = sqlSession.insert("signMapper.insertAppointment", signAndAppointment);
		
		return result;
	}


	public ArrayList<Sign> selectSignList(SqlSessionTemplate sqlSession, int mno, int type) {
		
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("memberNo",mno);
		data.put("type",type);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectSignList", data);
	}


	public ArrayList<SignDto> selectReferList(SqlSessionTemplate sqlSession, int memberNo) {
		
	return (ArrayList)sqlSession.selectList("signMapper.selectSignReferList", memberNo);
	}


	public ArrayList<SignDto> selectDoSignList(SqlSessionTemplate sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("signMapper.selectDoSignList", memberNo );
	}


	public SignAndAnnualSign selectSignAnnual(SqlSessionTemplate sqlSession, int sno) {
		System.out.println(sno);
		return sqlSession.selectOne("signMapper.selectSignAnnual", sno);
	}


	public SignAndQuit selectSignQuit(SqlSessionTemplate sqlSession, int sno) {
		
		return sqlSession.selectOne("signMapper.selectSignQuit", sno);
	}


	public SignAndAppointment selectSignAppointment(SqlSessionTemplate sqlSession, int sno) {
		
		return sqlSession.selectOne("signMapper.selectSignAppointment", sno);
	}


	public ArrayList<SignLine> selectSignLine(SqlSessionTemplate sqlSession, int sno) {
		
		return (ArrayList)sqlSession.selectList("signMapper.selectSignLine", sno);
	}


	public ArrayList<AppointmentDto> selectAppointmentList(SqlSessionTemplate sqlSession, int num){
		return (ArrayList)sqlSession.selectList("signMapper.selectAppointmentList", num);
	}


	}
