package com.enrollmate.repository;

import com.enrollmate.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Long> {

    // Custom query to fetch courses with enrolled students
    @Query("SELECT c FROM Course c JOIN FETCH c.students")
    List<Course> findAllCoursesWithStudents();
}