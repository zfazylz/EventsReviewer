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
                <a class="nav-link" href="/logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <h1>Welcome, ${user.getFirst_name()} <c:out value=""/></h1>
</div>


<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2>Add event</h2>
            <p><form:errors path="event.*"/></p>
            <form:form action="/createevent" method="post" modelAttribute="event">
                <form:hidden path="owner" value="${user.getId()}"/>
                <div class="form-group">
                    <form:label path="event_name">Event name:</form:label>
                    <form:input type="text" path="event_name" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="event_name">Event name:</form:label>
                    <form:input type="date" path="event_date" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="event_name">Event name:</form:label>
                    <form:input class="dumb1" type="text" path="location" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="event_name">Event name:</form:label>
                    <form:select class="dumb2" path="country" cssClass="form-control">
                        <c:forEach items="${countries}" var="country">
                            <form:option value="${country}"></form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <button class="btn btn-primary" type="submit">Add event</button>
            </form:form>
        </div>
        <div class="col-12">
            <div class="row">
                <div class="col-md-6">
                    <h2> Here are some of the events in your country</h2>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Location</th>
                            <th>Host</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${incountry}" var="event">
                            <tr>
                                <th scope="row">
                                    <a href="/events/${event.getId()}">${event.getEvent_name()}</a>
                                </th>
                                <td>${event.getEvent_date()}</td>
                                <td>${event.getLocation()}</td>
                                <td>${event.getOwner().getLast_name()}</td>
                                <td>
                                    <c:if test="${event.getOwner().getId()==user.getId()}">
                                        <a href="/events/edit/${event.getId()}">Edit</a>
                                        <a href="/events/delete/${event.getId()}">Delete</a>
                                    </c:if>
                                    <c:if test="${event.getOwner().getId()!=user.getId()}">
                                        <c:forEach items="${event.getGuestList()}" var="guest">
                                            <c:if test="${eventsjoined.contains(event)==false}">
                                                <a href="/events/${event.getId()}/join">Join</a>
                                            </c:if>
                                            <c:if test="${guest.getId()==user.getId()}">
                                                <span> Attending </span>
                                                <a href="/events/${event.getId()}/cancel">Cancel</a>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <h2> Here are some of the events out of country</h2>
                    <table>
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Location</th>
                            <th>Country</th>
                            <th>Host</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${outofcountry}" var="event">
                            <tr>
                                <td scope="row">
                                    <a href="/events/${event.getId()}">${event.getEvent_name()}</a>
                                </td>
                                <td>${event.getEvent_date()}</td>
                                <td>${event.getLocation()}</td>
                                <td>${event.getCountry()}</td>
                                <td>${event.getOwner().getLast_name()}</td>
                                <td>
                                    <c:if test="${event.getOwner().getId()==user.getId()}">
                                        <a href="/events/edit/${event.getId()}">Edit</a>
                                        <a href="/events/delete/${event.getId()}">Delete</a>
                                    </c:if>
                                    <c:if test="${event.getOwner().getId()!=user.getId()}">
                                        <c:forEach items="${event.getGuestList()}" var="guest">
                                            <c:if test="${eventsjoined.contains(event)==false}">
                                                <a href="/events/${event.getId()}/join">Join</a>
                                            </c:if>
                                            <c:if test="${guest.getId()==user.getId()}">
                                                <span> Attending </span>
                                                <a href="/events/${event.getId()}/cancel">Cancel</a>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>
        </div>
    </div>
</div>


</body>
</html>