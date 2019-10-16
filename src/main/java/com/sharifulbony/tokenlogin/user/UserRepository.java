package com.sharifulbony.tokenlogin.user;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface UserRepository extends CrudRepository<UserEntity, Integer> {
	
	UserEntity findByEmail(String email);
	UserEntity findByPersonalCode(String email);
	UserEntity findByPersonalCodeOrEmail(String  personalCode,String email);
	
}