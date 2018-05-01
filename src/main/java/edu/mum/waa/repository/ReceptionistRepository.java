package edu.mum.waa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import edu.mum.waa.domain.Receptionist;
import edu.mum.waa.domain.User;

public interface ReceptionistRepository extends CrudRepository<Receptionist, Long> {
	@Query("SELECT r FROM receptionist r WHERE r.enabled = True")
	List<Receptionist> findAllActive();
	
	@Query("SELECT r.user FROM receptionist r WHERE r.id = :id")
	User getUserFromReceptionist(@Param("id") long id);
	Receptionist findFirstByEmail(@Param("email") String email);
	List<Receptionist> findAllByIdNotAndEmail(long id, String email);
}