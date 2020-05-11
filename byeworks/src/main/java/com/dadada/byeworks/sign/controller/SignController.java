package com.dadada.byeworks.sign.controller;




import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dadada.byeworks.member.model.vo.Member;
import com.dadada.byeworks.sign.model.dto.AppointmentDto;
import com.dadada.byeworks.sign.model.dto.DepartmentDto;
import com.dadada.byeworks.sign.model.dto.SignAndAnnualSign;
import com.dadada.byeworks.sign.model.dto.SignAndAppointment;
import com.dadada.byeworks.sign.model.dto.SignAndQuit;
import com.dadada.byeworks.sign.model.dto.SignDto;
import com.dadada.byeworks.sign.model.service.SignService;
import com.dadada.byeworks.sign.model.vo.Sign;
import com.dadada.byeworks.sign.model.vo.SignAttachment;
import com.dadada.byeworks.sign.model.vo.SignLine;
import com.dadada.byeworks.sign.model.vo.SignRefer;
import com.google.gson.Gson;

@Controller
public class SignController {
	@Autowired
	private SignService sService;
	
	/**
	 * 결재 작성화면 이동
	 */
	@RequestMapping("enrollForm.si")
	public String enrollSignForm() {
		
		return "sign/enrollSignForm";
	}
	
	/**
	 * 결재문서 상세보기 이동
	 */
	@RequestMapping("signDetail.si")
	public ModelAndView signDetail(ModelAndView mv, int sno, String type) {
		
	if(type.equals("V")) {
		SignAndAnnualSign an = sService.selectSignAnnual(sno);
		ArrayList<SignLine> list = sService.selectSignLine(sno);
		
		mv.addObject("list",an).setViewName("sign/signDetail");
	}else if(type.equals("Q")) {
		SignAndQuit sq = sService.selectSignQuit(sno);
		
		mv.addObject("list",sq).setViewName("sign/signDetail");
	}else {
		SignAndAppointment sp = sService.selectSignAppointment(sno);
		
		mv.addObject("list",sp).setViewName("sign/signDetail");
	}
		
		return mv;
	}
	
	/**
	 * @param signAndAppointment
	 * @param slist
	 * @param rlist
	 * @param request
	 * @param file
	 * 승진/발령 결재 등록 
	 * 
	 */
	@RequestMapping("insertSignAppointment.si")
	public String insertSignAp(SignAndAppointment signAndAppointment, @ModelAttribute SignLine slist, @ModelAttribute SignRefer rlist, MultipartHttpServletRequest request, @RequestParam(value="upLoadFile", required=false) MultipartFile[] file) {
		
		ArrayList<SignAttachment> alist = new ArrayList<SignAttachment>();
		
		
		if(!file[0].getOriginalFilename().equals("")) {
			
			alist = saveFile(file, request);
		}
		
		int result = sService.insertSignAp(signAndAppointment, slist, rlist, alist);
		
		return "redirect:selectSignList.si?mno=" + signAndAppointment.getMemberNo() + "&type=2";
	}
	
	/**
	 * @param signAndQuit
	 * @param slist
	 * @param rlist
	 * @param request
	 * @param file
	 * @return
	 * 사직 결재 등록
	 */
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
		return "redirect:selectSignList.si?mno=" + signAndQuit.getMemberNo() + "&type=2";
	}

	/**
	 * @param signAndAnnualSign
	 * @param slist
	 * @param rlist
	 * @param request
	 * @param file
	 * @return
	 * 연차 결재 등록
	 */
	@RequestMapping("insertSignAnnual.si")
	public String insertSingAn(SignAndAnnualSign signAndAnnualSign, @ModelAttribute SignLine slist, @ModelAttribute SignRefer rlist, MultipartHttpServletRequest request, @RequestParam(value="upLoadFile", required=false) MultipartFile[] file ) {
		
		
		ArrayList<SignAttachment> alist = new ArrayList<SignAttachment>();
		
		
		if(!file[0].getOriginalFilename().equals("")) {
			
			alist = saveFile(file, request);	
		}	
		int result = sService.insertSignAnnual(signAndAnnualSign, slist, rlist, alist);
		
		return "redirect:selectSignList.si?mno=" + signAndAnnualSign.getMemberNo() + "&type=2";
	}
	

	@RequestMapping("selectSignList.si")
	public ModelAndView selectSignList(ModelAndView mv, int mno, int type) {
		ArrayList<Sign> list = sService.selectSignList(mno,type);

		
		mv.addObject("list", list).addObject("type", type).setViewName("sign/totalSignList");

		
//		switch(type) {
//		case 1 : mv.addObject("list", list).setViewName("sign/totalSignList"); break;
//		case 2 : mv.addObject("list", list).setViewName("sign/waitingSignList"); break;
//		case 3 : mv.addObject("list", list).setViewName("sign/progressingSignList"); break;
//		case 4 : mv.addObject("list", list).setViewName("sign/confirmedSignList"); break;
//		case 5 : mv.addObject("list", list).setViewName("sign/returnSignList"); break;
//		case 6 : mv.addObject("list", list).setViewName("sign/cancelSignList"); break;
//		
//		}
		return mv;
	
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
	
	
	@RequestMapping("selectReferList.si")
	public ModelAndView selectReferList(ModelAndView mv, int mno) {
		
		ArrayList<SignDto> list = sService.selectReferList(mno);
		
		mv.addObject("list",list).setViewName("sign/referSignList");
		return mv;
	}
	
	@RequestMapping("doSignList.si")
	public ModelAndView selectDoSignList(ModelAndView mv, int mno) {
		
		ArrayList<SignDto> list = sService.selectDoSignList(mno);
		System.out.println(list);
		mv.addObject("list", list).setViewName("sign/doSignList");
		
		return mv;
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
	
	/** 김다흰 : 발령 내역 조회
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("appointmentList.adto")
	public ModelAndView selectAppointmentList(HttpSession session, ModelAndView mv) {
		
		ArrayList<Integer> list1 = new ArrayList();
		list1.add(2);
		list1.add(3);
		 
		ArrayList<Integer> list2 = new ArrayList();
		list2.add(4);
		list2.add(5);
		
		ArrayList<Integer> list3 = new ArrayList();
		list3.add(6);
		list3.add(7);
		
		
		ArrayList<AppointmentDto> appList1 = sService.selectAppointmentList(list1);
		ArrayList<AppointmentDto> appList2 = sService.selectAppointmentList(list2);
		ArrayList<AppointmentDto> appList3 = sService.selectAppointmentList(list3);
		mv.addObject("appList1", appList1);
		mv.addObject("appList2", appList2);
		mv.addObject("appList3", appList3);
		mv.setViewName("work/appointmentList");
		
		System.out.println(appList1);
		System.out.println(appList2);
		System.out.println(appList3);
		return mv;
		
	}
}
