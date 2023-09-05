package com.icss.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icss.dao.GameDao;
import com.icss.entity.Comments;
import com.icss.entity.Game;
import com.icss.entity.GameType;

@Service
public class GameBiz {

	@Autowired
	private GameDao gameDao;
	
	public Game getGameModel(String gname) throws Exception {		
		return gameDao.getGameModel(gname);	
	}
	
	public List<Game> getAllGames() throws Exception {		
		return gameDao.getAllGame();	
	}
	
	public List<GameType> getAllTypes() throws Exception {		
		return gameDao.getAllType();	
	}
	
	public List<Comments> getGameAllComments(String gname) throws Exception{
		return gameDao.getGameAllComments(gname);
	}
	
	public int AddComments(GameType Comments) throws Exception{
		return gameDao.AddComments(Comments);
	}
	
	public List<Game> getTypeGame(String tname) throws Exception{
		return gameDao.getTypeGame(tname);
	}
	
	public List<Game> searchGame(String gname) throws Exception{
		return gameDao.searchGame(gname);
	}
}
