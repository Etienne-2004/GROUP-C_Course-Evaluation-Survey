package com.evaluation.assessment.service;

import com.evaluation.assessment.entity.User;
import com.evaluation.assessment.repository.UserRepository;
import com.evaluation.assessment.repository.RoleRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;

    public void registerTeacher(User user) {
        user.setRole(roleRepository.findByName("TEACHER").orElseThrow());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setApproved(false);
        userRepository.save(user);
        
        // Send registration confirmation email
        emailService.sendRegistrationConfirmation(user.getEmail(), user.getFullName(), "TEACHER");
        
        // Send admin notification
        emailService.sendAdminApprovalNotification(
            "harindintwarietiennee@gmail.com", 
            user.getFullName(), 
            user.getEmail(), 
            "TEACHER"
        );
    }

    public void registerUser(User user, String roleName) {
        user.setRole(roleRepository.findByName(roleName).orElseThrow());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        
        // Set approval status based on role
        boolean needsApproval = roleName.equals("TEACHER") || roleName.equals("INITIATOR");
        user.setApproved(!needsApproval);
        
        userRepository.save(user);
        
        // Send registration confirmation email
        emailService.sendRegistrationConfirmation(user.getEmail(), user.getFullName(), roleName);
        
        // Send admin notification if approval is needed
        if (needsApproval) {
            emailService.sendAdminApprovalNotification(
                "harindintwarietiennee@gmail.com", 
                user.getFullName(), 
                user.getEmail(), 
                roleName
            );
        }
        
        log.info("User registered: {} with role: {}, approval needed: {}", 
                user.getUsername(), roleName, needsApproval);
    }

    public List<User> getPendingTeachers() {
        return userRepository.findByApprovedFalseAndRoleName("TEACHER");
    }

    public List<User> getPendingUsers() {
        return userRepository.findByApprovedFalse();
    }

    public void approveTeacher(Long id) {
        User user = userRepository.findById(id).orElseThrow();
        user.setApproved(true);
        userRepository.save(user);
        
        // Send approval notification email
        emailService.sendAccountApprovalNotification(user.getEmail(), user.getFullName());
        
        log.info("User approved: {}", user.getUsername());
    }
    
    public List<User> getAllTeachers() {
        return userRepository.findByRoleName("TEACHER");
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username).orElse(null);
    }
}
