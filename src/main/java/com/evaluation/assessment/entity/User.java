package com.evaluation.assessment.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, unique = true)
    private String username;
    
    @Column(nullable = false)
    private String password;
    
    @Column(nullable = false, unique = true)
    private String email;
    
    @Column(name = "full_name")
    private String fullName;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id")
    private Role role;
    
    private boolean approved;
    
    @Column(name = "registered_at", insertable = false, updatable = false)
    private LocalDateTime registeredAt;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "teacher_courses",
        joinColumns = @JoinColumn(name = "teacher_id"),
        inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    private Set<Course> courses = new HashSet<>();

    // Explicit Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }
    public boolean isApproved() { return approved; }
    public void setApproved(boolean approved) { this.approved = approved; }
    public LocalDateTime getRegisteredAt() { return registeredAt; }
    public Set<Course> getCourses() { return courses; }
    public void setCourses(Set<Course> courses) { this.courses = courses; }
}
