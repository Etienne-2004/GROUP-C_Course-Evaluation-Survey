package com.evaluation.assessment.repository;

import com.evaluation.assessment.entity.Survey;
import com.evaluation.assessment.entity.SurveyResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SurveyResponseRepository extends JpaRepository<SurveyResponse, Long> {
    List<SurveyResponse> findBySurvey(Survey survey);
}
