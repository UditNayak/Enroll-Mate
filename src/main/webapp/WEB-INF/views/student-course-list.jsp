<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Students With Courses</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>Students With Enrolled Courses</h1>

    <div class="actions">
        <a href="${pageContext.request.contextPath}/students" class="btn">Back to All Students</a>
        <a href="${pageContext.request.contextPath}/courses" class="btn">View All Courses</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Email</th>
                <th>Enrolled Courses</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${students}" var="student">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>
                        <ul>
                            <c:choose>
                                <c:when test="${student.courses.size() > 0}">
                                    <c:forEach items="${student.courses}" var="course">
                                        <li>${course.title}</li>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <li><em>No courses enrolled</em></li>
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