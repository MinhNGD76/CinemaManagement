<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        UserDAO userDAO = new UserDAO();
        boolean isValid = userDAO.checkLogin(user);

        if (isValid) {
            String role = userDAO.getUserRole(user.getId());
            
            // Save the successfully logged in user logic to session
            session.setAttribute("loggedUser", user);
            session.setAttribute("userRole", role);
            
            if ("management".equals(role)) {
                response.sendRedirect("management/MSMainView.jsp");
            } else if ("customer".equals(role)) {
                response.sendRedirect("customer/CustomerMainView.jsp");
            } else {
                // Cannot determine role
                response.sendRedirect("LoginView.jsp?error=invalid");
            }
        } else {
            // Re-direct to login view indicating an error
            response.sendRedirect("LoginView.jsp?error=invalid");
        }
    } else {
        response.sendRedirect("LoginView.jsp");
    }
%>
