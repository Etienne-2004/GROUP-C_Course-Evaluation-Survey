package com.evaluation.assessment.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "survey_options")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SurveyOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id")
    private SurveyQuestion question;
    
    @Column(name = "option_text", nullable = false)
    private String optionText;
}
