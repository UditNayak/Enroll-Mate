package com.enrollmate.controller;

import com.enrollmate.dto.StudentFormDTO;
import com.enrollmate.model.Course;
import com.enrollmate.model.Student;
import com.enrollmate.service.StudentService;
import com.enrollmate.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private CourseService courseService;

    // Show all students
    @GetMapping
    public String listStudents(Model model) {
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        return "student-list";
    }

    // Show form to add a new student
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("courses", courseService.getAllCourses());
        return "student-form";
    }

    // Save a new student or update existing one
    @PostMapping("/save")
    public String saveStudent(@ModelAttribute("student") StudentFormDTO studentForm,
                              @RequestParam(value = "courseIds", required = false) Long[] courseIds,
                              RedirectAttributes redirectAttributes) {
        try {
            // Create or retrieve the student entity
            Student student;
            if (studentForm.getId() != null) {
                student = studentService.getStudentById(studentForm.getId());
                if (student == null) {
                    redirectAttributes.addFlashAttribute("error", "Student not found");
                    return "redirect:/students";
                }
                // Update the basic properties
                student.setName(studentForm.getName());
                student.setEmail(studentForm.getEmail());
            } else {
                // Create a new student
                student = new Student();
                student.setName(studentForm.getName());
                student.setEmail(studentForm.getEmail());
                student.setCourses(new HashSet<>());
            }

            // Create a new set of courses instead of modifying the existing one
            Set<Course> newCourses = new HashSet<>();

            // Add the selected courses to the new set
            if (courseIds != null && courseIds.length > 0) {
                for (Long courseId : courseIds) {
                    Course course = courseService.getCourseById(courseId);
                    if (course != null) {
                        newCourses.add(course);
                    }
                }
            }

            // Replace the old courses set with the new one
            student.setCourses(newCourses);

            // Save or update the student
            if (student.getId() != null) {
                studentService.updateStudent(student);
                redirectAttributes.addFlashAttribute("message", "Student updated successfully");
            } else {
                studentService.saveStudent(student);
                redirectAttributes.addFlashAttribute("message", "Student added successfully");
            }
            return "redirect:/students";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error processing student: " + e.getMessage());
            return "redirect:/students";
        }
    }

    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Student student = studentService.getStudentById(id);
        if (student == null) {
            return "redirect:/students";
        }

        List<Course> allCourses = courseService.getAllCourses();
        model.addAttribute("courses", allCourses);

        // Don't pass the student's courses collection directly to the view
        // Instead, create a detached DTO with just the information we need
        StudentFormDTO studentForm = new StudentFormDTO();
        studentForm.setId(student.getId());
        studentForm.setName(student.getName());
        studentForm.setEmail(student.getEmail());

        // Create a set of selected course IDs
        Set<Long> selectedCourseIds = new HashSet<>();
        if (student.getCourses() != null) {
            for (Course course : student.getCourses()) {
                selectedCourseIds.add(course.getId());
            }
        }

        model.addAttribute("student", studentForm);
        model.addAttribute("selectedCourseIds", selectedCourseIds);

        return "student-form";
    }

    // Show all students with enrolled courses (custom join)
    @GetMapping("/with-courses")
    public String listStudentsWithCourses(Model model) {
        model.addAttribute("students", studentService.getAllStudentsWithCourses());
        return "student-course-list";
    }
}