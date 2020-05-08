package com.dadada.byeworks.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dadada.byeworks.notice.model.dao.NoticeDao;
import com.dadada.byeworks.notice.model.vo.Notice;


@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NoticeDao nDao;
	
//	@Override
//	public int getListCount() { 
//		return nDao.getListCount(sqlSession);
//	}

	//공지사항 총개수만 가져와주는거 ( 페이지info 등 필요없음)
	@Override
	public ArrayList<Notice> selectList() {
		return nDao.selectList(sqlSession);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}

	@Override
	public int increaseCount(int nno) {
		// TODO Auto-generated method stub
		return nDao.increaseCount(sqlSession, nno);
	}

	@Override
	public Notice selectNotice(int nno) {
		return nDao.selectNotice(sqlSession, nno);
	}

	@Override
	public int deleteNotice(int nno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

}
