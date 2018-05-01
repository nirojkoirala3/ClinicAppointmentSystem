package edu.mum.waa.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.waa.domain.Appointment;
import edu.mum.waa.domain.AppointmentBookingType;
import edu.mum.waa.domain.Doctor;
import edu.mum.waa.domain.Patient;
import edu.mum.waa.domain.User;
import edu.mum.waa.exceptions.AppointmentExceptions;
import edu.mum.waa.service.AppointmentService;
import edu.mum.waa.service.DoctorService;
import edu.mum.waa.service.PatientService;
   
@Controller
public class AppointmentController {
	@Autowired
	AppointmentService appointmentService;

	@Autowired
	DoctorService doctorService;

	@Autowired
	PatientService patientService;

	@ModelAttribute("appointments")
	List<Appointment> getAllAppointments() {
		return appointmentService.findAll();
	}

	@RequestMapping("/receptionist/appointment")
	public String getAllAppointments(Model model) {
		return "appointments";
	}

	@RequestMapping(value = "/patient/appointment/create", method = RequestMethod.GET)
	public String addAppointment(@ModelAttribute("appointment") Appointment appointment) {
		return "createAppointment";
	}

	@RequestMapping(value = "/patient/appointment/create", method = RequestMethod.POST)
	public String createAnAppointMent(@Valid @ModelAttribute("appointment") Appointment appointment,
			BindingResult result, RedirectAttributes attributes) {
		if (result.hasErrors()) {
			return "createAppointment";
		}
		User user = ControllerHelper.getCurrentUser();
		Patient patient = patientService.findByEmail(user.getUsername());// the username is the email of the user
		appointment.setPatient(patient);
		appointment.setBookingtype(AppointmentBookingType.CREATED);
		appointmentService.save(appointment);
		attributes.addFlashAttribute("appointment", appointment);
		return "redirect:/patient/appointment/success";
	}

	@RequestMapping(value = "/patient/appointment/success", method = RequestMethod.GET)
	public String successAppointment(Model model) {
		return "createAppointmentSuccess";
	}

	@RequestMapping(value = "/receptionist/appointment/cancel", method = RequestMethod.GET)
	public String cancelAppointmentByid(@RequestParam("id") long id) {
		Appointment appointment = appointmentService.findById(id);
		if (appointment == null) {
			throw new AppointmentExceptions();
		}
		appointment.setBookingtype(AppointmentBookingType.CANCELED);
		appointmentService.save(appointment);
		return "redirect:/receptionist/appointment";
	}

	@RequestMapping(value = "/receptionist/appointment/confirm", method = RequestMethod.GET)
	public String selectAppointment(@RequestParam("id") long id, Model model) {
		Appointment appointment = appointmentService.findById(id);
		List<Doctor> listofDoctor = doctorService.findAllActive();
		model.addAttribute("appointment", appointment);
		model.addAttribute("listofDoctor", listofDoctor);
		return "confirmAppointment";
	}

	@RequestMapping(value = "/receptionist/appointment/confirm", method = RequestMethod.POST)
	public String confirmAppointment2(@RequestParam("id") long id,
			@Valid @ModelAttribute("appointment") Appointment appointment, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			List<Doctor> listofDoctor = doctorService.findAllActive();
			model.addAttribute("listofDoctor", listofDoctor);
			return "confirmAppointment";
		}
		Appointment savedAppointment = appointmentService.findById(appointment.getId());
		if (savedAppointment == null) {
			throw new AppointmentExceptions();
		}
		appointment.setBookingtype(AppointmentBookingType.CONFIRMED);
		appointment.setPatient(savedAppointment.getPatient());
		appointmentService.save(appointment);
		return "redirect:/receptionist/appointment";
	}
}
