package com.bitcamp.Danawa.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bitcamp.Danawa.model.ItemDTO;

@Repository
@Service
public class ItemService {
	private final String NAMESPACE="mapper.ItemMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	private final int PAGE_SIZE=10;
	
	public ItemDTO selectOne(int id) {
		return sqlSession.selectOne(NAMESPACE+".selectOne", id);
	}
	
	public List<ItemDTO> selectAll(int pageNo) {
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
	
	public int insert(ItemDTO i) {
		int changedRow=sqlSession.insert(NAMESPACE+".insert", i);
		
		return changedRow*i.getId();
	}
	
	public int update(ItemDTO i) {
		int changedRow=sqlSession.update(NAMESPACE+".update", i);
		
		return changedRow*i.getId();
	}
	
	public int delete(int id) {
		return sqlSession.delete(NAMESPACE+".delete", id);
	}
	
	public HashMap<String,String> getSpecMap(String specString) {
		HashMap<String,String> map=new HashMap<>();
		String[] splitString=specString.split("/");
		
		for(String s:splitString) {
			String[] temp=s.split(":");
			map.put(temp[0], temp[1]);
		}
		
		return map;
	}
}
