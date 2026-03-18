package com.evaluation.assessment.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "survey_responses")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SurveyResponse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id")
    private Survey survey;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "respondent_id")
    private User respondent;
    
    @Column(name = "guest_email")
    private String guestEmail;
    
    @Column(name = "submitted_at", insertable = false, updatable = false)
    private LocalDateTime submittedAt;
    
    @OneToMany(mappedBy = "response", cascade = CascadeType.ALL)
    private List<SurveyAnswer> answers = new ArrayList<>();
}
