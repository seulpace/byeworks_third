package com.dadada.byeworks.project.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dadada.byeworks.project.model.dao.ProjectDao;
import com.dadada.byeworks.project.model.vo.ProjectMain;
import com.dadada.byeworks.project.model.vo.Task;
import com.dadada.byeworks.project.model.vo.TasksCategory;
import com.dadada.byeworks.project.model.vo.TasksCategories;

@Service("proService")
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectDao proDao;
	
	@Override
	public void saveTasks(TasksCategories allTasks) {
		List<TasksCategory> categories = allTasks.getTasksCategory();
		List<Task> tasks = new ArrayList<Task>();
		for (int i = 0; i< categories.size(); i++) {
			String categoryValue = categories.get(i).getCategory();
			for (int j = 0; j < categories.get(i).getTasks().size(); j++) {
				categories.get(i).getTasks().get(j).setCategory(categoryValue);
				tasks.add(categories.get(i).getTasks().get(j));
			}
		}
	}

	@Override
	public ProjectMain selectProject(int memberNo) {
		return proDao.selectProject(sqlSession, memberNo);
	}
}
