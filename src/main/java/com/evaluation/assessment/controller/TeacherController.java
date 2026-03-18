package com.evaluation.assessment.controller;

import com.evaluation.assessment.entity.Course;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/teacher")
@RequiredArgsConstructor
public class TeacherController {
    private final SurveyService surveyService;
    private final UserService userService;

    @GetMapping("/dashboard")
    public String teacherDashboard(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        User teacher = userService.findByUsername(userDetails.getUsername());
        List<Survey> allSurveys = surveyService.getAllActiveSurveys();
        List<Survey> relevantSurveys = new ArrayList<>();
        
        for (Course course : teacher.getCourses()) {
            for (Survey survey : allSurveys) {
                if (survey.getCourse().getId().equals(course.getId())) {
                    relevantSurveys.add(survey);
                }
            }
        }
        
        model.addAttribute("teacher", teacher);
        model.addAttribute("courses", teacher.getCourses());
        model.addAttribute("surveys", relevantSurveys);
        return "teacher/dashboard";
    }

    @GetMapping("/analytics")
    public String analytics(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        User teacher = userService.findByUsername(userDetails.getUsername());
        model.addAttribute("teacher", teacher);
        model.addAttribute("courses", teacher.getCourses());
        return "teacher/analytics";
    }

    @GetMapping("/results/{id}")
    public String viewResults(@PathVariable Long id, Model model) {
        model.addAttribute("survey", surveyService.findById(id));
        return "teacher/results";
    }
}
