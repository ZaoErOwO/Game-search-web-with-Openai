package com.icss.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.icss.entity.News;


public interface INewsMapper {

	public List<News> getAllNews() throws Exception ;
	
	public News getNewsModel(@Param("nid") String nid) throws Exception;
	
	public List<News> getNews0_4() throws Exception; 
	
	public List<News> getNews0_3() throws Exception; 
	
	public List<News> getNews4_8() throws Exception; 
}
