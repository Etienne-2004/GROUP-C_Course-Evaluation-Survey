package com.evaluation.assessment.repository;

import com.evaluation.assessment.entity.SurveyAnswer;
import com.evaluation.assessment.entity.SurveyQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SurveyAnswerRepository extends JpaRepository<SurveyAnswer, Long> {
    List<SurveyAnswer> findByQuestion(SurveyQuestion question);
}
