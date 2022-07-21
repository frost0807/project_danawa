package com.bitcamp.Danawa.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bitcamp.Danawa.model.CategoryDTO;

@Repository
@Service
public class CategoryService {
	private final String NAMESPACE="mapper.CategoryMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	public CategoryDTO selectOne(int id) {
		return sqlSession.selectOne(NAMESPACE+".selectOne",id);
	}
	
	public CategoryDTO selectOneByCategory(CategoryDTO c) {
		return sqlSession.selectOne(NAMESPACE+".selectOneByCategory", c);
	}
	
	public List<CategoryDTO> selectAll(){
		return sqlSession.selectList(NAMESPACE+".selectAll");
	}
	
	public String getCategoryString(int id) {
		CategoryDTO c=selectOne(id);
		String result=c.getMainCategory()+" -> "+c.getLargeCategory()+
				" -> "+c.getMiddleCategory()+" -> "+c.getSubCategory();
		
		return result;
	}
}
