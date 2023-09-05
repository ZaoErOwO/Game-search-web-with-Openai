package com.icss.action;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.icss.biz.FavoritesBiz;
import com.icss.biz.GameBiz;
import com.icss.biz.NewsBiz;
import com.icss.biz.OpenAiService;
import com.icss.entity.Comments;
import com.icss.entity.Favorites;
import com.icss.entity.Game;
import com.icss.entity.GameType;
import com.icss.entity.News;
import com.icss.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class GameAction {
	
	@Autowired
	private GameBiz gameBiz;
	
	@Autowired
	private NewsBiz newsBiz;
	
	@Autowired
	private FavoritesBiz favoritesBiz;
	
	@Autowired
	private OpenAiService openAiService;

	
	
	@RequestMapping("/gamelist")
	public String getgamelist(Model model) throws Exception{
		List<Game> games = gameBiz.getAllGames();
		List<GameType> gameTypes = gameBiz.getAllTypes();
		model.addAttribute("games",games);
		model.addAttribute("gameTypes",gameTypes);
		return "/jsp/gamelibrary.jsp";
	}
	
	@RequestMapping("/gameinfo")
	public String getBookInfo(@RequestParam String gname,Model model,HttpSession session) throws Exception{
		User user = (User)session.getAttribute("user");
		Game gm = gameBiz.getGameModel(gname);
		String gameUrl = gm.getGpath();
		List<Comments> coms = gameBiz.getGameAllComments(gname);
		List<News> news3 = newsBiz.getNew0_3();
		if(user != null)
		{
			Favorites fa = favoritesBiz.getFavoriteModel(user.getUname(), gname);
			model.addAttribute("fa", fa);
		}
		model.addAttribute("coms", coms);
		model.addAttribute("news3", news3);
		model.addAttribute("gm",gm);
		model.addAttribute("gameUrl", gameUrl);
		return "/jsp/gameinfo.jsp";
	}
	
	@RequestMapping("/gametype")
	public String gettypegame(@RequestParam String tname,Model model) throws Exception{
		List<Game> games = gameBiz.getTypeGame(tname);
		List<GameType> gameTypes = gameBiz.getAllTypes();
		model.addAttribute("games",games);
		model.addAttribute("gameTypes",gameTypes);
		return "/jsp/gamelibrary.jsp";
	}
	
	@RequestMapping("/searchgame")
	public String searchGame(@RequestParam String gname, Model model) throws Exception {
	    
	    String analyzedGameName = openAiService.getGameName(gname);

	    List<Game> games = gameBiz.searchGame(analyzedGameName);
	    List<GameType> gameTypes = gameBiz.getAllTypes();
	    model.addAttribute("games", games);
	    model.addAttribute("gameTypes", gameTypes);
	    return "/jsp/gamelibrary.jsp";
	}
	
	
	@ResponseBody
	@RequestMapping("/start")
	public int start(@RequestParam String gname, Model model, HttpSession session) throws Exception {
	    int iRet = 1;
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        iRet = -1;
	    } else {
	        Game game = gameBiz.getGameModel(gname);
	        String gameUrl = game.getGpath(); 
	        String[] cmd;

	        String osName = System.getProperty("os.name").toLowerCase();

	        if (osName.contains("win")) {
	            cmd = new String[]{"cmd.exe", "/c", "start", gameUrl};
	        } else if (osName.contains("mac")) {
	            cmd = new String[]{"open", gameUrl};
	        } else {
	            cmd = new String[]{"xdg-open", gameUrl};
	        }

	        try {
	            Process process = Runtime.getRuntime().exec(cmd);
	            int exitCode = process.waitFor();

	            if (exitCode == 0) {
	                iRet = 0;
	            } else {
	                iRet = 1; // Return 1 if the application fails to start
	            }
	        } catch (IOException | InterruptedException e) {
	            iRet = 1; // Return 1 if an exception occurs
	        }
	    }
	    return iRet;
	}



}
