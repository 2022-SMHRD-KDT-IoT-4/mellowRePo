package com.mellow.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mellow.mapper.mellowMapper;

@Controller
public class WebViewController {
	@Autowired // self service
	mellowMapper mapper;

	@RequestMapping("/viewRegist.do")
	public String viewRegist() {

		return "../../cos_register2";
	}
}
