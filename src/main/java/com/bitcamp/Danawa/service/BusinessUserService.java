package com.bitcamp.Danawa.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bitcamp.Danawa.model.BusinessUserDTO;

@Repository
@Service
public class BusinessUserService {
	private final String NAMESPACE="mapper.BusinessUserMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(BusinessUserDTO b) {
		int changedRowNum=sqlSession.insert(NAMESPACE+".insert", b);
		return changedRowNum*b.getId();
	}
	
	public BusinessUserDTO selectOne(int userId) {
		return sqlSession.selectOne(NAMESPACE+".selectOne", userId);
	}
	
	public int update(BusinessUserDTO b) {
		return sqlSession.update(NAMESPACE+".update", b);
	}
	
	public int delete(int userId) {
		return sqlSession.delete(NAMESPACE+".delete", userId);
	}
}
