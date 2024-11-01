<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8" />
    <title>Nest - Multipurpose eCommerce HTML Template</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="nest-frontend/assets/imgs/theme/favicon.svg" />
    <link rel="stylesheet" href="nest-frontend/assets/css/plugins/slider-range.css" />
    <link rel="stylesheet" href="nest-frontend/assets/css/main.css?v=4.0" />
</head>


<body>
<%@ page import="java.util.List" %>
<%@ page import="dal.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="model.Account" %>
<%@ page import="dal.CategoryDAO" %>
<%@ page import="model.Category" %>
<%@ page import="java.util.ArrayList" %>
<%
    // Khởi tạo DAO và lấy danh sách tất cả các danh mục
    CategoryDAO categoryDAO = new CategoryDAO();
    List<Category> allCategories = categoryDAO.getAllCategories();

    // Phân trang cho danh mục
    int pageSize1 = 5; // Số danh mục trên mỗi trang
    int totalCategories = allCategories.size();
    int totalPages1 = (int) Math.ceil((double) totalCategories / pageSize1);
    int currentPage = 1;

    // Lấy trang hiện tại từ tham số yêu cầu
    if (request.getParameter("categoryPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("categoryPage"));
    }

    // Tính chỉ số bắt đầu và lấy danh sách danh mục để hiển thị
    int startIndex = (currentPage - 1) * pageSize1;
    List<Category> categoriesToShow = new ArrayList<>();
    if (startIndex < totalCategories) {
        for (int i = startIndex; i < Math.min(startIndex + pageSize1, totalCategories); i++) {
            categoriesToShow.add(allCategories.get(i));
        }
    }

    // Lấy tên tài khoản từ session
    String accountName = "";
    try {
        accountName = ((Account) session.getAttribute("account")).getName();
    } catch (NullPointerException e) {
        accountName = "";
    }

    // Khởi tạo các biến cho phân trang sản phẩm
    int page1 = 1;
    int pageSize = 50;
    if (request.getParameter("page") != null) {
        page1 = Integer.parseInt(request.getParameter("page"));
    }
    if (request.getParameter("pageSize") != null) {
        pageSize = Integer.parseInt(request.getParameter("pageSize"));
    }

    // Lấy categoryID từ tham số yêu cầu
    int categoryID = 0; // 0 có nghĩa là tất cả các danh mục
    if (request.getParameter("categoryID") != null) {
        categoryID = Integer.parseInt(request.getParameter("categoryID"));
    }

    // Lấy tùy chọn sắp xếp từ tham số yêu cầu
    String sortOption = request.getParameter("sort");
    if (sortOption == null || (!sortOption.equals("Price") && !sortOption.equals("Name"))) {
        sortOption = "Name"; // Thiết lập tùy chọn sắp xếp mặc định
    }

    // Lấy tham số tìm kiếm từ yêu cầu
    String searchTerm = request.getParameter("searchTerm");

    // Khởi tạo DAO cho sản phẩm và lấy danh sách sản phẩm
    ProductDAO productDAO = new ProductDAO();
    int totalProducts = productDAO.countProductsByCategoryAndSearch(categoryID, searchTerm);
    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
    boolean ascending = true; // Thiết lập chế độ sắp xếp mặc định là tăng dần
    List<Product> products = productDAO.getProductsByPageAndSort(categoryID, page1, pageSize, sortOption, ascending, searchTerm);
%>

<jsp:include page="header.jsp">
    <jsp:param name="accountName" value="<%=accountName%>"/>
</jsp:include>


<div class="container mb-30">
    <div class="row flex-row-reverse">
        <div class="col-lg-4-5">
            <div class="shop-product-fillter">
                <div class="totall-product">
                    <p>We found <strong class="text-brand"><%= totalProducts %></strong> items for you!</p>
                </div>
                <div class="mobile-search search-style-3 mobile-header-border">
                    <form action="" method="get">
                        <input type="text" name="searchTerm" placeholder="Search for items" />
                        <input type="hidden" name="categoryID" value="<%= categoryID %>" />
                        <input type="hidden" name="sort" value="<%= sortOption %>" />
                        <input type="hidden" name="page" value="1" />
                        <button type="submit"><i class="fi-rs-search"></i></button>
                    </form>
                </div>
                <div class="sort-by-product-area">
                    <div class="sort-by-cover mr-10">
                        <div class="sort-by-product-wrap">
                            <div class="sort-by">
                                <span><i class="fi-rs-apps"></i>Show:</span>
                            </div>
                            <div class="sort-by-dropdown-wrap">
                                <span><%= pageSize %> <i class="fi-rs-angle-small-down"></i></span>
                            </div>
                        </div>
                        <div class="sort-by-dropdown">
                            <ul>
                                <li><a class="<%= pageSize == 50 ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=50&page=1">50</a></li>
                                <li><a class="<%= pageSize == 100 ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=100&page=1">100</a></li>
                                <li><a class="<%= pageSize == 150 ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=150&page=1">150</a></li>
                                <li><a class="<%= pageSize == 200 ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=200&page=1">200</a></li>
                                <li><a class="<%= pageSize == totalProducts ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=<%= totalProducts %>&page=1">All</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="sort-by-cover">
                        <div class="sort-by-product-wrap">
                            <div class="sort-by">
                                <span><i class="fi-rs-apps-sort"></i>Sort by:</span>
                            </div>
                            <div class="sort-by-dropdown-wrap">
                                <span><%= sortOption %> <i class="fi-rs-angle-small-down"></i></span>
                            </div>
                        </div>
                        <div class="sort-by-dropdown">
                            <ul>
                                <li><a class="<%= sortOption.equals("featured") ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=<%= pageSize %>&sort=featured&page=1">Featured</a></li>
                                <li><a class="<%= sortOption.equals("priceLowToHigh") ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=<%= pageSize %>&sort=priceLowToHigh&page=1">Price: Low to High</a></li>
                                <li><a class="<%= sortOption.equals("priceHighToLow") ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=<%= pageSize %>&sort=priceHighToLow&page=1">Price: High to Low</a></li>
                                <li><a class="<%= sortOption.equals("nameAscending") ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=<%= pageSize %>&sort=nameAscending&page=1">Name: A to Z</a></li>
                                <li><a class="<%= sortOption.equals("nameDescending") ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=<%= pageSize %>&sort=nameDescending&page=1">Name: Z to A</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row product-grid-4">
                <% if (products != null && !products.isEmpty()) {
                    for (Product product : products) {
                        List<String> images = productDAO.getProductImages(product.getProductID());
                        String defaultImageUrl = images.size() > 0 ? images.get(0) : "default-image.jpg";
                        String hoverImageUrl = images.size() > 1 ? images.get(1) : defaultImageUrl;
                %>
                <jsp:include page="product-box.jsp">
                    <jsp:param name="category" value="<%= product.getCategoryID().toString() %>" />
                    <jsp:param name="name" value="<%= product.getName() %>" />
                    <jsp:param name="manufacturer" value="<%= product.getManufacturerID().toString() %>" />
                    <jsp:param name="star" value="4" />
                    <jsp:param name="discount" value='<%= product.getDiscountID() != null ? product.getDiscountID().toString() : "0" %>' />
                    <jsp:param name="price" value="<%= product.getPrice().toString() %>" />
                    <jsp:param name="productID" value="<%= product.getProductID().toString() %>" />
                    <jsp:param name="imageUrl" value="<%= defaultImageUrl %>" />
                    <jsp:param name="hoverImageUrl" value="<%= hoverImageUrl %>" />
                </jsp:include>
                <%
                    }
                } else {
                %>
                <p>No products available.</p>
                <% } %>
            </div>


            <div class="pagination-area mt-20 mb-20">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-start">
                        <li class="page-item <%= page1 == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="?page=<%= page1 - 1 %>&pageSize=<%= pageSize %>&categoryID=<%= categoryID %>&sort=<%= sortOption %>">
                                <i class="fi-rs-arrow-small-left"></i>
                            </a>
                        </li>
                        <% for (int i = 1; i <= totalPages; i++) { %>
                        <li class="page-item <%= page1 == i ? "active" : "" %>">
                            <a class="page-link" href="?page=<%= i %>&pageSize=<%= pageSize %>&categoryID=<%= categoryID %>&sort=<%= sortOption %>"><%= i %></a>
                        </li>
                        <% } %>
                        <li class="page-item <%= page1 == totalPages ? "disabled" : "" %>">
                            <a class="page-link" href="?page=<%= page1 + 1 %>&pageSize=<%= pageSize %>&categoryID=<%= categoryID %>&sort=<%= sortOption %>">
                                <i class="fi-rs-arrow-small-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>


        <div class="col-lg-1-5 primary-sidebar sticky-sidebar">
            <div class="sidebar-widget">
                <h5 class="sidebar-title">Categories</h5>
                <ul class="categories">
                    <% for (Category category : categoriesToShow) { %>
                    <li>
                        <a href="?categoryID=<%= category.getCategoryID() %>&page=1">
                            <%= category.getName() %>
                        </a>
                        <span class="product-count">
   <%
       // Giả sử bạn có phương thức getProductCountByCategory trong DAO
       int productCount = productDAO.countProductsByCategory(category.getCategoryID());
   %>
   (<%= productCount %>)
</span>
                    </li>
                    <% } %>
                </ul>


                <!-- Phân trang cho danh mục -->
                <div class="pagination-area mt-20 mb-20">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-start">
                            <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                                <a class="page-link" href="?categoryPage=<%= currentPage - 1 %>">
                                    <i class="fi-rs-arrow-small-left"></i>
                                </a>
                            </li>
                            <% for (int i = 1; i <= totalPages; i++) { %>
                            <li class="page-item <%= currentPage == i ? "active" : "" %>">
                                <a class="page-link" href="?categoryPage=<%= i %>"><%= i %></a>
                            </li>
                            <% } %>
                            <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                                <a class="page-link" href="?categoryPage=<%= currentPage + 1 %>">
                                    <i class="fi-rs-arrow-small-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
    </div>
</div>


<jsp:include page="footer.jsp" />
</body>
</html>
