
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Онлайн библиотека</title>
    <link href="../css/style_main.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
   
</head>
<body>
<%
    String name = request.getParameter( "username" );
    request.getSession().setAttribute("username", name);

%>
<%@ include file="../jspf/header.jspf"%>
<%@ include file="../jspf/left_menu.jspf"%>
<%@ include file="../jspf/letters.jspf"%>





</body>
</html>
