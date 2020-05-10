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
public class SignLineDto {
	
				
	private int memberNo;
	private String memberName;
	private int signNo;
	private Date approvalDate;
	private String status;
	private int memberOrder;
	private String position;
}
