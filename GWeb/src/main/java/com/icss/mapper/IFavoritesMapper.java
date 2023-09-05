package com.icss.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.icss.entity.Favorites;

public interface IFavoritesMapper {

	public List<Favorites> getAllFavorites(@Param("uname") String uname) throws Exception ;
	
	public Favorites getFavoriteModel(@Param("uname")String uname,@Param("gname")String gname) throws Exception;
	
	public int colletion(@Param("favorites")Favorites favorites) throws Exception;
	
	public int removecollection(@Param("uname")String uname,@Param("gname")String gname) throws Exception;



}
