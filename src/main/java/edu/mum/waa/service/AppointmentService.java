package edu.mum.waa.service;

import java.util.List;

import edu.mum.waa.domain.Appointment;

public interface AppointmentService {
	public List<Appointment> findAll();
	public Appointment findById(long id);
	public List<Appointment> findByDoctorEmail(String email);
	public List<Appointment> findByPatientEmail(String email);
	public void save(Appointment appointment);
}