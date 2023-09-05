package com.icss.action;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import com.icss.biz.FavoritesBiz;
import com.icss.biz.GameBiz;
import com.icss.biz.UserBiz;
import com.icss.entity.Favorites;
import com.icss.entity.Game;
import com.icss.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserAction {

	@Autowired
	private FavoritesBiz favoritesBiz;
	
	@Autowired
	private UserBiz userBiz;
	
	@Autowired
	private GameBiz gameBiz;
	
	@RequestMapping("/user")
	public String getUser(@SessionAttribute User user,Model model) throws Exception{
		List<Favorites> fas = favoritesBiz.getAllFavorites(user.getUname());
		model.addAttribute("fas",fas);
		return "/jsp/individual.jsp";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/jsp/login.jsp";
	}
	
	@ResponseBody
	@PostMapping("/login")
	public int login(@RequestParam String uname, @RequestParam String pwd, HttpSession session){
		System.out.println("User Login - User Name:" + uname + ",Password：" + pwd);
		int iRet =0;
		try {
			User user = userBiz.login(uname, pwd);
			if(user != null)
			{
				System.out.println(uname + "---Log in successfully!");
				session.setAttribute("user", user);
				iRet=1;
			}
			else {
				System.out.println(uname + "---Login failed!");
				iRet = 0;
			}
		}catch (Exception e) {
			iRet=-1;
		}
		return iRet;	
	}
	@RequestMapping("/user/collection")
	public String collection(@RequestParam String gname,Model model,@SessionAttribute User user) throws Exception {
		Favorites fa = new Favorites();
		fa.setUname(user.getUname());
		fa.setFdate(new Date());
		fa.setGname(gname);
		favoritesBiz.colletion(fa);
		List<Favorites> fas = favoritesBiz.getAllFavorites(user.getUname());
		model.addAttribute("fas",fas);
		model.addAttribute("msg","Favorite Success!");
		return "/jsp/individual.jsp";	
	}	
	@RequestMapping("/user/removecollection")
	public String removecollection(@RequestParam String gname,Model model,HttpServletRequest request,@SessionAttribute User user) throws Exception{
		favoritesBiz.removecollection(user.getUname(), gname);
		Game gm = gameBiz.getGameModel(gname);
		List<Favorites> fas = favoritesBiz.getAllFavorites(user.getUname());
		model.addAttribute("fas",fas);
		model.addAttribute("msg","Favorites have been removed!");
		return "/jsp/individual.jsp";
	}

	@RequestMapping("/user/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		String url = basePath + "app/login";
		return "redirect:" + url;
	}
}
