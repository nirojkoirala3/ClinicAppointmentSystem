package edu.mum.waa.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.waa.domain.Appointment;
import edu.mum.waa.domain.Doctor;
import edu.mum.waa.domain.User;
import edu.mum.waa.service.AppointmentService;
import edu.mum.waa.service.DoctorService;

@Controller
public class DoctorController {
	@Autowired
	DoctorService doctorService;

	@Autowired
	AppointmentService appointmentService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	MessageSource messageSource;
	
	@RequestMapping(value = "/admin/doctor", method = RequestMethod.GET)
	public String list(Model model) {
		List<Doctor> doctors = doctorService.findAllActive();
		model.addAttribute("doctors", doctors);
		return "adminDoctors";
	}

	@RequestMapping(value = "/doctor/appointment", method = RequestMethod.GET)
	public String welcome(Model model) {
		User user = ControllerHelper.getCurrentUser();
		List<Appointment> appointments = appointmentService.findByDoctorEmail(user.getUsername());
		model.addAttribute("appointments", appointments);
		return "doctorAppointments";
	}

	@RequestMapping(value = "/admin/doctor/addDoctor", method = RequestMethod.GET)
	public String addDoctorPage(@ModelAttribute("addDoctor") Doctor doctor) {
		return "addDoctor";
	}

	@RequestMapping(value = "/admin/doctor/addDoctor", method = RequestMethod.POST)
	public String addDoctorToDB(@Valid @ModelAttribute("addDoctor") Doctor doctor, BindingResult result,
			Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) throws FileNotFoundException {
		if (result.hasErrors()) {
			return "addDoctor";
		}		
		MultipartFile image = doctor.getImage();
 		String rootDirectory = "C:\\Users\\Niroj\\Desktop\\WAA_Project_JDN_Team\\clinic-appointment-system\\src\\main\\webapp\\resources\\images\\";
		if(image!=null && !image.isEmpty()) {
	 		String imageFileName = image.getOriginalFilename().toLowerCase();
	 		String acceptedFileExtentions  = ".jpg .png .gif";
	 		int lastIndex = imageFileName.lastIndexOf('.');
	 		String imageFileExtension = imageFileName.substring(lastIndex, imageFileName.length());
	 		
	 		if(acceptedFileExtentions.contains(imageFileExtension)) {
				Doctor savedDoctor = doctorService.add(doctor);
				String destinationImage = rootDirectory + savedDoctor.getLastName()+"_"+ savedDoctor.getId() + ".jpg";
	 	 	   
				try {
					image.transferTo(new File(destinationImage));
				} catch (Exception e) {
					//rollback the save
					doctorService.delete(savedDoctor); 
					throw new FileNotFoundException("Unable to save file: " + image.getOriginalFilename());
				}
								
				redirectAttributes.addFlashAttribute("doctor", savedDoctor);

				return "redirect:/admin/doctor";

	 		}else {
	 			model.addAttribute("imgError", true);
	 		}
	 		

		}else {
 			model.addAttribute("imgError", true);
 		}
	
		return "addDoctor";
	}

	@RequestMapping(value = "/admin/doctor/deleteDoctor/{id}", method = RequestMethod.GET)
	public String deleteDoctor(@PathVariable("id") long id) {
		doctorService.delete(id);
		return "redirect:/admin/doctor";
	}

	@RequestMapping(value = "/admin/doctor/addDoctor/{id}", method = RequestMethod.GET)
	public String editDoctorPage(@PathVariable("id") long id, @ModelAttribute("addDoctor") Doctor doctor, Model model) {
		doctor = doctorService.findOne(id);
		model.addAttribute("addDoctor", doctor);
		return "addDoctor";
	}

	@RequestMapping(value = "/admin/doctor/addDoctor/{id}", method = RequestMethod.POST)
	public String editDoctor(@ModelAttribute("addDoctor") Doctor doctor, Model model) {
			User user = doctorService.getUserFromDoctor(doctor.getId());
			doctor.getUser().setId(user.getId());
			doctorService.edit(doctor);
			return "redirect:/admin/doctor";
	}

	@RequestMapping(value = "/doctor/doctorDetails", method = RequestMethod.GET)
	public String showDetails( Model model) {
		
		User user = ControllerHelper.getCurrentUser();
		Doctor doctor = doctorService.findByEmail(user.getUsername());
		model.addAttribute("doctor", doctor);
		return "doctorDetails";
			
	}
	
}