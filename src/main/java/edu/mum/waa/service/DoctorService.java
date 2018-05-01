package edu.mum.waa.service;

import java.util.List;

import edu.mum.waa.domain.Doctor;
import edu.mum.waa.domain.User;

public interface DoctorService {
	List<Doctor> findAllActive();
	Doctor add(Doctor doctor);
	Doctor edit(Doctor doctor);
	void delete(long id);
	List<Doctor> findAll();
	Doctor findOne(long id);
	User getUserFromDoctor(long id);

	Doctor findByEmail(String email);
	void delete(Doctor doctor);

}