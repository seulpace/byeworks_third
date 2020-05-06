package com.dadada.byeworks.sign.controller;




import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;
import com.dadada.byeworks.sign.model.dto.SignAndAnnualSign;
import com.dadada.byeworks.sign.model.dto.SignAndAppointment;
import com.dadada.byeworks.sign.model.dto.SignAndQuit;
import com.dadada.byeworks.sign.model.service.SignService;
import com.dadada.byeworks.sign.model.vo.Appointment;
import com.dadada.byeworks.sign.model.vo.SignAttachment;
import com.dadada.byeworks.sign.model.vo.SignLine;
import com.dadada.byeworks.sign.model.vo.SignRefer;
import com.google.gson.Gson;

@Controller
public class SignController {
	@Autowired
	private SignService sService;
	
	@RequestMapping("enrollForm.si")
	public String enrollSignForm() {
		
		return "sign/enrollSignForm";
	}
	
	@RequestMapping("insertSignAppointment.si")
	public String insertSignAp(SignAndAppointment signAndAppointment, @ModelAttribute SignLine slist, @ModelAttribute SignRefer rlist, MultipartHttpServletRequest request, @RequestParam(value="upLoadFile", required=false) MultipartFile[] file) {
		
		ArrayList<SignAttachment> alist = new ArrayList<SignAttachment>();
		
		
		if(!file[0].getOriginalFilename().equals("")) {
			
			alist = saveFile(file, request);
		}
		
		int result = sService.insertSignAp(signAndAppointment, slist, rlist, alist);
		
		return "sign/totalSignList";
	}
	
	@RequestMapping("insertSignQuit.si")
	public String insertSignQ(SignAndQuit signAndQuit, @ModelAttribute SignLine slist, @ModelAttribute SignRefer rlist, MultipartHttpServletRequest request, @RequestParam(value="upLoadFile", required=false) MultipartFile[] file) {
		
		ArrayList<SignAttachment> alist = new ArrayList<SignAttachment>();

			if(!file[0].getOriginalFilename().equals("")) {
			
			alist = saveFile(file, request);
			
			
		}
			int result1 = sService.insertSignQ(signAndQuit);
			int result2 = 0;
			int result3 = 0;
			int result4 = 1;
			int result5 = 1;
			
			if(result1 == 1) {
			 result2 = sService.insertQuit(signAndQuit);
			 result3 = sService.insertSignLineList(slist);
			
			if(rlist.getRlist()!=null) {
			 result4 = sService.insertReferList(rlist); 
			}
			if(!alist.isEmpty()) {
				result5 = sService.insertAttachmentList(alist);
			}
		}
		return "sign/totalSignList";
	}

	@RequestMapping("insertSignAnnual.si")
	public String insertSingAn(SignAndAnnualSign signAndAnnualSign, @ModelAttribute SignLine slist, @ModelAttribute SignRefer rlist, MultipartHttpServletRequest request, @RequestParam(value="upLoadFile", required=false) MultipartFile[] file ) {
		
		
		ArrayList<SignAttachment> alist = new ArrayList<SignAttachment>();
		
		
		if(!file[0].getOriginalFilename().equals("")) {
			
			alist = saveFile(file, request);
			
			
		}
		
		int result = sService.insertSignAnnual(signAndAnnualSign, slist, rlist, alist);
		
		
		return "sign/totalSignList";
	}

	
	@RequestMapping("totalSignList.si")
	public String totalSignList() {
		
		return "sign/totalSignList";
	}
	
	
	
	@RequestMapping("waitingSignList.si")
	public String waitingSignList() {
		
		return "sign/waitngSignList";
	}
	
	@RequestMapping("progressingSignList.si")
	public String progressingSignList() {
		
		return "sign/progressingSignList";
		
	}
	
	@RequestMapping("referSignList.si")
	public String referSignList() {
		
		return "sign/referSignList";
	}
	
//	@RequestMapping("selectSignList.si")
//	public String selectSignList(int status) {
//		
//		String url = "";
//		
//		if(status == 0) {
//			
//			url = "sign/confirmedSignList";
//			
//		}else if(status == 1){
//			
//			url = "sign/returnSignList";
//			
//		}else if(status == 2){
//			
//			url = "sign/cancelSignList";
//			
//		}
//		
//		return url;
		

//	} --> 이렇게 하게되면 메뉴바에 누른 상태 화면 표시 안됨. 매개변수넘겨서 안하고 각각의 url mapping 값 따로줌.
	
	@RequestMapping("confirmedSignList.si")
	public String selectSignList() {
		return "sign/confirmedSignList";
	}
	
	@RequestMapping("returnSignList.si")
	public String returnSignList() {
		return "sign/returnSignList";
	}
	
	@RequestMapping("cancelSignList.si")
	public String cancelSignList() {
		return "sign/cancelSignList";
	}
	
	@RequestMapping("doSignList.si")
	public String doSignList() {
		return "sign/doSignList";
	}
	
	/**
	 * 부서목록 가져오는 ajax
	 */
	@ResponseBody
	@RequestMapping(value="selectDepartmentList.si", produces="application/json; charset=utf-8")
	public String selectDepartmentList() {
		
		ArrayList<DepartmentDto> list = sService.selectDepartmentList();
		
	
		
		Gson gson= new Gson();
		
		return gson.toJson(list);
		
	}
	
	/**
	 *  해당부서에 포함된 사원 가져오는 ajax
	 */
	@ResponseBody
	@RequestMapping(value="selectEmpList.si", produces="application/json; charset=utf-8")
	public String selectEmpList(int departmentNo) {
		
		
		ArrayList<Member> list = sService.selectEmpList(departmentNo);
		
		
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	//서버에 전달받은 파일들 업로드하는 메소드(공유해서 쓸수있음)
	/**
	 *  파일 업로드하는 메소드
	 */
	public ArrayList<SignAttachment> saveFile(MultipartFile[] file, MultipartHttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\sign_files\\";
		
		ArrayList<SignAttachment> list = new ArrayList<SignAttachment>();
		
		String originName = "";
		String changeName = "";
		for(int i=0;i<file.length;i++) {
			originName = file[i].getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String currentTime = sdf.format(new Date());
			String ext = originName.substring(originName.lastIndexOf("."));
			
			changeName = originName + currentTime + ext;
			
			SignAttachment sa = new SignAttachment();
			sa.setMaName(changeName);
			sa.setOaName(originName);
			
			list.add(sa);
			try {
				file[i].transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
	
}
