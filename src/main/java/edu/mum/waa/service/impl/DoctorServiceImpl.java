package edu.mum.waa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.waa.domain.Doctor;
import edu.mum.waa.domain.User;
import edu.mum.waa.domain.UserRoles;
import edu.mum.waa.repository.DoctorRepository;
import edu.mum.waa.repository.UserRepository;
import edu.mum.waa.service.DoctorService;

@Service
@Transactional
public class DoctorServiceImpl implements DoctorService {
	@Autowired
	DoctorRepository doctorRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Override
	public List<Doctor> findAllActive(){
		return doctorRepository.findAllActive();
	}
	
	
	@Override
	public List<Doctor> findAll(){
		return  (List<Doctor>) doctorRepository.findAll();
	}

	@Override
	public Doctor add(Doctor doctor) {
		BCryptPasswordEncoder passworEncoder = new BCryptPasswordEncoder();
		User user = doctor.getUser();
		user.setUsername(doctor.getEmail());
		user.setRole(UserRoles.ROLE_DOCTOR);
		doctor.setEnabled(true);
		user.setEnabled(true);
		user.setPassword(passworEncoder.encode(user.getPassword()));		
		return doctorRepository.save(doctor);
	}
	
	@Override
	public Doctor edit(Doctor doctor) {
		User user = doctor.getUser();
		User existingUser = userRepository.findOne(user.getId());
		existingUser.setUsername(doctor.getEmail());
		String password = user.getPassword();
		if (password != null && !password.isEmpty() && !password.equals("_BLANK_")) {
			BCryptPasswordEncoder passworEncoder = new BCryptPasswordEncoder();
			existingUser.setPassword(passworEncoder.encode(password));
		}
		doctor.setEnabled(true);
		doctor.setUser(existingUser);
		userRepository.save(existingUser);
		return doctorRepository.save(doctor);
	}

	@Override
	public void delete(long id) {
		Doctor doctor = doctorRepository.findOne(id);
		if(doctor != null) {
			doctor.setEnabled(false);
			User user = doctor.getUser();
			user.setEnabled(false);
			doctorRepository.save(doctor);
			userRepository.save(user);
		}
	}


	@Override
	public Doctor findOne(long id) {
		
		return doctorRepository.findOne(id);
	}


	@Override
	public User getUserFromDoctor(long id) {
		return doctorRepository.getUserFromDoctor(id);
	}


	@Override
	public Doctor findByEmail(String email) {
		// TODO Auto-generated method stub
		Doctor d = doctorRepository.findByEmail(email);
		return d;
	}
	@Override
	public void delete(Doctor doctor) {
		doctorRepository.delete(doctor);
	}
	
	

}