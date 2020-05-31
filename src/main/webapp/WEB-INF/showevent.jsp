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
    <div class="row">
        <div class="col-md-4">
            <h1>Event details</h1>
            <h4>Host: ${event.getOwner().getFirst_name()} ${event.getOwner().getLast_name()}</h4>
            <h4>Date: ${event.getEvent_date()}</h4>
            <h4>Location: ${event.getLocation()}</h4>
            <h4>People Attending : ${event.getGuestList().size()}</h4>
        </div>
        <div class="col-md-4">
            <h2>Participants</h2>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Location</th>
                </tr>
                <tbody>
                <c:forEach items="${event.getGuestList()}" var="attendee" varStatus="counter">
                    <tr class="${counter.index % 2 == 0  ? 'even':'odd'}">
                        <td>${attendee.getFirst_name()} ${attendee.getLast_name()}</td>
                        <td>${attendee.getLocation()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-4">
            <h2>Message wall</h2>
            <div class="commentbox">
                <c:forEach items="${event.getComments()}" var="comment">
                    <p>${comment.getAuthor().getFirst_name()} : ${comment.getContent()}</p>
                    <hr>
                </c:forEach>
            </div>

            <form:form action="/events/${event.getId()}/addcomment" method="post" modelAttribute="comment">
                <div class="form-group">
                    <form:label path="content">Comment:</form:label>
                    <form:textarea path="content" rows="4" cols="50" cssClass="form-control"></form:textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>

        </div>
    </div>
</div>
</body>
</html>