package edu.mum.waa.controller;

import java.io.FileNotFoundException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import edu.mum.waa.exceptions.AppointmentExceptions;

@ControllerAdvice
public class ControllerException {

	@ExceptionHandler(AppointmentExceptions.class)
	public String handleappointmentExceptions(Exception e, Model model) {
		model.addAttribute("err", false);
		return "error";
	}
	
	@ExceptionHandler(FileNotFoundException.class)
	public String handleFileExceptions(Exception e, Model model) {
		model.addAttribute("img", false);
		return "error";
	}
	
	@ExceptionHandler(Exception.class)
	public String handlecommonExceptions(Exception e, Model model) {
		model.addAttribute("err", false);
		return "error";
	}
}