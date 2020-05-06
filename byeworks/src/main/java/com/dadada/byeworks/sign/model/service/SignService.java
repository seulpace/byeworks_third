package com.dadada.byeworks.sign.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;

public interface SignService {

	ArrayList<DepartmentDto> selectDepartmentList();

	ArrayList<Member> selectEmpList(int departmentNo);

}
