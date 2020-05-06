package com.dadada.byeworks.sign.model.vo;

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
public class Sign {
	
	private int signNo;
	private Date signUpDate;
	private String docType;
	private int memberNo;
	private String signStatus;
	private String flag;
	private String title;

}
