<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bookstore Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="jsp/css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">
                <i class="fas fa-book me-2"></i>Bookstore 
            </a>
            <div class="navbar-nav">
                <a class="nav-link" href="/authors">Authors</a>
                <a class="nav-link" href="/books">Books</a>
                <a class="nav-link" href="/books-with-authors">Books with Authors</a>
            </div>
        </div>
    </nav>
    <div class="container mt-4">