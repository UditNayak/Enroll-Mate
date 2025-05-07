<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses With Students</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>Courses With Enrolled Students</h1>

    <div class="actions">
        <a href="${pageContext.request.contextPath}/courses" class="btn">Back to All Courses</a>
        <a href="${pageContext.request.contextPath}/students" class="btn">View All Students</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Course ID</th>
                <th>Course Title</th>
                <th>Description</th>
                <th>Enrolled Students</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.id}</td>
                    <td>${course.title}</td>
                    <td>${course.description}</td>
                    <td>
                        <ul>
                            <c:choose>
                                <c:when test="${course.students.size() > 0}">
                                    <c:forEach items="${course.students}" var="student">
                                        <li>${student.name} (${student.email})</li>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <li><em>No students enrolled</em></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>