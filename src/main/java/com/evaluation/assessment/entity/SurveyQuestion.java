package com.evaluation.assessment.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "survey_questions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SurveyQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "survey_id")
    private Survey survey;
    
    @Column(name = "question_text", columnDefinition = "TEXT", nullable = false)
    private String questionText;
    
    @Column(name = "order_index")
    private Integer orderIndex = 0;
    
    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SurveyOption> options = new ArrayList<>();
}
