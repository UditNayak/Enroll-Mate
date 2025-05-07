<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>Student List</h1>

    <c:if test="${not empty message}">
        <div class="success-message">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <div class="actions">
        <a href="${pageContext.request.contextPath}/students/add" class="btn">Add New Student</a>
        <a href="${pageContext.request.contextPath}/students/with-courses" class="btn">View Students With Courses</a>
        <a href="${pageContext.request.contextPath}/courses" class="btn">View All Courses</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${students}" var="student">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/students/edit/${student.id}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>