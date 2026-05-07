<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Cinema</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 40px 20px;
        display: flex;
        justify-content: center;
    }
    .manage-container {
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        width: 100%;
        max-width: 800px;
    }
    .header-actions {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
        border-bottom: 1px solid #eee;
        padding-bottom: 15px;
    }
    .header-actions h2 {
        margin: 0;
        color: #333;
        text-align: center;
    }
    .btn-add {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 4px;
        font-weight: bold;
    }
    .btn-add:hover {
        background-color: #0056b3;
    }
    .btn-back {
        background-color: #6c757d;
        color: white;
        padding: 8px 15px;
        text-decoration: none;
        border-radius: 4px;
        font-size: 14px;
    }
    .btn-back:hover {
        background-color: #5a6268;
    }
    .action-buttons {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 12px;
        margin-top: 30px;
    }
    .btn-action {
        background-color: #007bff;
        color: white;
        padding: 10px 15px;
        text-decoration: none;
        border-radius: 4px;
        font-weight: bold;
        text-align: center;
        font-size: 14px;
        display: block;
        width: 200px;
    }
    .btn-action.add {
        background-color: #28a745;
    }
    .btn-action.edit {
        background-color: #ffc107;
        color: #212529;
    }
    .btn-action.delete {
        background-color: #dc3545;
    }
    .btn-action:hover {
        opacity: 0.9;
    }
</style>
</head>
<body>
    <div class="manage-container">
        <!-- Provides a way back to the MSMainView -->
        <div style="margin-bottom: 15px;">
            <a href="MSMainView.jsp" class="btn-back">&larr; Back to Dashboard</a>
        </div>
        
        <div class="header-actions">
            <h2>Movie Information Management</h2>
        </div>

        <div class="action-buttons">
            <a href="AddMovieInfoView.jsp" class="btn-action add">Add Movie</a>
            <a href="#" class="btn-action edit">Edit Movie</a>
            <a href="#" class="btn-action delete">Delete Movie</a>
        </div>
    </div>
</body>
</html>
