package com.icss.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icss.entity.Comments;
import com.icss.entity.Game;
import com.icss.entity.GameType;
import com.icss.mapper.IGameMapper;


@Repository
public class GameDao {

	@Autowired
	private IGameMapper gameMapper;
	/**
	 * Getting a single game
	 * @param gname
	 * @return
	 * @throws Exception
	 */
	public Game getGameModel(String gname) throws Exception {
		
		return gameMapper.getGameModel(gname);
	}
	/**
	 * Get All Games
	 * @return
	 * @throws Exception
	 */
	public List<Game> getAllGame() throws Exception {		
		return gameMapper.getAllGame();
	}
	/**
	 * Get all game categories
	 * @return
	 * @throws Exception
	 */
	public List<GameType> getAllType() throws Exception {	
		return gameMapper.getAllType();
	}
	
	public List<Game> getTypeGame(String tname) throws Exception{
		return gameMapper.getTypeGame(tname);
	}
	
	public List<Comments> getGameAllComments(String gname) throws Exception{
		return gameMapper.getGameAllComments(gname);
	}
	
	public int AddComments(GameType Comments) throws Exception{
		return gameMapper.AddComments(Comments);
	}
	
	public List<Game> searchGame(String gname) throws Exception{
		return gameMapper.searchGame(gname);
	}
}
