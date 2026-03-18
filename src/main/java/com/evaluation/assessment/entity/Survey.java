package com.evaluation.assessment.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "surveys")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Survey {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String title;
    
    @Column(columnDefinition = "TEXT")
    private String description;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private Course course;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "initiator_id")
    private User initiator;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "access_type", nullable = false)
    private AccessType accessType;
    
    private boolean active = true;
    
    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @OneToMany(mappedBy = "survey", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SurveyQuestion> questions = new ArrayList<>();

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Course getCourse() { return course; }
    public void setCourse(Course course) { this.course = course; }
    public User getInitiator() { return initiator; }
    public void setInitiator(User initiator) { this.initiator = initiator; }
    public AccessType getAccessType() { return accessType; }
    public void setAccessType(AccessType accessType) { this.accessType = accessType; }
    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public List<SurveyQuestion> getQuestions() { return questions; }
    public void setQuestions(List<SurveyQuestion> questions) { this.questions = questions; }

    public enum AccessType {
        AUTHENTICATED, GUEST
    }
}
