package com.evaluation.assessment.repository;

import com.evaluation.assessment.entity.Survey;
import com.evaluation.assessment.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SurveyRepository extends JpaRepository<Survey, Long> {
    List<Survey> findByInitiator(User initiator);
    List<Survey> findByCourseId(Long courseId);
    List<Survey> findByActiveTrue();
}
