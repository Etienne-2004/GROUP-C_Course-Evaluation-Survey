package com.evaluation.assessment.service;

import com.evaluation.assessment.entity.*;
import com.evaluation.assessment.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SurveyService {
    private final SurveyRepository surveyRepository;
    private final SurveyQuestionRepository questionRepository;
    private final SurveyOptionRepository optionRepository;
    private final SurveyResponseRepository responseRepository;
    private final SurveyAnswerRepository answerRepository;

    public List<Survey> getAllActiveSurveys() {
        return surveyRepository.findByActiveTrue();
    }

    public List<Survey> getInitiatorSurveys(User initiator) {
        return surveyRepository.findByInitiator(initiator);
    }
    
    public Survey createSurvey(Survey survey) {
        return surveyRepository.save(survey);
    }
    
    public void submitResponse(SurveyResponse response, List<SurveyAnswer> answers) {
        SurveyResponse savedResponse = responseRepository.save(response);
        for (SurveyAnswer answer : answers) {
            answer.setResponse(savedResponse);
            answerRepository.save(answer);
        }
    }
    
    public Survey findById(Long id) {
        return surveyRepository.findById(id).orElse(null);
    }
}
