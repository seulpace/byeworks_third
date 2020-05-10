package com.dadada.byeworks.sign.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;
import com.dadada.byeworks.sign.model.dto.SignAndAnnualSign;
import com.dadada.byeworks.sign.model.dto.SignAndAppointment;
import com.dadada.byeworks.sign.model.dto.SignAndQuit;
import com.dadada.byeworks.sign.model.dto.SignDto;
import com.dadada.byeworks.sign.model.vo.Sign;
import com.dadada.byeworks.sign.model.vo.SignAttachment;
import com.dadada.byeworks.sign.model.vo.SignLine;
import com.dadada.byeworks.sign.model.vo.SignRefer;

public interface SignService {

	ArrayList<DepartmentDto> selectDepartmentList();

	ArrayList<Member> selectEmpList(int departmentNo);

	int insertSignAnnual(SignAndAnnualSign signAndAnnualSign, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist);

	int insertSignQ(SignAndQuit signAndQuit);

	int insertQuit(SignAndQuit signAndQuit);

	int insertSignLineList(SignLine slist);

	int insertReferList(SignRefer rlist);

	int insertAttachmentList(ArrayList<SignAttachment> alist);

	int insertSignAp(SignAndAppointment signAndAppointment, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist);

	ArrayList<Sign> selectSignList(int mno, int type);

	SignAndAnnualSign selectSignAnnual(int sno);

	SignAndQuit selectSignQuit(int sno);

	SignAndAppointment selectSignAppointment(int sno);

	ArrayList<SignLine> selectSignLine(int sno);

	ArrayList<SignRefer> selectSignRefer(int sno);

	ArrayList<SignAttachment> selectAttachment(int sno);

	int signUp(int sno);

	int updateSignQuit(SignAndQuit signAndQuit, SignLine slist, SignRefer rlist, ArrayList<SignAttachment> alist);

	int updateSignAnnual(SignAndAnnualSign signAndAnnualSign, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist);

	int updateSignAnnual(SignAndAppointment signAndAppointment, SignLine slist, SignRefer rlist,
			ArrayList<SignAttachment> alist);




}
