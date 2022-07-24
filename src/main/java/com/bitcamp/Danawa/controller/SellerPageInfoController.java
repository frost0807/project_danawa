package com.bitcamp.Danawa.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
			if(spList.isEmpty()) {
				model.addAttribute("url", pageReferer(request.getHeader("referer")));
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
	
	@GetMapping("/insert")
	public String insert() {
		return "sellerPageInfo/insert";
	}
	
	@PostMapping("/insert")
	public String insert(SellerPageInfoDTO s, MultipartFile image, HttpSession session) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			String savePath="C:/Users/Junesuk/eclipse-workspace/Danawa/src/main/resources/static/img/sellerPageInfo/";
			String loadPath="/img/sellerPageInfo/";
			
			try {
				File temp=new File(savePath);
				temp.mkdirs();
				
				image.transferTo(new File(savePath+image.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			s.setLogoUrl(loadPath+image.getOriginalFilename());
			
			int sellerPageInfoId=sellerPageInfoService.insert(s);
			
			if(sellerPageInfoId!=0) {
				return "redirect:/sellerPageInfo/printOne/"+sellerPageInfoId;
			}
		}
		
		return "redirect:/sellerPageInfo/printList";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		SellerPageInfoDTO s=sellerPageInfoService.selectOne(id);
		
		model.addAttribute("s", s);
		
		return "sellerPageInfo/update";
	}
	
	@PostMapping("/update")
	public String update(SellerPageInfoDTO s, MultipartFile image, HttpSession session) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			String savePath="C:/Users/Junesuk/eclipse-workspace/Danawa/src/main/resources/static/img/sellerPageInfo/";
			String loadPath="/img/sellerPageInfo/";
			
			try {
				File temp=new File(savePath);
				temp.mkdirs();
				
				image.transferTo(new File(savePath+image.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			s.setLogoUrl(loadPath+image.getOriginalFilename());
			
			int sellerPageInfoId=sellerPageInfoService.update(s);
			
			if(sellerPageInfoId!=0) {
				return "redirect:/sellerPageInfo/printOne/"+sellerPageInfoId;
			}
		}
		
		return "redirect:/sellerPageInfo/printList";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id, Model model) {
		model.addAttribute("id", id);
		
		return "sellerPageInfo/delete";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam int id, HttpSession session) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			sellerPageInfoService.delete(id);
		}
		
		return "redirect:/sellerPageInfo/printList";
	}
	
	private String pageReferer(String referer) {
		String[] temp=referer.split("/");
		String result="";
		
		for(int i=3;i<temp.length;i++) {
			result=result+"/"+temp[i];
		}
		
		return result;
	}
}
