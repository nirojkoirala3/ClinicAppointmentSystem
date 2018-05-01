package edu.mum.waa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.waa.domain.Doctor;
import edu.mum.waa.domain.User;;

@Repository
public interface DoctorRepository extends CrudRepository<Doctor, Long> {
	@Query("SELECT d FROM doctor d WHERE d.enabled = True")
	List<Doctor> findAllActive();
	
	@Query("SELECT d.user FROM doctor d WHERE d.id=:id")
	User getUserFromDoctor(@Param("id") long id);
	
	Doctor findByEmail(String email);
	
}