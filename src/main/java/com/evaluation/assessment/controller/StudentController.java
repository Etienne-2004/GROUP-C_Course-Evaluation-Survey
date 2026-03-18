package com.evaluation.assessment.controller;

import com.evaluation.assessment.entity.Survey;
import com.evaluation.assessment.entity.User;
import com.evaluation.assessment.service.SurveyService;
import com.evaluation.assessment.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/student")
@RequiredArgsConstructor
public class StudentController {
    private final SurveyService surveyService;
    private final UserService userService;

    @GetMapping("/dashboard")
    public String studentDashboard(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        User student = userService.findByUsername(userDetails.getUsername());
        List<Survey> availableSurveys = surveyService.getAllActiveSurveys();
        
        model.addAttribute("student", student);
        model.addAttribute("surveys", availableSurveys);
        return "student/dashboard";
    }
}
