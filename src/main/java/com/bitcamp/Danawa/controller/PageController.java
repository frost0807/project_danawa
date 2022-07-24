package com.bitcamp.Danawa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class PageController {
	
	@GetMapping("/")
	public String setIndex(Model model) {
		return "index";
	}
	
	@GetMapping("/index")
	public String goIndex(HttpSession session){
		session.setAttribute("currentPage", "index");
		
		return "index";
	}
	
	@GetMapping("/returnToPage/{url}")
	public String returnToPage(@PathVariable String url) {
		return "redirect:"+url;
	}
}
