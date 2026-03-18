package com.evaluation.assessment.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "survey_answers")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SurveyAnswer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "response_id")
    private SurveyResponse response;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id")
    private SurveyQuestion question;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "option_id")
    private SurveyOption option;
}
