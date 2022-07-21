package com.bitcamp.Danawa.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bitcamp.Danawa.model.PostingDTO;

@Repository
@Service
public class PostingService {
	private final String NAMESPACE="mapper.PostingMapper";
	
	private final int PAGE_SIZE=10;
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<PostingDTO> selectAll(int pageNo){
		HashMap<String, Integer> map=new HashMap<>();
		int startNum=(pageNo-1)*PAGE_SIZE;
		map.put("startNum", startNum);
		map.put("PAGE_SIZE", PAGE_SIZE);
		
		return sqlSession.selectList(NAMESPACE+".selectAll", map);
	}
	
	public int selectLastPage() {
		int total=sqlSession.selectOne(NAMESPACE+".count");
		
		if(total%PAGE_SIZE==0) {
			return total/PAGE_SIZE;
		} else {
			return (total/PAGE_SIZE)+1;
		}
	}
	
	public PostingDTO selectOne(int id) {
		return sqlSession.selectOne(NAMESPACE+".selectOne", id);
	}
	
	public int insert(PostingDTO p) {
		int changedRow=sqlSession.insert(NAMESPACE+".insert", p);
		return p.getId()*changedRow;
	}
	
	public int update(PostingDTO p) {
		int changedRow=sqlSession.update(NAMESPACE+".update", p);
		return p.getId()*changedRow;
	}
	
	public int delete(int id) {
		return sqlSession.delete(NAMESPACE+".delete", id);
	}
}
