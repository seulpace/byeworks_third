package com.dadada.byeworks.note.model.service;

import java.util.ArrayList;

import com.dadada.byeworks.note.model.vo.Note;

public interface NoteService {
	
	// 받은 쪽지 전체 조회
	ArrayList<Note> receiveList(int no);

	// 보낸 쪽지 전체 조회
	ArrayList<Note> sendList(int no);
	
	// 쪽지 보내기
	int sendNote(Note n);
}
