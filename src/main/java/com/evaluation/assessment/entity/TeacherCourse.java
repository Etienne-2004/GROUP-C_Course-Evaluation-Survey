package com.evaluation.assessment.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "teacher_courses")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TeacherCourse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "teacher_id")
    private User teacher;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private Course course;
}
