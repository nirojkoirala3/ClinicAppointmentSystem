package edu.mum.waa.service;

import java.util.List;

import edu.mum.waa.domain.Receptionist;
import edu.mum.waa.domain.User;

public interface ReceptionistService {
	Receptionist add(Receptionist receptionist);
	Receptionist edit(Receptionist receptionist);
	void delete(long id);
	List<Receptionist> findAllActive();
	Receptionist findOne(long id);
	User getUserFromReceptionist(long id);
	Receptionist findByEmail(String email);
	List<Receptionist> findAllByIdNotAndEmail(long id, String email);
	boolean emailExists(Receptionist receptionist);
	void delete(Receptionist receptionist);
	
}