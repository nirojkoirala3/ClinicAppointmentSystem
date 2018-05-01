package edu.mum.waa.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import edu.mum.waa.domain.Appointment;
import edu.mum.waa.domain.Prescription;
import edu.mum.waa.service.AppointmentService;
import edu.mum.waa.service.PrescriptionService;

@Controller
@RequestMapping("/doctor/prescription")
public class PrescriptionController {
	@Autowired
	PrescriptionService prescriptionService;

	@Autowired
	AppointmentService appointmentService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String get(@RequestParam("appointmentId") long appointmentId, Model model) {
		Appointment appointment = appointmentService.findById(appointmentId);
		model.addAttribute("appointment", appointment);
		List<Prescription> prescriptions = prescriptionService.findByAppointmentId(appointmentId);
		model.addAttribute("prescriptions", prescriptions);
		return "doctorPrescriptions";
	}
	
	@RequestMapping(value = "/addPrescription", method = RequestMethod.GET)
	public String displayPrescriptionPageToAdd(@ModelAttribute("addPrescription") Prescription prescription,
			@RequestParam long appointmentId, Model model) {
		Appointment appointment = appointmentService.findById(appointmentId);
		model.addAttribute("appointment", appointment);
		return "addPrescription";
	}

	@RequestMapping(value = "/addPrescription", method = RequestMethod.POST)
	public String savePrescription(@Valid @ModelAttribute("addPrescription") Prescription prescription) {
		prescriptionService.save(prescription);
		return "redirect:/doctor/prescription?appointmentId="+prescription.getAppointment().getId();
	}
	
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editPrescriptionPage(@ModelAttribute("addPrescription") Prescription prescription,
			@PathVariable long id,Model model) {
		prescription = prescriptionService.findOne(id);
		model.addAttribute("addPrescription", prescription);
		return "addPrescription";
	}
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String editPrescriptionSave(@PathVariable("id") long id, @ModelAttribute("addPrescription") Prescription prescription,Model model) {
		prescription.setId(id);
		prescriptionService.save(prescription);
		return "redirect:/doctor/prescription?appointmentId="+prescription.getAppointment().getId();
	}
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deletePrescription(@PathVariable("id") long id) {
		Prescription prescription = prescriptionService.findOne(id);
		prescriptionService.delete(id);
		return "redirect:/doctor/prescription?appointmentId="+prescription.getAppointment().getId();
	}
	
}