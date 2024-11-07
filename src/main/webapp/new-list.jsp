<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dal.ManufacterDAO.TextTruncator" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Danh sách nhà sản xuất</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:title" content="" />
    <meta property="og:type" content="" />
    <meta property="og:url" content="" />
    <meta property="og:image" content="" />
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="nest-backend/assets/imgs/theme/favicon.svg" />
    <!-- Template CSS -->
    <link href="nest-backend/assets/css/main.css?v=1.1" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="screen-overlay"></div>
<jsp:include page="bar-staff.jsp">
    <jsp:param name="page" value="listNew"/>
    <jsp:param name="menu" value="news"/>
</jsp:include>
<main class="main-wrap">
    <section class="content-main">
        <div class="content-header">
            <h2 class="content-title">News List</h2>
            <form action="ListNewsServlet" method="POST" style="display: flex;">
                <input type="text" name="search" placeholder="Search by Title..." class="form-control" value="${searchQuery}" style="flex: 1;" />
                <button type="submit" class="btn btn-primary" style="margin-left: 10px;">Search</button>
            </form>
        </div>

        <div class="card mb-4">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Date</th>
                            <th>Active</th>
                            <th class="text-end">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty newsList}">
                                <tr>
                                    <td colspan="5">No news available</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${newsList}" var="news">
                                    <tr>
                                        <td>${news.title}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${fn:length(news.content) > 40}">
                                                    ${fn:substring(news.content, 0, 40)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${news.content}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${news.time}</td>
                                        <td>${news.active ? "Yes" : "No"}</td>
                                        <td class="text-end">
                                            <a href="editNews?newsID=${news.newsID}" class="btn btn-sm font-sm rounded btn-brand">Edit</a>
                                            <a href="viewNews?newsID=${news.newsID}" class="btn btn-sm font-sm rounded btn-brand">View</a>
                                            <a href="deleteNews?newsID=${news.newsID}" class="btn btn-sm font-sm rounded btn-light" onclick="return confirm('Are you sure you want to delete this news?')">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</main>
<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/select2.min.js"></script>
<script src="nest-backend/assets/js/vendors/perfect-scrollbar.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<script type="text/javascript">
</script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>