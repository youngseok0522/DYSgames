package com.games.dys.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.HtmlUtils;

import com.games.dys.board.config.PageConfig;
import com.games.dys.board.dao.GameDAO;
import com.games.dys.board.dto.GameDTO;

@Service
public class GameService {
	@Autowired GameDAO mapper;
	
	public void gameRegiProc(HttpServletRequest req) {
		String title = req.getParameter("title");
		String link = req.getParameter("link");
		String uLink = HtmlUtils.htmlUnescape(link);
		String price = req.getParameter("price");
		String launching = req.getParameter("launching");
		String genre = req.getParameter("genre");
		String publisher = req.getParameter("publisher");
		String developer = req.getParameter("developer");
		String platform = req.getParameter("platform");
		String language = req.getParameter("language");
		String explanation = req.getParameter("explanation");
		
		GameDTO game = new GameDTO();
		game.setTitle(title);
		game.setLink(uLink);
		game.setPrice(price);
		game.setLaunching(launching);
		game.setGenre(genre);
		game.setPublisher(publisher);
		game.setDeveloper(developer);
		game.setPlatform(platform);
		game.setLanguage(language);
		game.setExplanation(explanation);
		
		mapper.gameRegiProc(game);
	}
	
	
	public void gameProc(Model model, int currentPage, String search, HttpServletRequest req) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		int totalCount = mapper.gameCount(map);
		int pageBlock = 5;
		int end = currentPage * pageBlock;
		int begin = end + 1 - pageBlock;
		
		ArrayList<GameDTO> gameList = mapper.gameProc(begin, end, search);
		model.addAttribute("gameList", gameList);
		
		String url = req.getContextPath() + "/gameProc?";
		/*
		 * if(search != "") { url+="search="+search+"&"; }
		 */
		url += "currentPage=";
		
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
	}
	
	public void gameView(int no, Model model) {
		GameDTO game = mapper.gameView(no);
		model.addAttribute("game", game);
	}
	
	public boolean gameModificationProc(GameDTO game) {
		String link = game.getLink();
		String linkU = HtmlUtils.htmlUnescape(link);
		game.setLink(linkU);
		int result = mapper.gameModificationProc(game);
		if(result == 0) {
			return false;
		}
		return true;
	}
	
}
