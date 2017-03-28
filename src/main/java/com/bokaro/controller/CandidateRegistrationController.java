package com.bokaro.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bokaro.dto.CandidateRegistrationDTO;
import com.bokaro.dto.QuestionDTO;
import com.bokaro.service.CandidateRegistrationService;
import com.bokaro.service.QuestionService;

@Controller
@RequestMapping("/admin")
public class CandidateRegistrationController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CandidateRegistrationController.class);
	
	@Autowired
	private CandidateRegistrationService candidateRegistrationService;
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(value="/candidateRegistration", method=RequestMethod.POST)
	public String create(@ModelAttribute CandidateRegistrationDTO candidateRegistrationDTO, BindingResult bindingResult,
			HttpServletRequest request,Locale locale,Model model){
		candidateRegistrationDTO = candidateRegistrationService.create(candidateRegistrationDTO);
		if(candidateRegistrationDTO.getId() == null || candidateRegistrationDTO.equals("")){
			request.setAttribute("msg", "MODE_ERROR");
			model.addAttribute("message","Condidate Regiatration Failed !");
			request.setAttribute("mode", "MODE_REGISTRATION");
		}else{
			request.setAttribute("msg", "MODE_SUCCESS");
			model.addAttribute("message","Candidate Regiatration Successfully !");
			request.setAttribute("mode", "MODE_REGISTRATION");
			model.addAttribute("candidateRegistrationDTO", candidateRegistrationDTO);

		}
		return "index";
	}
	
	@RequestMapping(value = "/candidateList", method = RequestMethod.GET)
	public String condidateList(HttpServletRequest request,Locale locale,Model model){
		List<CandidateRegistrationDTO> candidateRegistrationDTOs = candidateRegistrationService.findAll();
		request.setAttribute("mode", "MODE_CADIDATELIST");
		model.addAttribute("candidateList", candidateRegistrationDTOs);
		return "index";
	}
	
	
	@RequestMapping(value="/deleteCandidate", method = RequestMethod.GET)
	public String deleteCandidate(@RequestParam Long id, HttpServletRequest request,Locale locale,Model model){
		candidateRegistrationService.delete(id);
		return "redirect:/admin/condidateList";
	}
	
	@RequestMapping(value="/createQuestion", method=RequestMethod.POST)
	public String create(@ModelAttribute QuestionDTO questionDTO,@RequestParam("language") String language, BindingResult bindingResult,
			HttpServletRequest request,Locale locale,Model model){
		questionDTO = questionService.create(questionDTO,language);
		return "questionForm";
		
	}
	
	@RequestMapping(value="/questionPaper", method=RequestMethod.GET)
	public String create(HttpServletRequest request,Locale locale,Model model){
		List<QuestionDTO> questionList = questionService.findAll();
		model.addAttribute("questionList", questionList);
		model.addAttribute("noOfSize", questionList.size());
		return "questionPaper";
		
	}
	
	@RequestMapping(value = "/permission", method = RequestMethod.GET)
	public String Submit(@RequestParam Long id,HttpServletRequest request) {
		CandidateRegistrationDTO candidateRegistrationDTO = candidateRegistrationService.findById(id);
		if(candidateRegistrationDTO.getIsEnabled()){
			candidateRegistrationDTO.setIsEnabled(false);
			candidateRegistrationDTO = candidateRegistrationService.update(candidateRegistrationDTO);
		}else{
			candidateRegistrationDTO.setIsEnabled(true);
			candidateRegistrationDTO = candidateRegistrationService.update(candidateRegistrationDTO);
		}
	    return "index";
	}
}
