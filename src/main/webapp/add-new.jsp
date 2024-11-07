<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dal.ManufacterDAO.TextTruncator" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dal.ImgDAO" %>
<%@ page import="model.News" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.NewsDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Danh sách tin tức</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="nest-backend/assets/imgs/theme/favicon.svg" />
    <link href="nest-backend/assets/css/main.css?v=1.1" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="bar-staff.jsp">
    <jsp:param name="page" value="listNew"/>
    <jsp:param name="menu" value="news"/>
</jsp:include>
<%
    String msg = (String)session.getAttribute("msg");
    if(msg==null) msg="";
    session.removeAttribute("msg");
%>
<main class="main-wrap">
    <section class="content-main">
        <div class="content-header">
            <div>
                <h2 class="content-title card-title">Tin tức</h2>
                <p>Tạo, sửa, xóa tin tức</p>
            </div>
            <div>
                <form action="newsSearch" method="post">
                    <input type="text" name="searchKeyword" placeholder="Tìm kiếm tin tức" class="form-control bg-white" id="search_keyword" />
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </form>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <form action="newsCU" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <div class="mb-4">
                                <label for="news_title" class="form-label">Tiêu đề</label>
                                <input type="text" class="form-control" id="news_title" name="title" required />
                                <input type="hidden" id="news_id" name="newsID" value="">
                                <input type="hidden" name="staffID" value="${sessionScope.staff.staffID}" required />
                            </div>
                            <div class="mb-4">
                                <label for="news_content" class="form-label">Nội dung</label>
                                <textarea class="form-control" id="news_content" name="content" required></textarea>
                            </div>
                            <div class="mb-4">
                                <label for="imagefile" class="form-label">Tải ảnh lên</label>
                                <input type="file" name="img" id="imagefile" accept="image/gif, image/jpeg, image/png" required />
                            </div>
                            <div>
                                <label for="status">Status</label>
                                <select id="status" name="status" required>
                                    <option value="active">Active</option>
                                    <option value="nonactive">Nonactive</option>
                                </select>
                            </div>
                            <h5 style="color: red">${sessionScope.msg}</h5>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Tạo</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tiêu đề</th>
                                    <th>Nội dung</th>
                                    <th>Ảnh</th>
                                    <th>Thời gian</th>
                                    <th>Trạng thái</th>
                                    <th class="text-end">Xóa</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<News> newsList = (List<News>) request.getAttribute("newsList");
                                    if (newsList != null && !newsList.isEmpty()) {
                                        ImgDAO imgdao = new ImgDAO();
                                        for (News news : newsList) {
                                %>
                                <tr>
                                    <td onclick="populateForm('<%= news.getNewsID() %>', '<%= news.getTitle() %>', '<%= news.getContent() %>', '<%= news.getImgID() %>')"><%= news.getNewsID() %></td>
                                    <td onclick="populateForm('<%= news.getNewsID() %>', '<%= news.getTitle() %>', '<%= news.getContent() %>', '<%= news.getImgID() %>')">
                                        <b><%= news.getTitle() %></b></td>
                                    <td><%= news.getContent() %></td>
                                    <td><img src="Img/<%= imgdao.getImgLinkByID(news.getImgID()) %>" alt="Image" style="width: 100px; height: auto;"></td>
                                    <td><%= news.getTime() %></td>
                                    <td><%= news.getActive() ? "Hoạt động" : "Không hoạt động" %></td>
                                    <td class="text-end">
                                        <form action="addNew" method="post" style="display:inline;">
                                            <input type="hidden" name="deleteID" value="<%= news.getNewsID() %>" />
                                            <button class="btn btn-light rounded btn-sm font-sm">
                                                <a href="newsDelete?newsID=<%= news.getNewsID() %>"><i class="material-icons md-delete"></i>Xóa</a>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="7" class="text-center">Không tìm thấy tin tức</td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<script>
    function populateForm(newsID, title, content, imgID) {
        document.getElementById("news_title").value = title;
        document.getElementById("news_content").value = content;
        document.getElementById("news_id").value = newsID;

        const imgTag = document.getElementById("imagefile");
        imgTag.src = "Img/" + imgID;

        document.getElementById("submit_button").innerText = "Cập nhật tin tức";
        document.getElementById("cancel_button").style.display = "block";
    }

    function validateForm() {
        const titleField = document.getElementById("news_title");
        const contentField = document.getElementById("news_content");
        if (titleField.value.trim() === "" || contentField.value.trim() === "") {
            alert("Hãy điền toàn bộ thông tin vào phần input");
            return false;
        }
        return true;
    }

    function resetForm() {
        document.getElementById("news_title").value = "";
        document.getElementById("news_content").value = "";
        document.getElementById("imagefile").value = "";
        document.getElementById("news_id").value = "";
        document.getElementById("submit_button").innerText = "Tạo tin tức";
        document.getElementById("cancel_button").style.display = "none";
    }

    document.getElementById("submit_button").onclick = function() {
        if (document.getElementById("news_id").value === "") {
            alert("No news selected for update.");
            return false;
        }
    };
</script>

<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/select2.min.js"></script>
<script src="nest-backend/assets/js/vendors/perfect-scrollbar.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>
