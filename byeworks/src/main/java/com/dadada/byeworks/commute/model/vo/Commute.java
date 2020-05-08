package com.dadada.byeworks.commute.model.vo;

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
public class Commute {

	private Date commuteDate;		// 출근날짜
	private int commuteMember;		// 직원 번호
	private String commuteStatus;	// 0 : 정상출근 1: 연차사용 2: 오전반차사용 3: 오후반차사용 4: 지각 5:무단결근
	private String commuteWork;		// 출근시간
	private String commuteLeaved;	// 퇴근시간
	private String commuteAnnual;	// 0:연차 1: 오전반차 2: 오후반차
}
