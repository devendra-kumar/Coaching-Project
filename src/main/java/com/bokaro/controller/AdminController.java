package com.bokaro.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {


	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registrationPage(HttpServletRequest request){
		request.setAttribute("mode", "MODE_REGISTRATION");
		return "index";
	}

	@RequestMapping(value = "/questionPage", method = RequestMethod.GET)
	public String questionPage(HttpServletRequest request){
		request.setAttribute("mode", "MODE_QUESTIONFORM");
		return "testPage";
	}
	
	@RequestMapping(value = "/questionForm", method = RequestMethod.GET)
	public String questionForm(HttpServletRequest request){
		request.setAttribute("mode", "MODE_QUESTIONFORM");
		return "questionForm";
	}
	
	@RequestMapping(value = "/questionSubmit", method = RequestMethod.POST)
	public String questionCreate(@RequestParam  HttpServletRequest request){
		return "questionForm";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String condidateRegistration(HttpServletRequest request){
		request.setAttribute("mode", "MODE_QUESTIONFORM");
		return "testPage";
	}
	
}
