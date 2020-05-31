<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <a class="nav-link" href="/login">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/registration">Registration</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h1>Event Review App</h1>
            <p class="lead">Register Form</p>
        </div>
        <div class="col-md-6">
            <p><form:errors path="user.*"/></p>
            <form:form method="POST" action="/registration" modelAttribute="user">
                <div class="form-group">
                    <form:label path="first_name">First Name:</form:label>
                    <form:input type="text" path="first_name" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="last_name">Last Name:</form:label>
                    <form:input type="text" path="last_name" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="email">Email:</form:label>
                    <form:input type="email" path="email" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="location">Location:</form:label>
                    <form:input class="dumb1" type="text" path="location" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="location">Country:</form:label>
                    <form:select class="dumb2" path="country" cssClass="form-control">
                        <c:forEach items="${countries}" var="country">
                            <form:option value="${country}"></form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="form-group">
                    <form:label path="password">Password:</form:label>
                    <form:password path="password" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="passwordConfirmation">Password confirm:</form:label>
                    <form:password path="passwordConfirmation" cssClass="form-control"/>
                </div>
                <button class="btn btn-primary" type="submit">Register</button>
            </form:form>
        </div>
    </div>

</div>
</body>
</html>