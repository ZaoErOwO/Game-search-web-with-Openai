package com.icss.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.icss.biz.GameBiz;
import com.icss.biz.NewsBiz;
import com.icss.entity.News;

@Controller
public class SearchAction {
	
	@Autowired
	private GameBiz gameBiz;
	
	@Autowired
	private NewsBiz newsBiz;
	
	@RequestMapping("/search")
	public String getSearch(Model model) throws Exception{	
		List<News> news1 = newsBiz.getNew0_4();
		List<News> news2 = newsBiz.getNew4_8();
		model.addAttribute("news1", news1);
		model.addAttribute("news2", news2);
		return "/jsp/search.jsp";
	}

}
