package edu.mum.waa.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.waa.domain.Appointment;
import edu.mum.waa.repository.AppointmentRepository;
import edu.mum.waa.service.AppointmentService;

@Service
@Transactional
public class AppointmentServiceImpl implements AppointmentService {
	@Autowired
	AppointmentRepository appointmentRepository;

	@Override
	public List<Appointment> findAll() {
		return (List<Appointment>) appointmentRepository.findAll() ;
	}
	
	@Override
	public Appointment findById(long id) {
		return appointmentRepository.findOne(id);
	}

	@Override
	public List<Appointment> findByDoctorEmail(String email) {
		ArrayList<Appointment> appointments = new ArrayList<Appointment>();
		appointmentRepository.findByDoctorEmail(email).forEach(appointments::add);
		return appointments;
	}

	@Override
	public void save(Appointment appointment) {
		appointmentRepository.save(appointment);
		
	}

	@Override
	public List<Appointment> findByPatientEmail(String email) {
		ArrayList<Appointment> appointments = new ArrayList<Appointment>();
		appointmentRepository.findByPatientEmail(email).forEach(appointments::add);
		return appointments;
	}
}