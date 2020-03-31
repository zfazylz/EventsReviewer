<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        table{
            min-width: 400px;
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
        {margin-left:65% ;}
        .right{margin-left:400px;}
        .commentbox{
            background: lightgrey;
            border: 1px solid black;
            padding: 5px;
            min-height:200px;
            max-height:300px;
            overflow: scroll;
        }
    </style>
</head>
<body>
<a href="/login">Login</a><br>
<a href="/registration">Registration</a><br>
<a href="/">Index</a><br>
<div class="container">
    <h1>Show event</h1>
    <p>Host: ${event.getOwner().getFirst_name()} ${event.getOwner().getLast_name()}</p>
    <p>Date: ${event.getEvent_date()}</p>
    <p>Location: ${event.getLocation()}</p>
    <p>People Attending : ${event.getGuestList().size()}</p>
    <table>
        <tr>
            <th>Name </th>
            <th>Location </th>
        </tr>
        <tbody>
        <c:forEach items="${event.getGuestList()}" var="attendee"  varStatus="counter">
            <tr class="${counter.index % 2 == 0  ? 'even':'odd'}">
                <td>${attendee.getFirst_name()} ${attendee.getLast_name()}</td>
                <td>${attendee.getLocation()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="container right">
    <h1>Message wall</h1>
    <div class ="commentbox">
        <c:forEach items="${event.getComments()}" var="comment">
            <p>${comment.getAuthor().getFirst_name()} : ${comment.getContent()}</p>
            <p>******************************************************************</p>
        </c:forEach>
    </div>

    <p>Add a Comment: </p>
    <form:form action="/events/${event.getId()}/addcomment" method="post" modelAttribute="comment">
        <form:textarea path="content" rows="4" cols="50"></form:textarea>
        <button type="submit">Submit</button>
    </form:form>
</div>


</body>
</html>