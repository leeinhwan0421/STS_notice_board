package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExceptionController {
	
	// if returned 400 Error Code
	@GetMapping("/BadRequest")
	public String BadRequestView() {
		return "error/BadRequestView";
	}
	
	// if returned 404 Error Code
	@GetMapping("/NotFound")
	public String NotFoundView() {
		return "error/NotFoundView";
	}
	
	// if returned 405 Error Code
	@GetMapping("/MethodNotAllowed")
	public String MethodNotAllowedView() {
		return "error/MethodNotAllowedView";
	}
	
	// if returned 500 Error Code
	@GetMapping("/InternalServerError")
	public String InternalServerErrorView() {
		return "error/InternalServerErrorView";
	}
}
