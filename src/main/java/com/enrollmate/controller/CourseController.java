package com.enrollmate.controller;

import com.enrollmate.model.Course;
import com.enrollmate.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseService courseService;

    // Show all courses
    @GetMapping
    public String listCourses(Model model) {
        List<Course> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses);
        return "course-list";
    }

    // Show form to add a new course
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("course", new Course());
        return "course-form";
    }

    // Save a new course or update existing one
    @PostMapping("/save")
    public String saveCourse(@ModelAttribute("course") Course course, RedirectAttributes redirectAttributes) {
        try {
            if (course.getId() != null) {
                // This is an update
                Course existingCourse = courseService.getCourseById(course.getId());
                if (existingCourse != null) {
                    // Preserve the students relationship
                    course.setStudents(existingCourse.getStudents());
                    courseService.updateCourse(course);
                    redirectAttributes.addFlashAttribute("message", "Course updated successfully");
                }
            } else {
                // This is a new course
                courseService.saveCourse(course);
                redirectAttributes.addFlashAttribute("message", "Course added successfully");
            }
            return "redirect:/courses";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error processing course: " + e.getMessage());
            return "redirect:/courses";
        }
    }

    // Show form to update course
    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Course course = courseService.getCourseById(id);
        if (course == null) {
            return "redirect:/courses";
        }
        model.addAttribute("course", course);
        return "course-form";
    }

    // Show all courses with students
    @GetMapping("/with-students")
    public String listCoursesWithStudents(Model model) {
        List<Course> coursesWithStudents = courseService.getAllCoursesWithStudents();
        model.addAttribute("courses", coursesWithStudents);
        return "course-student-list";
    }
}