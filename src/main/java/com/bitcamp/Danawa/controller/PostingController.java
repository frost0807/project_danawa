package com.bitcamp.Danawa.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.Danawa.model.CategoryDTO;
import com.bitcamp.Danawa.model.ItemDTO;
import com.bitcamp.Danawa.model.PostingDTO;
import com.bitcamp.Danawa.model.SellerPageInfoDTO;
import com.bitcamp.Danawa.model.UserDTO;
import com.bitcamp.Danawa.service.CategoryService;
import com.bitcamp.Danawa.service.ItemService;
import com.bitcamp.Danawa.service.PostingService;
import com.bitcamp.Danawa.service.SellerPageInfoService;

@Controller
@RequestMapping("/posting")
public class PostingController {
	@Autowired
	PostingService postingService;
	@Autowired
	ItemService itemService;
	@Autowired
	SellerPageInfoService sellerPageInfoService;
	@Autowired
	CategoryService categoryService;

	@GetMapping("/printOne/{id}")
	public String printOne(@PathVariable int id, Model model, HttpSession session) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		PostingDTO p = postingService.selectOne(id);
		ItemDTO i = itemService.selectOne(p.getItemId());
		CategoryDTO c = categoryService.selectOne(i.getCategoryId());
		List<SellerPageInfoDTO> spList = new ArrayList<>();
		ArrayList<Integer> priceList = new ArrayList<>();

		for (SellerPageInfoDTO sp : sellerPageInfoService.selectAll()) {
			if (sp.getPostingId() == p.getId()) {
				spList.add(sp);
				priceList.add(sp.getPrice());
			}
		}

		Collections.sort(priceList);

		if (logIn != null && logIn.getType() == 1 && p != null) {
			model.addAttribute("posting", p);
			model.addAttribute("item", i);
			model.addAttribute("category", c);
			model.addAttribute("spList", spList);
			model.addAttribute("logIn", logIn);
			if(!spList.isEmpty()) {
				model.addAttribute("lowestPrice", priceList.get(0));
			}

			return "posting/printOne";
		}

		return "redirect:/posting/printList";
	}

	@GetMapping("/printList")
	public String printList() {
		return "redirect:/posting/printList/1";
	}

	@GetMapping("/printList/{pageNo}")
	public String printList(@PathVariable int pageNo, Model model, HttpSession session,
			HttpServletRequest request) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		System.out.println("aa");
		if (logIn != null && logIn.getType() == 1) {
			List<PostingDTO> list = postingService.selectAllForPage(pageNo);
			System.out.println(list);
			if(list.isEmpty()) {
				System.out.println("bb");
				model.addAttribute("url", pageReferer(request.getHeader("referer")));
				model.addAttribute("message", "존재하지 않는 페이지입니다.");
				return "errorPage";
			}
			HashMap<Integer, String> itemNameMap = new HashMap<>();
			HashMap<Integer, String> itemSpecMap = new HashMap<>();
			HashMap<Integer, String> itemImageMap = new HashMap<>();
			HashMap<Integer, Integer> priceMap = new HashMap<>();

			for (PostingDTO p : list) {
				ItemDTO i = itemService.selectOne(p.getItemId());
				ArrayList<Integer> priceList = new ArrayList<>();
				priceList.add(2000000000);

				for (SellerPageInfoDTO sp : sellerPageInfoService.selectAll()) {
					if (sp.getPostingId() == p.getId()) {
						priceList.add(sp.getPrice());
					}
				}

				Collections.sort(priceList);
				if (priceList.get(0) == 2000000000) {
					priceMap.put(p.getId(), 0);
				} else {
					priceMap.put(p.getId(), priceList.get(0));
				}
				itemNameMap.put(i.getId(), i.getName());
				itemSpecMap.put(i.getId(), i.getSpecification());
				itemImageMap.put(i.getId(), i.getImagePath());
			}

			model.addAttribute("list", list);
			model.addAttribute("currentPage", pageNo);
			model.addAttribute("lastPageNo", postingService.selectLastPage());
			model.addAttribute("itemNameMap", itemNameMap);
			model.addAttribute("itemSpecMap", itemSpecMap);
			model.addAttribute("itemImageMap", itemImageMap);
			model.addAttribute("priceMap", priceMap);

			return "posting/printList";
			}
		return "index";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "posting/insert";
	}
	
	@PostMapping("/insert")
	public String insert(PostingDTO p, MultipartFile image, HttpSession session) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			String savePath="C:/Users/Junesuk/eclipse-workspace/Danawa/src/main/resources/static/img/posting/";
			String loadPath="/img/posting/";
			
			try {
				File temp=new File(savePath);
				temp.mkdirs();
				
				image.transferTo(new File(savePath+image.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			p.setPostImagePath(loadPath+image.getOriginalFilename());
			
			int postingId=postingService.insert(p);
			
			if(postingId!=0) {
				return "redirect:/posting/printOne/"+postingId;
			}
		}
		
		return "redirect:/posting/printList";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		model.addAttribute("posting", postingService.selectOne(id));
		
		return "posting/update";
	}
	
	@PostMapping("/update")
	public String update(PostingDTO p, HttpSession session) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			int postingId=postingService.update(p);
			if(postingId!=0) {
				return "redirect:/posting/printOne/";
			}
		}
		
		return "redirect:/posting/printList";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id, Model model) {
		model.addAttribute("posting", postingService.selectOne(id));
		
		return "posting/delete";
	}

	@PostMapping("/delete")
	public String delete(int id, HttpSession session) {
		UserDTO logIn = (UserDTO) session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			postingService.delete(id);
			
			return "redirect:/posting/printList";
		} else {
			return "index";
		}
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
