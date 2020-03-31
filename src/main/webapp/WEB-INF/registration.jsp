<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        .container{
            display:inline-block;
            vertical-align: top;
            margin-left : 200px;
            border: 1px solid black;
            padding:20px;
            padding-top:0px;
        }
        h1
        {margin-top: 5px;}
        .btn
        {margin-left:65% ;}
        .dumb1{
            width:47%;
            display:inline-block;
        }
    </style>
    <meta charset="UTF-8">
    <title>Registration/Login Page</title>
</head>
<body>
<a href="/login">Login</a><br>
<a href="/registration">Registration</a><br>
<a href="/">Index</a><br>
<br>
<h1> Welcome!</h1>

<div class="container">
    <h1>Register!</h1>
    <p><form:errors path="user.*"/></p>
    <form:form method="POST" action="/registration" modelAttribute="user">
        <table>
            <tbody>
            <tr>
                <td>
                    <form:label path="first_name">First Name:</form:label>
                </td>
                <td>
                    <form:input type="text" path="first_name"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="last_name">Last Name:</form:label>
                </td>
                <td>
                    <form:input type="text" path="last_name"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="email">Email:</form:label>
                </td>
                <td>
                    <form:input type="email" path="email"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="location">Location:</form:label>
                </td>
                <td>
                    <form:input class= "dumb1" type="text" path="location"/>
                    <form:select class= "dumb2" path="country">
                        <c:forEach items="${countries}" var="country" >
                            <form:option value="${country}"></form:option>
                        </c:forEach>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="password">Password:</form:label>
                </td>
                <td>
                    <form:password path="password"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="passwordConfirmation">Password confirm:</form:label>
                </td>
                <td>
                    <form:password path="passwordConfirmation"/>
                </td>
            </tr>
            </tbody>
        </table>
        <button class="btn" type="submit">Register</button>
    </form:form>











</div>
<div class="container">
    <h1>Login!</h1>
    <p><c:out value="${error}" /></p>
    <form method="post" action="/login">
        <table>
            <tbody>
            <tr>
                <td>
                    <label type="email" for="email">Email</label>
                </td>
                <td>
                    <input type="text" id="email" name="email"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="password">Password</label>
                </td>
                <td>
                    <input type="password" id="password" name="password"/>
                </td>
            </tr>
            </tbody>
        </table>
        <button class="btn" type="submit">Login</button>
    </form>
</div>

</body>
</html>