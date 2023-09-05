package com.icss.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.icss.biz.NewsBiz;
import com.icss.entity.News;

import jakarta.servlet.http.HttpSession;

@Controller
public class NewsAction {

	@Autowired
	private NewsBiz newsBiz;
	
	
	@RequestMapping("/newslist")
	public String getAllNews(Model model) throws Exception{
		List<News> news = newsBiz.getAllNews();
		model.addAttribute("news",news);
		return "/jsp/new.jsp";
	}
	
	@RequestMapping("/newsinfo")
	public String getBookInfo(@RequestParam String nid,Model model,HttpSession session) throws Exception{
	
		News news = newsBiz.getNewsModel(nid);
		
		model.addAttribute("news",news);
		return "/jsp/newdetail.jsp";
	}
}
