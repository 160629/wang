<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Title</title>
    <style>
        .errorClass{color:red}
    </style>
</head>
<body>
<form:form modelAttribute="login" action="/login">
    <div>
        <form:errors path="loginName" cssClass="errorClass" element="div"></form:errors>
        <form:input path="loginName"></form:input>
    </div>
    <div>
        <form:errors path="password" cssClass="errorClass" element="div"></form:errors>
        <form:password path="password"></form:password>
    </div>
    <div>
        <form:errors path="autoLogin" cssClass="errorClass" element="div"></form:errors>
        <form:checkbox path="autoLogin"></form:checkbox>
    </div>
    <div>
        <form:hidden path="gobackURL"></form:hidden>
    </div>
    <div>
        <input type="submit" value="提交"/>
    </div>
</form:form>
</body>
</html>
