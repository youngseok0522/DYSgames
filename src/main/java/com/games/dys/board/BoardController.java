package com.games.dys.board;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.games.dys.HomeController;
import com.games.dys.board.dto.GameDTO;
import com.games.dys.board.service.GameService;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired GameService service;
	
	@RequestMapping(value = "/gameProc")
	public String gameProc(Model model, 
			@RequestParam(value="currentPage", required = false, defaultValue = "1")int currentPage,
			String search, HttpServletRequest req) {
		logger.warn("gameProc");
		service.gameProc(model, currentPage, search, req);
		return "board/gameForm";
	}
	
	@RequestMapping(value = "/gameView")
	public String gameView(@RequestParam(value = "writeNo", required = false) String writeNo, Model model) {
		logger.warn("gameView");
		
		if(writeNo == null || writeNo == "") {
			return "forward:/gameProc";		
		}	
		
		int no = Integer.parseInt(writeNo);
		service.gameView(no, model);
		return "board/gameView";
	}
	
	@RequestMapping(value = "/gameRegistration")
	public String gameRegistration() {
		logger.warn("gameRegistration");
		return "board/gameRegistration";
	}
	
	@RequestMapping(value = "/gameModification")
	public String gameModification(@RequestParam(value = "No", required = false) int No, Model model) {
		logger.warn("gameModification");
		service.gameView(No, model);
		return "board/gameModification";
	}
	
	@RequestMapping(value = "/gameRegiProc")
	public String gameRegiProc(HttpServletRequest req) {
		logger.warn("gameRegiProc");
		service.gameRegiProc(req);
		return "forward:/gameProc";
	}
	
	@RequestMapping(value = "/gameModificationProc")
	public String gameModificationProc(GameDTO game){
		logger.warn("gameModificationProc");
		boolean check = service.gameModificationProc(game);
		if(check == false) {
			return "forward:/gameModification";
		}
		return "forward:/gameProc";
	}
}
