package edu.mum.waa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.waa.domain.Receptionist;
import edu.mum.waa.domain.User;
import edu.mum.waa.domain.UserRoles;
import edu.mum.waa.repository.ReceptionistRepository;
import edu.mum.waa.repository.UserRepository;
import edu.mum.waa.service.ReceptionistService;

@Service
@Transactional
public class ReceptionistServiceImpl implements ReceptionistService {
	@Autowired
	ReceptionistRepository receptionistRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Override
	public Receptionist add(Receptionist receptionist) {
		BCryptPasswordEncoder passworEncoder = new BCryptPasswordEncoder();
		User user = receptionist.getUser();
		user.setUsername(receptionist.getEmail());
		user.setRole(UserRoles.ROLE_RECEPTIONIST);
		receptionist.setEnabled(true);
		user.setEnabled(true);
		user.setPassword(passworEncoder.encode(user.getPassword()));
		return receptionistRepository.save(receptionist);
	}
	
	@Override
	public Receptionist edit(Receptionist receptionist) {
		User user = receptionist.getUser();
		User existingUser = userRepository.findOne(user.getId());
		existingUser.setUsername(receptionist.getEmail());
		String password = user.getPassword();
		if (password != null && !password.isEmpty() && !password.equals("_BLANK_")) {
			BCryptPasswordEncoder passworEncoder = new BCryptPasswordEncoder();
			existingUser.setPassword(passworEncoder.encode(password));
		}
		receptionist.setEnabled(true);
		receptionist.setUser(existingUser);
		userRepository.save(existingUser);
		return receptionistRepository.save(receptionist);
	}

	@Override
	public void delete(long id) {
		Receptionist receptionist = receptionistRepository.findOne(id);
		if (receptionist != null) {
			receptionist.setEnabled(false);
			User user = receptionist.getUser();
			user.setEnabled(false);
			receptionistRepository.save(receptionist);
			userRepository.save(user);
		}	
	}

	@Override
	public List<Receptionist> findAllActive() {
		return receptionistRepository.findAllActive();
	}

	@Override
	public Receptionist findOne(long id) {
		// TODO Auto-generated method stub
		return receptionistRepository.findOne(id);
	}

	@Override
	public User getUserFromReceptionist(long id) {
		// TODO Auto-generated method stub
		return receptionistRepository.getUserFromReceptionist(id);
	}

	@Override
	public Receptionist findByEmail(String email) {
		// TODO Auto-generated method stub
		
		return receptionistRepository.findFirstByEmail(email);
	}

	@Override
	public List<Receptionist> findAllByIdNotAndEmail(long id, String email) {
		
		return  receptionistRepository.findAllByIdNotAndEmail(id, email);
	}
	
	@Override
	public boolean emailExists(Receptionist receptionist) {
		System.out.println("receptionist.getId()" + receptionist.getId());
		if(receptionist.getId()!=0)
		{
			if(receptionistRepository.findFirstByEmail(receptionist.getEmail())!=null)
				return true;
		}
		else if(findAllByIdNotAndEmail(receptionist.getId(),receptionist.getEmail()).size()>0)
			return true;
		return false;
	}

	@Override
	public void delete(Receptionist receptionist) {
		receptionistRepository.delete(receptionist);
		
	}
}