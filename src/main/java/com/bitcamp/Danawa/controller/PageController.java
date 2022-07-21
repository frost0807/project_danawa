package com.bitcamp.Danawa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class PageController {
	
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
