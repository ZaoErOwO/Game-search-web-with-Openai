package com.icss.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icss.entity.News;
import com.icss.mapper.INewsMapper;

@Repository
public class NewsDao {

	@Autowired
	private INewsMapper newsMapper;
	
	public List<News> getAllNews() throws Exception{
		return newsMapper.getAllNews();
	}
	
	public News getNewsModel(String nid) throws Exception{
		return newsMapper.getNewsModel(nid);
	}
	
	public List<News> getNew0_4() throws Exception{
		return newsMapper.getNews0_4();
	}
	public List<News> getNew4_8() throws Exception{
		return newsMapper.getNews4_8();
	}
	public List<News> getNew0_3() throws Exception{
		return newsMapper.getNews0_3();
	}
}
