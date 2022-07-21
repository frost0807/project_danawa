package com.bitcamp.Danawa.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.Danawa.model.CategoryDTO;
import com.bitcamp.Danawa.model.ItemDTO;
import com.bitcamp.Danawa.model.UserDTO;
import com.bitcamp.Danawa.service.CategoryService;
import com.bitcamp.Danawa.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ItemService itemService;
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/printOne/{id}")
	public String printOne(@PathVariable int id, Model model, HttpSession session) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		ItemDTO i=itemService.selectOne(id);
		
		if(logIn!=null&&logIn.getType()==1&&i!=null) {
			model.addAttribute("item", i);
			model.addAttribute("category", categoryService.getCategoryString(i.getCategoryId()));
			
			return "item/printOne";
		}
		
		return "item/printList";
	}
	
	@GetMapping("/printList")
	public String printList() {
		return "redirect:/item/printList/1";
	}
	
	@GetMapping("/printList/{pageNo}")
	public String printList(@PathVariable int pageNo, Model model, HttpSession session) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			List<ItemDTO> list=itemService.selectAll(pageNo);
			HashMap<Integer, String> categoryMap=new HashMap<>();
			
			for(ItemDTO i:list) {
				int categoryId=i.getCategoryId();
				categoryMap.put(categoryId, categoryService.getCategoryString(categoryId));
			}
			
			model.addAttribute("list", list);
			model.addAttribute("currentPage", pageNo);
			model.addAttribute("lastPageNo", itemService.selectLastPage());
			model.addAttribute("categoryMap", categoryMap);
			
			return "item/printList";
		} else {
			return "redirect:/user/logIn";
		}
	}
	
	@GetMapping("/insert")
	public String insert(Model model) {
		List<CategoryDTO> list=categoryService.selectAll();
		HashSet<String> set=new HashSet<>();
		
		for(CategoryDTO c:list) {
			set.add(c.getMainCategory());
		}
		
		model.addAttribute("mainCategory", set);
		
		return "item/insert";
	}
	
	@PostMapping("/insert")
	public String insert(ItemDTO i, MultipartFile image, String[] specKey, String[] specValue, HttpSession session) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			String savePath="C:/Users/Junesuk/eclipse-workspace/Danawa/src/main/resources/static/img/item/";
			String loadPath="/img/item/";
			
			try {
				File temp=new File(savePath);
				temp.mkdirs();
				
				image.transferTo(new File(savePath+image.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			i.setImagePath(loadPath+image.getOriginalFilename());
			String specification="";
			
			for(int j=0;j<specValue.length;j++) {
				specification+=specKey[j]+"="+specValue[j]+"/";
			}
			
			i.setSpecification(specification);
			int itemId=itemService.insert(i);
			
			if(itemId!=0) {
				return "redirect:/item/printOne/"+itemId;
			}
		}
		
		return "index";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		List<CategoryDTO> list=categoryService.selectAll();
		HashSet<String> set=new HashSet<>();

		for(CategoryDTO c:list) {
			set.add(c.getMainCategory());
		}
		
		model.addAttribute("mainCategory", set);
		model.addAttribute("item", itemService.selectOne(id));
		
		return "item/update";
	}
	
	@GetMapping("/update")
	public String update() {
		return "index";
	}
	
	@PostMapping("/update")
	public String update(ItemDTO i, MultipartFile image, String[] specKey, String[] specValue , HttpSession session) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			String savePath="C:/Users/Junesuk/eclipse-workspace/Danawa/src/main/resources/static/img/item/";
			String loadPath="/img/item/";
			
			try {
				File temp=new File(savePath);
				temp.mkdirs();
				
				image.transferTo(new File(savePath+image.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			i.setImagePath(loadPath+image.getOriginalFilename());
			String specification="";
			
			for(int j=0;j<specValue.length;j++) {
				specification+=specKey[j]+"="+specValue[j]+"/";
			}
			
			i.setSpecification(specification);
			
			int itemId=itemService.update(i);
			return "redirect:/item/printOne/"+itemId;
		} else {
			return "index";
		}
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id, Model model) {
		model.addAttribute("id", id);
		
		return "item/delete";
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "index";
	}
	
	@PostMapping("/delete")
	public String delete(int id, HttpSession session) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		
		if(logIn!=null&&logIn.getType()==1) {
			itemService.delete(id);
			
			return "redirect:/item/printList";
		} else {
			return "index";
		}
	}
	
	@ResponseBody
	@GetMapping("/category/getLarge")
	public String getLargeCategory(@RequestParam String main) {
		HashSet<String> set=new HashSet<>();
		List<CategoryDTO> list=categoryService.selectAll();
		String result="<option selected>-----------------------------</option>";
		for(CategoryDTO c:list) {
			if(c.getMainCategory().equals(main)){
				set.add(c.getLargeCategory());
			}
		}
		for(String s:set) {
			result+="<option val="+s+">"+s+"</option>";
		}
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/category/getMiddle")
	public String getMiddleCategory(@RequestParam String large) {
		HashSet<String> set=new HashSet<>();
		List<CategoryDTO> list=categoryService.selectAll();
		String result="<option selected>-----------------------------</option>";
		for(CategoryDTO c:list) {
			if(c.getLargeCategory().equals(large)){
				set.add(c.getMiddleCategory());
			}
		}
		for(String s:set) {
			result+="<option val="+s+">"+s+"</option>";
		}
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/category/getSub")
	public String getSubCategory(@RequestParam String middle) {
		HashSet<String> set=new HashSet<>();
		List<CategoryDTO> list=categoryService.selectAll();
		String result="<option selected>-----------------------------</option>";
		for(CategoryDTO c:list) {
			if(c.getMiddleCategory().equals(middle)){
				set.add(c.getSubCategory());
			}
		}
		for(String s:set) {
			result+="<option val=\""+s+"\">"+s+"</option>";
		}
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/category/getSpec")
	public String getSpecification(@RequestParam String main,
			@RequestParam String large, @RequestParam String middle,
			@RequestParam String sub) {
		CategoryDTO c=new CategoryDTO();
		c.setMainCategory(main);
		c.setLargeCategory(large);
		c.setMiddleCategory(middle);
		c.setSubCategory(sub);
		c=categoryService.selectOneByCategory(c);
		
		String result="<input type=\"hidden\" name=\"categoryId\" value=\""+c.getId()+"\">";
		String specification=c.getSpecification();
		String[] specArray=specification.split("/");
		
		for(int i=0;i<specArray.length;i++) {
			result+="<div class=\"row\">"
					+"<input type=\"hidden\" value=\""+specArray[i]+"\" name=\"specKey\">"
					+ "<div class=\"col-md-4\">"
					+ "<input type=\"text\" disabled readonly class=\"form-control-plaintext form-control-sm\""
					+ "value=\""+specArray[i]+"\"></div>"
					+ "<div class=\"col-md-8\">"
					+ "<input class=\"form-control form-control-sm\" type=\"text\" name=\"specValue\""
					+ "placeholder=\"스펙 입력\"></div>"
					+ "</div>";
		}
		
		return result;
	}
}
