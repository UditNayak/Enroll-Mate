package com.enrollmate.service;

import com.enrollmate.model.Course;
import java.util.List;

public interface CourseService {
    List<Course> getAllCourses();
    Course getCourseById(Long id);
    Course saveCourse(Course course);
    Course updateCourse(Course course);
    List<Course> getAllCoursesWithStudents();
}
