package com.games.dys.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.games.dys.board.dto.GameDTO;

@Repository
public interface GameDAO {
	public void gameRegiProc(GameDTO game);
	
	public ArrayList<GameDTO> gameProc(@Param("b") int begin, @Param("e")int end, @Param("search") String search);
	
	public int gameCount(HashMap<String, Object> map);
	
	public GameDTO gameView(int no);
	
	public int gameModificationProc(GameDTO game);
}
