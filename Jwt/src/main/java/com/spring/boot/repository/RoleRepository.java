package com.spring.boot.repository;

import com.spring.boot.entities.ERole;
import com.spring.boot.entities.Role;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
	Optional<Role> findByRole(ERole role);
}
