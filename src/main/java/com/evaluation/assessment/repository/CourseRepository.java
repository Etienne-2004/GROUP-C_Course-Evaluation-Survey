package com.evaluation.assessment.repository;

import com.evaluation.assessment.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
