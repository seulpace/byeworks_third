package com.dadada.byeworks.project.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dadada.byeworks.project.model.vo.ProjectMain;

@Repository
public class ProjectDao {
	
	public ProjectMain selectProject(SqlSessionTemplate sqlSession, int memberNo) {
		ProjectMain pm = sqlSession.selectOne("projectMapper.selectProject", memberNo);
		return pm;
	}

}
