package com.bitcamp.Danawa.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.Danawa.model.ItemDTO;
import com.bitcamp.Danawa.model.PostingDTO;
import com.bitcamp.Danawa.model.SellerPageInfoDTO;
import com.bitcamp.Danawa.model.UserDTO;
import com.bitcamp.Danawa.service.CategoryService;
import com.bitcamp.Danawa.service.ItemService;
import com.bitcamp.Danawa.service.PostingService;
import com.bitcamp.Danawa.service.SellerPageInfoService;

@Controller
@RequestMapping("/sellerPageInfo")
public class SellerPageInfoController {
	@Autowired
	SellerPageInfoService sellerPageInfoService;
	@Autowired
	PostingService postingService;
	@Autowired
	ItemService itemService;
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/printOne/{id}")
	public String printOne(@PathVariable int id, Model model, HttpSession session) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		SellerPageInfoDTO s=sellerPageInfoService.selectOne(id);
		PostingDTO p=postingService.selectOne(s.getPostingId());
		ItemDTO i=itemService.selectOne(s.getItemId());
		
		if(logIn!=null&&logIn.getType()==1&&s!=null) {
			model.addAttribute("s", s);
			model.addAttribute("p", p);
			model.addAttribute("i", i);
			
			return "sellerPageInfo/printOne";
		}
		
		return "redirect:/sellerPageInfo/printList";
	}
	
	@GetMapping("/printList")
	public String printList() {
		return "redirect:/sellerPageInfo/printList/1";
	}
	
	@GetMapping("/printList/{pageNo}")
	public String printList(@PathVariable int pageNo, Model model, HttpSession session,
			HttpServletRequest request) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			List<SellerPageInfoDTO> spList=sellerPageInfoService.selectAllForPage(pageNo);
			if(spList==null) {
				model.addAttribute("url", trimReferer(request.getHeader("referer")));
				model.addAttribute("message", "존재하지 않는 페이지입니다.");
				return "errorPage";
			}
			
			HashMap<Integer,String> nameMap=new HashMap<>();
			HashMap<Integer,String> categoryMap=new HashMap<>();
			
			for(SellerPageInfoDTO sp:spList) {
				ItemDTO i=itemService.selectOne(sp.getItemId());
				nameMap.put(sp.getId(), i.getName());
				categoryMap.put(sp.getId(), categoryService.getCategoryString(i.getCategoryId()));
			}
			model.addAttribute("logIn", logIn);
			model.addAttribute("spList", spList);
			model.addAttribute("currentPage", pageNo);
			model.addAttribute("lastPageNo", sellerPageInfoService.selectLastPage());
			model.addAttribute("nameMap", nameMap);
			model.addAttribute("categoryMap", categoryMap);
			
			return "sellerPageInfo/printList";
		} else {
			return "index";
		}
	}
	private String trimReferer(String referer) {
		String[] temp=referer.split("/");
		String result="";
		
		for(int i=3;i<temp.length;i++) {
			result=result+"/"+temp[i];
		}
		
		if(temp.length<5) {
			result="redirect:/index";
		} else {
			result="redirect:"+result;
		}
		
		return result;
	}
}
