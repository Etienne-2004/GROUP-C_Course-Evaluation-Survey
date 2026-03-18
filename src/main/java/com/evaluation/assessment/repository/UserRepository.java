package com.evaluation.assessment.repository;

import com.evaluation.assessment.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    List<User> findByRoleName(String roleName);
    List<User> findByApprovedFalseAndRoleName(String roleName);
    List<User> findByApprovedFalse();
}
