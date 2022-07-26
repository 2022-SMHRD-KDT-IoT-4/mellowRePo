package com.mellow.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mellow.mapper.MelMapper;

@Controller
public class MellowController {
	@Autowired
	MelMapper mapper;

}
