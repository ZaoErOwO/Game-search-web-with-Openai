package com.icss.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icss.dao.FavoritesDao;
import com.icss.entity.Favorites;

@Service
public class FavoritesBiz {

	@Autowired
	private FavoritesDao favoritesDao;
	
	public List<Favorites> getAllFavorites(String uname) throws Exception{
		return favoritesDao.getAllFavorites(uname);
	}
	
	public Favorites getFavoriteModel(String uname,String gname) throws Exception{
		return favoritesDao.getFavoriteModel(uname, gname);
	}
	
	public int colletion(Favorites favorites) throws Exception{
		return favoritesDao.colletion(favorites);
	}
	
	public int removecollection(String uname,String gname) throws Exception{
		return favoritesDao.removecollection(uname, gname);
	}
	
}
