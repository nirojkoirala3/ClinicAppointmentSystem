package edu.mum.waa.repository;

import org.springframework.stereotype.Repository;

import edu.mum.waa.domain.User;

import org.springframework.data.repository.CrudRepository;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	public User findUserByUsername(String username);
}