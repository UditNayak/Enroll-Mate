<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${course.id == null ? 'Add New Course' : 'Edit Course'}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>${course.id == null ? 'Add New Course' : 'Edit Course'}</h1>

    <form:form action="${pageContext.request.contextPath}/courses/save" method="post" modelAttribute="course">
        <c:if test="${course.id != null}">
            <form:hidden path="id" />
        </c:if>

        <div class="form-group">
            <label for="title">Title:</label>
            <form:input path="title" required="true" />
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <form:textarea path="description" rows="4" cols="50" />
        </div>

        <div class="form-group">
            <button type="submit">Save</button>
            <a href="${pageContext.request.contextPath}/courses">Cancel</a>
        </div>
    </form:form>
</body>
</html>