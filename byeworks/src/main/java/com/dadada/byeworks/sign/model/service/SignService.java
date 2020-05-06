package com.dadada.byeworks.sign.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;
import com.dadada.byeworks.sign.model.dto.SignAndAnnualSign;
import com.dadada.byeworks.sign.model.dto.SignAndQuit;
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

}
