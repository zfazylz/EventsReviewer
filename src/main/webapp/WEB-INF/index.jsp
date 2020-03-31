<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        table{
            min-width: 1200px;
        }
        td{
            padding:5px;
        }
        .odd
        {background-color: #F8F8F8;}
        .even
        {background-color:	#D8D8D8;}
        .container{
            display:inline-block;
            vertical-align: top;
        }
        .logout{margin-left: 90%;}
        .dumb2{width: 50px;}
        .btn
        {margin-left:65%;}

    </style>
</head>
<body>
<a href="/login">Login</a><br>
<a href="/registration">Registration</a><br>
<a href="/">Index</a><br>
<div class="container">
    <a  class="logout" href="/logout">Logout</a>
    <h1>Welcome, ${user.getFirst_name()} <c:out value="" /></h1>
</div>


<h3> Here are some of the events in your country</h3>
<c:forEach items="${incountry}" var ="event">
<p>${event.getEvent_name()}<p>
    </c:forEach>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Date</th>
        <th>Location</th>
        <th>Host</th>
        <th>Action / Status</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${incountry}" var ="event">
        <tr>
            <td>
                <a href="/events/${event.getId()}">${event.getEvent_name()}</a>
            </td>
            <td>${event.getEvent_date()}</td>
            <td>${event.getLocation()}</td>
            <td>${event.getOwner().getLast_name()}</td>
            <td>
                <c:if test="${event.getOwner().getId()==user.getId()}">
                    <a href="/events/edit/${event.getId()}">Edit</a>
                    <a href="/events/delete/${event.getId()}">Delete</a>
                </c:if>
                <c:if test="${event.getOwner().getId()!=user.getId()}">
                    <c:forEach items="${event.getGuestList()}" var= "guest">
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

<h3> Here are some of the events out of country</h3>
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
    <c:forEach items="${outofcountry}" var ="event">
        <tr>
            <td>
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
                    <c:forEach items="${event.getGuestList()}" var= "guest">
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

<h1>Create an Event</h1>
<p><form:errors path="event.*"/></p>
<div class="container">
    <p>Event Name: </p>
    <p>Date:<p>
    <p>Location: </p>
</div>
<div class="container">
    <form:form action="/createevent" method="post" modelAttribute="event">
        <form:hidden path="owner" value="${user.getId()}"/>
        <p>
            <form:input type="text" path="event_name" />
        </p>
        <p>
            <form:input type="date" path ="event_date"/>
        </p>
        <div class="container">
            <form:input class= "dumb1" type="text" path ="location" />

            <form:select class= "dumb2" path ="country">
                <c:forEach items="${countries}" var="country" >
                    <form:option value="${countries}"></form:option>
                </c:forEach>
            </form:select>
        </div>
        <button class ="btn" type ="submit">Submit</button>
    </form:form>
</div>


</body>
</html>