<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="/bootstrap.min.css"/>
</head>
<body>
<a href="/login">Login</a><br>
<a href="/registration">Registration</a><br>
<a href="/">Index</a><br>
<h1>Login</h1>
<p><c:out value="${error}" /></p>
<form method="post" action="/login">
    <p>
        <label type="email" for="email">Email</label>
        <input type="text" id="email" name="email"/>
    </p>
    <p>
        <label for="password">Password</label>
        <input type="password" id="password" name="password"/>
    </p>
    <input type="submit" value="Login!"/>
</form>
</body>
</html>