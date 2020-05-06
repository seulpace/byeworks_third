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
public class SignAttachment {
	
	private int fileNo;
	private String oaName;
	private String maName;
	private String filePath;
	private int signNo;

}
