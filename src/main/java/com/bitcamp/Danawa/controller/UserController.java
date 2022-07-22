package com.bitcamp.Danawa.controller;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.Danawa.model.BusinessUserDTO;
import com.bitcamp.Danawa.model.GeneralUserDTO;
import com.bitcamp.Danawa.model.UserDTO;
import com.bitcamp.Danawa.service.BusinessUserService;
import com.bitcamp.Danawa.service.GeneralUserService;
import com.bitcamp.Danawa.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private GeneralUserService generalUserService;
	@Autowired
	private BusinessUserService businessUserService;
	
	@GetMapping("/signup/general")
	public String signupGeneral() {
		
		return "user/signupGeneral";
	}
	
	@GetMapping("/signup/business")
	public String signupBusiness() {
		
		return "user/signupBusiness";
	}
	
	@PostMapping("/insert/general")
	public String insertGeneral(UserDTO u, GeneralUserDTO g, Model model,
			HttpSession session) {
		u.setType(2);
		u.setPassword(convertToSha2(u.getPassword()));
		int userId=userService.insert(u);
		if(userId!=0) {
			g.setUserId(userId);
			int valid=generalUserService.insert(g);
			
			if(valid!=0) {
				model.addAttribute("message", "가입이 완료되었습니다.");
				return "index";
			} else {
				userService.delete(userId);
			}
		}		
		model.addAttribute("message", "잘못된 요청입니다. 다시 가입해 주세요");
		
		return "redirect:/user/signup/general";
	}
	
	@PostMapping("/insert/business")
	public String insertBusiness(UserDTO u, BusinessUserDTO b, Model model,
			HttpSession session) {
		u.setType(3);
		u.setPassword(convertToSha2(u.getPassword()));
		int userId=userService.insert(u);
		if(userId!=0) {
			b.setUserId(userId);
			int valid=businessUserService.insert(b);
			
			if(valid!=0) {
				model.addAttribute("message", "가입이 완료되었습니다.");
				
				return "index";
			} else {
				userService.delete(userId);
			}
		}
		model.addAttribute("message", "잘못된 요청입니다. 다시 가입해 주세요");
		
		return "redirect:/user/signup/business";
	}
	
	@GetMapping("/logIn")
	public String logIn(HttpSession session, HttpServletRequest request) {
		session.setAttribute("page",logInReferer(request.getHeader("referer")));
		
		return "user/logIn";
	}
	
	@PostMapping("/logIn")
	public String logIn(UserDTO u, HttpSession session, Model model) {
		u.setPassword(convertToSha2(u.getPassword()));
		u=userService.auth(u);
		
		if(u!=null) {
			session.setAttribute("logIn", u);
			
			String latestPage=(String)session.getAttribute("page");
			if(latestPage!=null) {
				session.removeAttribute("page");
				
				return latestPage;
			} else {
				return "index";
			}
		} else {
			model.addAttribute("message", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			
			return "redirect:/user/logIn";
		}
	}
	
	@GetMapping("/logOut")
	public String logOut(HttpSession session, HttpServletRequest request) {
		session.setAttribute("logIn", null);
		
		return "redirect:/user/logIn";
	}
	
	@GetMapping("/myPage")
	public String printOne(HttpSession session, Model model) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		
		if(logIn!=null) {
			model.addAttribute("logIn", logIn);
			
			if(logIn.getType()==2) {
				GeneralUserDTO g=generalUserService.selectOne(logIn.getId());
				
				model.addAttribute("info", g);
			} else if(logIn.getType()==3) {
				BusinessUserDTO b=businessUserService.selectOne(logIn.getId());
				
				model.addAttribute("info", b);
			}
			model.addAttribute("logIn", logIn);
			
			return "user/myPage";
		} else {
			
			return "index";
		}
	}
	@GetMapping("/update")
	public String update(HttpSession session, Model model) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		
		if(logIn!=null) {
			if(logIn.getType()==2) {
				model.addAttribute("general", generalUserService.selectOne(logIn.getId()));
			} else if(logIn.getType()==3) {
				model.addAttribute("business", businessUserService.selectOne(logIn.getId()));
			}
			
			return "user/update";
		} else {
			
			return "index";
		}
		
	}
	
	@PostMapping("/update")
	public String update(String oldPassword, String passwordCheck, UserDTO u, GeneralUserDTO g, BusinessUserDTO b, HttpSession session) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		
		if(logIn!=null) {
			if(u.getPassword().equalsIgnoreCase(passwordCheck)
					&&logIn.getPassword().equalsIgnoreCase(convertToSha2(oldPassword))) {
				logIn.setPassword(convertToSha2(u.getPassword()));
				session.setAttribute("logIn", logIn);
				
				int valid=userService.update(u);
				if(valid!=0) {
					if(logIn.getType()==2) {
						generalUserService.update(g);
					} else if(logIn.getType()==3) {
						businessUserService.update(b);
					}
				}
			}
			return "redirect:/user/myPage";
		} else {
			return "redirect:/user/logIn";
		}
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "user/delete";
	}
	
	@PostMapping("/delete")
	public String delete(String password, HttpSession session) {
		UserDTO logIn=(UserDTO)session.getAttribute("logIn");
		
		if(logIn!=null) {
			if(logIn.getPassword().equalsIgnoreCase(convertToSha2(password))) {
				userService.delete(logIn.getId());
				session.removeAttribute("logIn");
			} else {
				return "redirect:/user/delete";
			}
		}
		
		return "index";
	}
	
	private String convertToSha2(String password) {
        String converted = null;
        StringBuilder builder = null;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes("UTF-8"));

            builder = new StringBuilder();
            for (int i = 0; i < hash.length; i++) {
                builder.append(String.format("%02x", 255 & hash[i]));
            }

            converted = builder.toString();

        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return converted;
    }
	
	private String logInReferer(String referer) {
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
