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
public class SignReferDto {
	
	private int signNo;
	private int memberNo;
	private String status;
	private Date checkDate;
	private String memberName;
	private String position;

}
