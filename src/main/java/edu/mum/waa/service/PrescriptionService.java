package edu.mum.waa.service;

import java.util.List;

import edu.mum.waa.domain.Prescription;

public interface PrescriptionService {
	List<Prescription> findByPatient(long patientID);
	List<Prescription> findByAppointmentId(long appointmentId);
	Prescription save(Prescription prescription);
	void delete(long id);
	Prescription findOne(long id);
}