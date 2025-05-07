<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${student.id == null ? 'Add New Student' : 'Edit Student'}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>${student.id == null ? 'Add New Student' : 'Edit Student'}</h1>

    <c:if test="${not empty message}">
        <div class="success-message">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <form:form action="${pageContext.request.contextPath}/students/save" method="post" modelAttribute="student">
        <c:if test="${student.id != null}">
            <form:hidden path="id" />
        </c:if>

        <div class="form-group">
            <label for="name">Name:</label>
            <form:input path="name" required="true" />
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <form:input path="email" type="email" required="true" />
        </div>

        <div class="form-group">
            <label>Select Courses:</label><br>
            <select name="courseIds" multiple="multiple" class="form-control">
                <c:forEach items="${courses}" var="course">
                    <option value="${course.id}"
                        <c:if test="${selectedCourseIds.contains(course.id)}">selected</c:if>>
                        ${course.title}
                    </option>
                </c:forEach>
            </select>
            <small>Hold Ctrl (or Cmd on Mac) to select multiple courses</small>
        </div>

        <div class="form-group">
            <button type="submit">Save</button>
            <a href="${pageContext.request.contextPath}/students">Cancel</a>
        </div>
    </form:form>
</body>
</html>