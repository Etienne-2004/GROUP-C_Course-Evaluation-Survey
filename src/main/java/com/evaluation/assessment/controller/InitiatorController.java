package com.evaluation.assessment.controller;

import com.evaluation.assessment.entity.Survey;
import com.evaluation.assessment.entity.User;
import com.evaluation.assessment.repository.SurveyRepository;
import com.evaluation.assessment.service.SurveyService;
import com.evaluation.assessment.service.UserService;
import com.evaluation.assessment.repository.CourseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/initiator")
@RequiredArgsConstructor
public class InitiatorController {
    private final SurveyService surveyService;
    private final UserService userService;
    private final CourseRepository courseRepository;
    private final SurveyRepository surveyRepository;

    @GetMapping("/dashboard")
    public String initiatorDashboard(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        User initiator = userService.findByUsername(userDetails.getUsername());
        model.addAttribute("surveys", surveyService.getInitiatorSurveys(initiator));
        model.addAttribute("courses", courseRepository.findAll());
        return "initiator/dashboard";
    }

    @PostMapping("/surveys/create")
    public String createSurvey(@AuthenticationPrincipal UserDetails userDetails, @ModelAttribute Survey survey, @RequestParam Long courseId) {
        User initiator = userService.findByUsername(userDetails.getUsername());
        survey.setInitiator(initiator);
        survey.setCourse(courseRepository.findById(courseId).orElseThrow());
        surveyService.createSurvey(survey);
        return "redirect:/initiator/dashboard";
    }

    @GetMapping("/results")
    public String allResults(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        User initiator = userService.findByUsername(userDetails.getUsername());
        model.addAttribute("surveys", surveyService.getInitiatorSurveys(initiator));
        return "initiator/results";
    }

    @GetMapping("/results/{id}")
    public String viewResults(@PathVariable Long id, Model model) {
        model.addAttribute("survey", surveyService.findById(id));
        return "initiator/results";
    }

    @GetMapping("/surveys/{id}/edit")
    public String editSurvey(@PathVariable Long id, Model model) {
        model.addAttribute("survey", surveyService.findById(id));
        model.addAttribute("courses", courseRepository.findAll());
        return "initiator/edit_survey";
    }

    @PostMapping("/surveys/update/{id}")
    public String updateSurvey(@PathVariable Long id, @ModelAttribute Survey survey) {
        survey.setId(id);
        surveyService.createSurvey(survey);
        return "redirect:/initiator/dashboard";
    }

    @PostMapping("/surveys/{id}/delete")
    public String deleteSurvey(@PathVariable Long id) {
        surveyRepository.deleteById(id);
        return "redirect:/initiator/dashboard";
    }
}
