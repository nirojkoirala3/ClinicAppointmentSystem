package edu.mum.waa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.waa.domain.Patient;
import edu.mum.waa.domain.User;
import edu.mum.waa.domain.UserRoles;
import edu.mum.waa.repository.PatientRepository;
import edu.mum.waa.repository.UserRepository;
import edu.mum.waa.service.PatientService;

@Service
@Transactional
public class PatientServiceImpl implements PatientService {
	@Autowired
	private PatientRepository patientRepository;
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public Patient findByEmail(String email) {
		return patientRepository.findByEmail(email);
	}
	
	@Override
	public User findByUsername(String email) {
		return userRepository.findUserByUsername(email);
	}
	
	@Override
	public Patient save(Patient patient) {
		User user = patient.getUser();
		BCryptPasswordEncoder passworEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passworEncoder.encode(user.getPassword());
		patient.setConfirmedPassword(encodedPassword);
		user.setPassword(encodedPassword);
		user.setUsername(patient.getEmail());
		user.setEnabled(true);
		user.setRole(UserRoles.ROLE_PATIENT);
		return patientRepository.save(patient);
	}
	
	@Override
	public void delete(Patient patient) {
		patientRepository.delete(patient);
	}
}
