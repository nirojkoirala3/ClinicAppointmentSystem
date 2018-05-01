package edu.mum.waa.service;

import edu.mum.waa.domain.Patient;
import edu.mum.waa.domain.User;

public interface PatientService {
	Patient findByEmail(String email);
	Patient save(Patient patient);
	User findByUsername(String email);
	void delete(Patient patient);
}