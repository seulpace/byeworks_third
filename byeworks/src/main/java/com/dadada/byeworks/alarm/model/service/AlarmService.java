package com.dadada.byeworks.alarm.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.alarm.model.vo.Alarm;

public interface AlarmService {
	
	// 쪽지 알람 조회
	ArrayList<Alarm> selectNoteList(int no);

	// 쪽지 알람 전체 삭제
	int deleteAllNote(int no);
	
	// 쪽지 한 개 삭제
	int deleteOneNote(int no);
	
	// 쪽지 알람 insert
	int insertAlarm(Alarm a);
}
