package com.dadada.byeworks.note.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.note.model.vo.Note;

@Repository
public class NoteDao {
	
	public ArrayList<Note> receiveList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("noteMapper.receiveList", no);
	}
	
	public ArrayList<Note> sendList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("noteMapper.sendList", no);
	}
	
	public int sendNote(SqlSessionTemplate sqlSession, Note n) {
		return sqlSession.insert("noteMapper.sendNote", n);
	}
	
	public Note detailNote(SqlSessionTemplate sqlSession, int noteNo) {
		return sqlSession.selectOne("noteMapper.detailNote", noteNo);
	}
	
	public int updateReadcheck(SqlSessionTemplate sqlSession, Note n) {
		return sqlSession.update("noteMapper.updateReadcheck", n);
	}

}
