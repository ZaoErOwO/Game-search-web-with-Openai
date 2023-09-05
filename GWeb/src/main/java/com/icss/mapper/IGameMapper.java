package com.icss.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.icss.entity.Comments;
import com.icss.entity.Game;
import com.icss.entity.GameType;

public interface IGameMapper {
	
	public List<Game> getAllGame() throws Exception ;
	
	public Game getGameModel(@Param("gname") String gname) throws Exception;
	
	public List<GameType> getAllType() throws Exception;
	
	public List<Game> getTypeGame(@Param("tname") String tname) throws Exception;
	
	public List<Comments> getGameAllComments(@Param("gname") String gname) throws Exception ;
	
	public int AddComments(@Param("Comments")GameType Comments) throws Exception;
	
	public List<Game> searchGame(@Param("gname") String gname) throws Exception;
}
