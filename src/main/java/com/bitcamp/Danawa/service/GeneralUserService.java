package com.bitcamp.Danawa.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bitcamp.Danawa.model.BusinessUserDTO;
import com.bitcamp.Danawa.model.GeneralUserDTO;

@Repository
@Service
public class GeneralUserService {
	private final String NAMESPACE="mapper.GeneralUserMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(GeneralUserDTO g) {
		int changedRowNum=sqlSession.insert(NAMESPACE+".insert", g);
		
		return changedRowNum*g.getId();
	}
	
	public GeneralUserDTO selectOne(int userId) {
		return sqlSession.selectOne(NAMESPACE+".selectOne", userId);
	}
	
	public int update(GeneralUserDTO g) {
		return sqlSession.update(NAMESPACE+".update", g);
	}
	
	public int delete(int userId) {
		return sqlSession.delete(NAMESPACE+".delete", userId);
	}
}
