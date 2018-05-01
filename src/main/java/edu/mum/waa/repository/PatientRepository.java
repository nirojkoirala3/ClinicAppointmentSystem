package edu.mum.waa.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.waa.domain.Patient;

@Repository
public interface PatientRepository extends CrudRepository<Patient, Long> {   
	@Query("SELECT p FROM patient p WHERE p.firstName = :first_name")
	Patient findByFirstName(@Param("first_name") String firstName);
	
	@Query("SELECT p FROM patient p WHERE p.email = :email")
	Patient findByEmail(@Param("email")String email);
}