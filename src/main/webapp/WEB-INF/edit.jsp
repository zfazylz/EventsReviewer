<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="/bootstrap.min.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="#">Event Review</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01"
            aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="col-md-6">
        <form:form action="/events/edit/${eventid}" method="post" modelAttribute="event">
            <input type="hidden" name="_method" value="put">

            <form:errors path="event_name"/>
            <div class="form-group">
                <form:label path="event_name">Event name:</form:label>
                <form:input type="text" path="event_name" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="event_date">Event date:</form:label>
                <form:errors path="event_date"/>
                <form:input type="date" path="event_date" value="${event.getEvent_date()}" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="location">Location:</form:label>
                <form:errors path="location"/>
                <form:input class="dumb1" type="text" path="location" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="country">Country:</form:label>
                <form:errors path="country"/>
                <form:select path="country" class="dumb2" cssClass="form-control">
                    <c:forEach items="${countries}" var="country">
                        <form:option value="${country}"/>
                    </c:forEach>
                </form:select>
            </div>

            <button class="btn btn-primary" type="submit">edit</button>
        </form:form>

    </div>
</div>
</body>
</html>