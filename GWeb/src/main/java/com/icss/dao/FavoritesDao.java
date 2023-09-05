package com.icss.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icss.entity.Favorites;
import com.icss.mapper.IFavoritesMapper;

@Repository
public class FavoritesDao {

	@Autowired
	private IFavoritesMapper favoritesMapper;
	
	public List<Favorites> getAllFavorites(String uname) throws Exception{
		return favoritesMapper.getAllFavorites(uname);
	}
	
	public Favorites getFavoriteModel(String uname,String gname) throws Exception{
		return favoritesMapper.getFavoriteModel(uname, gname);
	}
	
	public int colletion(Favorites favorites) throws Exception{
		return favoritesMapper.colletion(favorites);
	}
	
	public int removecollection(String uname,String gname) throws Exception{
		return favoritesMapper.removecollection(uname, gname);
	}
}
