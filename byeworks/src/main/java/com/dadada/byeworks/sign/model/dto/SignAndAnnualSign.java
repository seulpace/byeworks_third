package com.dadada.byeworks.sign.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SignAndAnnualSign {
	
	private int signNo;
	private Date signUpDate;
	private String docuType;
	private int memberNo;
	private String signStatus;
	private String flag;
	private String title;
	private Date signUse;
	private int annualPeriod;
	private Date annualStartDay;
	private Date annualEndDay;
	private String annualContent;
	private int annualType;

}
