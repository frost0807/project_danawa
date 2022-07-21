package com.bitcamp.Danawa.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bitcamp.Danawa.model.UserDTO;

@Repository
@Service
public class UserService {
	private final String NAMESPACE="mapper.UserMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserDTO selectOne(int id) {
		return sqlSession.selectOne(NAMESPACE+".selectOne", id);
	}
	
	public int insert(UserDTO u) {
		int changedRowNum=sqlSession.insert(NAMESPACE+".insert", u);
		
		return changedRowNum*u.getId();
	}
	
	public UserDTO auth(UserDTO u) {
		return sqlSession.selectOne(NAMESPACE+".auth", u);
	}
	
	public int update(UserDTO u) {
		int changedRowNum=sqlSession.update(NAMESPACE+"update", u);
		
		return changedRowNum*u.getId();
	}
	
	public int delete(int id) {
		return sqlSession.delete(NAMESPACE+".delete", id);
	}
}
