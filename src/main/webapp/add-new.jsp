<%-- Created by IntelliJ IDEA. User: ducdx Date: 11/6/2024 Time: 6:38 AM --%>
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
                <input type="text" name="searchKeyword" placeholder="Tìm kiếm tin tức" class="form-control bg-white" />
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
                            <input type="hidden" id="news_id" name="newsID" value="" />
                        </div>
                        <div class="mb-4">
                            <label for="news_content" class="form-label">Nội dung</label>
                            <textarea class="form-control" id="news_content" name="content" required></textarea>
                        </div>
                        <div class="mb-4">
                            <label for="imagefile" class="form-label">Tải ảnh lên</label>
                            <input type="file" name="img" id="imagefile" accept="image/gif, image/jpeg, image/png" required />
                        </div>
                        <h5 style="color: red"><%= msg != null ? msg : "" %></h5>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Tạo</button>
                            <button type="button" class="btn btn-secondary mt-2" id="cancel_button" onclick="resetForm()" style="display: none;">Hủy</button>
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
                                <td class="text-end">
                                    <button class="btn btn-light rounded btn-sm font-sm">
                                        <a href="newsDelete?newsID=<%= news.getNewsID() %>"><i class="material-icons md-delete"></i>Xóa</a>
                                    </button>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5" class="text-center">Không tìm thấy tin tức</td>
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

        // Update image source (if applicable)
        const imgTag = document.getElementById("imagefile");
        imgTag.src = "Img/" + imgID;  // Assuming the image is stored in an "Img" folder

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
        document.getElementById("image_link").value = "";
        document.getElementById("news_id").value = "";
        document.getElementById("submit_button").innerText = "Tạo tin tức";
        document.getElementById("cancel_button").style.display = "none";
    }

    document.getElementById("submit_button").onclick = function() {
        if (document.getElementById("news_id").value === "") {
            alert("No news selected for update.");
            return false;  // Prevent form submission if no news ID is selected
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
