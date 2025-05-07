package com.enrollmate.service;

import com.enrollmate.model.Student;
import java.util.List;

public interface StudentService {
    List<Student> getAllStudents();
    Student getStudentById(Long id);
    Student saveStudent(Student student);
    Student updateStudent(Student student);
    List<Student> getAllStudentsWithCourses();
}