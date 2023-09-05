package com.icss.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icss.dao.NewsDao;
import com.icss.entity.News;

@Service
public class NewsBiz {

	@Autowired
	private NewsDao newsDao;
	
	public List<News> getAllNews() throws Exception{
		return newsDao.getAllNews();
	}
	
	public News getNewsModel(String nid) throws Exception{
		return newsDao.getNewsModel(nid);
	}
	
	public List<News> getNew0_4() throws Exception{
		return newsDao.getNew0_4();
	}
	public List<News> getNew4_8() throws Exception{
		return newsDao.getNew4_8();
	}
	public List<News> getNew0_3() throws Exception{
		return newsDao.getNew0_3();
	}
}
