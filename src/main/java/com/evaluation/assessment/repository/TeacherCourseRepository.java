package com.evaluation.assessment.repository;

import com.evaluation.assessment.entity.TeacherCourse;
import com.evaluation.assessment.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface TeacherCourseRepository extends JpaRepository<TeacherCourse, Long> {
    List<TeacherCourse> findByTeacherId(Long teacherId);
    List<TeacherCourse> findByCourseId(Long courseId);
    void deleteByTeacherIdAndCourseId(Long teacherId, Long courseId);
}
