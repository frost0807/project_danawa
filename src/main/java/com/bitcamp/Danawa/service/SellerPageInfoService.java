package com.bitcamp.Danawa.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bitcamp.Danawa.model.SellerPageInfoDTO;

@Repository
@Service
public class SellerPageInfoService {
	private final String NAMESPACE="mapper.SellerPageInfoMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	private final int PAGE_SIZE=10;
	
	public SellerPageInfoDTO selectOne(int id) {
		return sqlSession.selectOne(NAMESPACE+".selectOne", id);
	}
	
	public List<SellerPageInfoDTO> selectAllForPage(int pageNo) {
		HashMap<String, Integer> map=new HashMap<>();
		int startNum=(pageNo-1)*PAGE_SIZE;
		map.put("startNum", startNum);
		map.put("PAGE_SIZE", PAGE_SIZE);
		
		return sqlSession.selectList(NAMESPACE+".selectAllForPage", map);
	}
	
	public List<SellerPageInfoDTO> selectAll() {
		return sqlSession.selectList(NAMESPACE+".selectAll");
	}
	
	public int insert(SellerPageInfoDTO s) {
		int changedRow=sqlSession.insert(NAMESPACE+".insert", s);
		
		return s.getId()*changedRow;
	}
	
	public int update(SellerPageInfoDTO s) {
		int changedRow=sqlSession.update(NAMESPACE+".update", s);
		
		return s.getId()*changedRow;
	}
	
	public int delete(int id) {
		return sqlSession.delete(NAMESPACE+".delete", id);
	}
	
	public int selectLastPage() {
		int total=sqlSession.selectOne(NAMESPACE+".count");
		
		if(total%PAGE_SIZE==0) {
			return total/PAGE_SIZE;
		} else {
			return (total/PAGE_SIZE)+1;
		}
	}
}
