package com.spring.boot.repository;

import com.spring.boot.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserRepository extends JpaRepository<User, Integer> {

    User findByEmail(String email); 
}
