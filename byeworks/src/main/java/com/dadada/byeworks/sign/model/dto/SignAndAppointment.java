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
public class SignAndAppointment {
	
	private int signNo;
	private Date signUpDate;
	private String docuType;
	private int memberNo;
	private String memberName;
	private String signStatus;
	private String flag;
	private String title;
	private int positionBefore;
	private int positionAfter;
	private int depBefore;
	private int depAfter;
	private int appointmentLev;
	private int appointmentMem;
	private Date appointmentDate;
	private String department;

}
