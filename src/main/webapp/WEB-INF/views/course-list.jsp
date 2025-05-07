<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>Course List</h1>

    <c:if test="${not empty message}">
        <div class="success-message">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <div class="actions">
        <a href="${pageContext.request.contextPath}/courses/add" class="btn">Add New Course</a>
        <a href="${pageContext.request.contextPath}/courses/with-students" class="btn">View Courses With Students</a>
        <a href="${pageContext.request.contextPath}/students" class="btn">View All Students</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.id}</td>
                    <td>${course.title}</td>
                    <td>${course.description}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/courses/edit/${course.id}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>