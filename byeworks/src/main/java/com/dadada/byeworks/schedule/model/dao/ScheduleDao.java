package com.dadada.byeworks.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.insert("scheduleMapper.insertSchedule", s);
	}
	
	public ArrayList<Schedule> selectSchedule(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectSchedule", no);
	}
	
	public Schedule selectOne(SqlSessionTemplate sqlSession, int schNo) {
		return sqlSession.selectOne("scheduleMapper.selectOne", schNo);
	}

}
