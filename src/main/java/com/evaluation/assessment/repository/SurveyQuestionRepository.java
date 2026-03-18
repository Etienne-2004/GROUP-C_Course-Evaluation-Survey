package com.evaluation.assessment.repository;

import com.evaluation.assessment.entity.SurveyQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SurveyQuestionRepository extends JpaRepository<SurveyQuestion, Long> {
}
