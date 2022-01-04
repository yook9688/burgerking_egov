package com.araise.burgerking.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() throws Exception {
		logger.info("main");
		
		return "main";
	}
	
	@RequestMapping(value = "/story.do", method = RequestMethod.GET)
	public String story() throws Exception {
		logger.info("story");
		
		return "story";
	}
	
	@RequestMapping(value = "/why.do", method = RequestMethod.GET)
	public String why_bgk() throws Exception {
		logger.info("why");
		
		return "why";
	}
	
	@RequestMapping(value = "/searchStore.do", method = RequestMethod.GET)
	public String search_store() throws Exception {
		logger.info("search store");

		return "searchStore";
	}

}
