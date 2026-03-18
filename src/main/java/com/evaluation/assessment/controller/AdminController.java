package com.evaluation.assessment.controller;

import com.evaluation.assessment.entity.Course;
import com.evaluation.assessment.entity.User;
import com.evaluation.assessment.entity.Role;
import com.evaluation.assessment.repository.CourseRepository;
import com.evaluation.assessment.repository.UserRepository;
import com.evaluation.assessment.repository.RoleRepository;
import com.evaluation.assessment.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
    private final UserService userService;
    private final CourseRepository courseRepository;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    @GetMapping("/dashboard")
    public String adminDashboard(Model model) {
        model.addAttribute("pendingTeachers", userService.getPendingTeachers());
        model.addAttribute("pendingUsers", userService.getPendingUsers());
        model.addAttribute("courses", courseRepository.findAll());
        model.addAttribute("teachers", userService.getAllTeachers());
        
        // Elite Stats
        model.addAttribute("totalCourses", courseRepository.count());
        model.addAttribute("totalTeachers", userService.getAllTeachers().size());
        model.addAttribute("pendingApprovals", userService.getPendingUsers().size());
        model.addAttribute("systemHealth", "OPTIMAL");
        
        return "admin/dashboard";
    }

    @GetMapping("/courses")
    public String manageCourses(Model model) {
        model.addAttribute("courses", courseRepository.findAll());
        model.addAttribute("teachers", userService.getAllTeachers());
        return "admin/courses";
    }

    @GetMapping("/users")
    public String manageUsers(Model model) {
        model.addAttribute("pendingTeachers", userService.getPendingTeachers());
        model.addAttribute("pendingUsers", userService.getPendingUsers());
        model.addAttribute("teachers", userService.getAllTeachers());
        return "admin/users";
    }

    // CRUD Operations for Users
    @GetMapping("/users/edit/{id}")
    public String editUser(@PathVariable Long id, Model model) {
        model.addAttribute("user", userRepository.findById(id).orElseThrow());
        model.addAttribute("roles", roleRepository.findAll());
        return "admin/edit_user";
    }

    @PostMapping("/users/update/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute User user) {
        user.setId(id);
        userRepository.save(user);
        return "redirect:/admin/users";
    }

    @PostMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userRepository.deleteById(id);
        return "redirect:/admin/users";
    }

    @PostMapping("/teachers/approve/{id}")
    public String approveTeacher(@PathVariable Long id) {
        userService.approveTeacher(id);
        return "redirect:/admin/users";
    }

    // CRUD Operations for Courses
    @GetMapping("/courses/edit/{id}")
    public String editCourse(@PathVariable Long id, Model model) {
        model.addAttribute("course", courseRepository.findById(id).orElseThrow());
        model.addAttribute("teachers", userService.getAllTeachers());
        return "admin/edit_course";
    }

    @PostMapping("/courses/update/{id}")
    public String updateCourse(@PathVariable Long id, @ModelAttribute Course course) {
        course.setId(id);
        courseRepository.save(course);
        return "redirect:/admin/courses";
    }

    @PostMapping("/courses/delete/{id}")
    public String deleteCourse(@PathVariable Long id) {
        courseRepository.deleteById(id);
        return "redirect:/admin/courses";
    }

    @PostMapping("/courses/add")
    public String addCourse(@ModelAttribute Course course) {
        courseRepository.save(course);
        return "redirect:/admin/courses";
    }

    @PostMapping("/courses/assign")
    public String assignTeacher(@RequestParam Long teacherId, @RequestParam Long courseId) {
        User teacher = userRepository.findById(teacherId).orElseThrow();
        Course course = courseRepository.findById(courseId).orElseThrow();
        teacher.getCourses().add(course);
        userRepository.save(teacher);
        return "redirect:/admin/dashboard";
    }
}
