<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .container{
            display:inline-block;
            vertical-align: top;
        }
        .logout{margin-left: 90%;}
        .dumb2{width: 50px;}
        .btn
        {margin-left:65% ;}
    </style>
</head>
<body>
<a href="/login">Login</a><br>
<a href="/registration">Registration</a><br>
<a href="/">Index</a><br>
<h1> Event Name</h1>
<h2>Edit Event</h2>
<div class="container">
    <p>Name: </p>
    <p>Date:<p>
    <p>Location: </p>
</div>
<div class="container">
    <form:form action="/events/edit/${eventid}" method="post" modelAttribute="event">
        <input type="hidden" name="_method" value="put">
        <p>
            <form:errors path="event_name"/>
            <form:input type="text" path="event_name" />
        </p>
        <p>
            <form:errors path="event_date"/>
            <form:input type="date" path="event_date" value ="${event.getEvent_date()}"/>
        </p>

        <div class="container">
            <form:errors path="location"/>
            <form:input class= "dumb1" type="text" path="location"/>


            <form:errors path="country"/>
            <form:select path="country" class= "dumb2" >
                <c:forEach items="${countries}" var="country" >
                    <form:option value="${country}" />
                </c:forEach>
            </form:select>
        </div>

        <button class ="btn" type ="submit">edit</button>
    </form:form>
</div>
</body>
</html>