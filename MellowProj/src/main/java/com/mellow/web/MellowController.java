package com.mellow.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mellow.domain.UserVO;
import com.mellow.mapper.mellowMapper;
import com.mysql.cj.Session;

// POJO임을 명시하는 어노테이션
@Controller
public class MellowController {
   
   @Autowired // self service
   mellowMapper mapper;
   
   @RequestMapping("/main.do")
   public void main() {
	   
   }
   
   @RequestMapping("/login.do")
   public String login(UserVO vo, Model model) {
	   
	   UserVO result = mapper.userLogin(vo);
	   
	   if(result!=null) {
		   System.out.println("login success!");
		   model.addAttribute("vo", vo);
	   return "../../tables";
	   }else {
		   System.out.println("login error!");
		return "../../login";
	   }
   }
  
   
}