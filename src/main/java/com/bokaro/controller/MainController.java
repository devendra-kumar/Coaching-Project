package com.bokaro.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bokaro.dto.QuestionDTO;
import com.bokaro.dto.ResultDTO;
import com.bokaro.repository.UserRolesRepository;
import com.bokaro.service.CandidateRegistrationService;
import com.bokaro.service.QuestionService;

@Controller
public class MainController {
	
	@Autowired
	private UserRolesRepository userRolesRepository;
	@Autowired
	private CandidateRegistrationService candidateRegistrationService;
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		ModelAndView model = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		String username = userDetail.getUsername();
		List<String> role = userRolesRepository.findRoleByUserName(username);
		if(role.get(0).equalsIgnoreCase("ROLE_ADMIN")){
			model.setViewName("redirect:/admin/registration");
		}
		if(role.get(0).equalsIgnoreCase("ROLE_USER")){
			boolean isEnabled = candidateRegistrationService.findByUserName(username);
			if(isEnabled){
				model.setViewName("redirect:/instruction");
			}else{
				model.setViewName("redirect:/403");
			}
		}
		return model;
	}
	
	@RequestMapping(value = "/instruction", method = RequestMethod.GET)
	public String getInstruction(HttpServletRequest request,Locale locale,Model model){
		return "instruction";
	}
	
	@RequestMapping(value = "/testStart", method = RequestMethod.GET)
	public String getTestPaper(HttpServletRequest request,Locale locale,Model model){
		List<QuestionDTO> questionList = questionService.findAll();
		model.addAttribute("questionList", questionList);
		model.addAttribute("totalQuestion", questionList.size());
		model.addAttribute("totalTime", 9000);
		request.setAttribute("mode", "MODE_TEST");
		return "testPaper";
	}
	
	@RequestMapping(value = "/testResult", method = RequestMethod.GET)
	public String getResult(@ModelAttribute ResultDTO finalObject,
			BindingResult bindingResult,HttpServletRequest request,Locale locale,Model model, HttpServletResponse response){
		model.addAttribute("finalObject", finalObject);
		return "testResult";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");
		return model;

	}
	
	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {
		ModelAndView model = new ModelAndView();
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
			model.addObject("username", userDetail.getUsername());
		}
		model.setViewName("403");
		return model;
	}
}
