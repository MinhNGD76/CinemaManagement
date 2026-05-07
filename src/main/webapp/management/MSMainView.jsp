<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User loggedUser = (User) session.getAttribute("loggedUser");
    String greetingName = (loggedUser != null && loggedUser.getFullname() != null) ? loggedUser.getFullname() : "Management Staff";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Cinema</title>
<style>
    body { font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f9; display: flex; justify-content: center; margin: 0; padding-top: 50px; }
    .container { background-color: #fff; border: 1px solid #ccc; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 100%; max-width: 500px; text-align: center; }
    h1 { color: #333; margin-top: 0; }
    .nav-buttons { margin-top: 30px; display: flex; flex-direction: column; gap: 15px; }
    .btn-menu {
        padding: 15px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s;
    }
    .btn-menu:hover { background-color: #0056b3; }
    .btn-logout { background-color: #dc3545; }
    .btn-logout:hover { background-color: #c82333; }
</style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= greetingName %>!</h1>
        
        <div class="nav-buttons">
            <button class="btn-menu" onclick="window.location.href='MovieInfoManageView.jsp'">Movie Information Management</button>
            <button class="btn-menu btn-logout" onclick="window.location.href='../LoginView.jsp'">Logout</button>
        </div>
    </div>
</body>
</html>
