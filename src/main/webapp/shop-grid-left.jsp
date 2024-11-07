<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8" />
    <title>Thương mại điện tử</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="nest-frontend/assets/imgs/theme/favicon.svg" />
    <link rel="stylesheet" href="nest-frontend/assets/css/plugins/slider-range.css" />
    <link rel="stylesheet" href="nest-frontend/assets/css/main.css?v=4.0" />
</head>


<body>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<%@ page import="dal.*" %>
<%

    CategoryDAO categoryDAO = new CategoryDAO();
    List<Category> allCategories = categoryDAO.getAllCategories();

    int pageSize1 = 5;
    int totalCategories = allCategories.size();
    int totalPages1 = (int) Math.ceil((double) totalCategories / pageSize1);
    int currentPage = 1;

    if (request.getParameter("categoryPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("categoryPage"));
    }

    int startIndex = (currentPage - 1) * pageSize1;
    List<Category> categoriesToShow = new ArrayList<>();
    if (startIndex < totalCategories) {
        for (int i = startIndex; i < Math.min(startIndex + pageSize1, totalCategories); i++) {
            categoriesToShow.add(allCategories.get(i));
        }
    }

    String accountName = "";
    try {
        accountName = ((Account) session.getAttribute("account")).getName();
    } catch (NullPointerException e) {
        accountName = "";
    }

    int page1 = 1;
    int pageSize = 50;
    if (request.getParameter("page") != null) {
        page1 = Integer.parseInt(request.getParameter("page"));
    }
    if (request.getParameter("pageSize") != null) {
        pageSize = Integer.parseInt(request.getParameter("pageSize"));
    }

    int categoryID = 0;
    if (request.getParameter("categoryID") != null) {
        categoryID = Integer.parseInt(request.getParameter("categoryID"));
    }

    String sortOption = request.getParameter("sort");
    if (sortOption == null ||
            (!sortOption.equals("priceLowToHigh") &&
                    !sortOption.equals("priceHighToLow") &&
                    !sortOption.equals("nameAscending") &&
                    !sortOption.equals("nameDescending"))) {
        sortOption = "nameAscending"; // Default sorting option
    }

    String searchTerm = request.getParameter("searchTerm");
    boolean ascending = true; // Default sorting order

    if (sortOption.equals("priceHighToLow") || sortOption.equals("nameDescending")) {
        ascending = false;
    }

    ProductDAO productDAO = new ProductDAO();
    ProductImgDAO productImgDAO = new ProductImgDAO();
    ImgDAO imgDAO = new ImgDAO();
    int totalProducts = productDAO.countProductsByCategoryAndSearch(categoryID, searchTerm);
    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
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
                    <p>Chúng tôi tìm thấy <strong class="text-brand"><%= totalProducts %></strong> sản phẩm cho bạn!</p>
                </div>
                <div class="sort-by-product-area">
                    <div class="sort-by-cover mr-10">
                        <div class="sort-by-product-wrap">
                            <div class="sort-by">
                                <span><i class="fi-rs-apps"></i>Hiển thị:</span>
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
                                <span><i class="fi-rs-apps-sort"></i>Sắp xếp theo:</span>
                            </div>
                            <div class="sort-by-dropdown-wrap">
                                <span><%= sortOption %> <i class="fi-rs-angle-small-down"></i></span>
                            </div>
                        </div>
                        <div class="sort-by-dropdown">
                            <ul>
                                <li><a class="<%= sortOption.equals("Feature") ? "active" : "" %>" href="?categoryID=<%= categoryID %>&pageSize=<%= pageSize %>&sort=featured&page=1">Featured</a></li>
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
                        String defaultImageUrl;
                        try{
                            defaultImageUrl = imgDAO.getImgById(productImgDAO.getDefaultImg(product.getProductID()).getImgID()).getImglink();
                        }catch (NullPointerException e){
                            defaultImageUrl="";
                        }
                        String hoverImageUrl = images.size() > 1 ? images.get(1) : defaultImageUrl;
                %>
                <jsp:include page="product-box.jsp">
                    <jsp:param name="category" value="<%= categoryDAO.getCategoryName(product.getCategoryID())%>" />
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
                <p>Không có sản phẩm phù hợp</p>
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
                <h5 class="sidebar-title">Danh mục</h5>
                <ul class="categories">
                    <% for (Category category : categoriesToShow) { %>
                    <li>
                        <a href="?categoryID=<%= category.getCategoryID() %>&page=1">
                            <%= category.getName() %>
                        </a>
                        <span class="product-count">
                <%
                    int productCount = productDAO.countProductsByCategory(category.getCategoryID());
                %>
                (<%= productCount %>)
                </span>
                    </li>
                    <% } %>
                </ul>
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
            <div class="sidebar-widget">
                <h5 class="sidebar-title">Tìm kiếm sản phẩm</h5>

                <!-- Tìm kiếm theo tên -->
                <div class="form-group mb-3">
                    <label >Tên sản phẩm</label>
                    <input type="text" class="form-control" name="searchTerm" placeholder="Tìm theo tên" value="<%= searchTerm != null ? searchTerm : "" %>">
                </div>

                <!-- Tìm kiếm theo nguồn gốc (origin) -->
                <div class="form-group mb-3">
                    <label >Nguồn gốc</label>
                    <input type="text" class="form-control" name="origin" placeholder="Tìm theo nguồn gốc" value="<%= request.getParameter("origin") != null ? request.getParameter("origin") : "" %>">
                </div>

                <!-- Tìm kiếm theo nhà sản xuất -->
                <div class="form-group mb-3">
                    <label >Nhà sản xuất</label>
                    <input type="text" class="form-control" name="manufacturer" placeholder="Tìm theo nhà sản xuất" value="<%= request.getParameter("manufacturer") != null ? request.getParameter("manufacturer") : "" %>">
                </div>

                <!-- Lọc theo giá -->
                <div class="form-group mb-3">
                    <label >Giá từ</label>
                    <select class="form-control" name="priceFrom">
                        <option value="">Chọn giá</option>
                        <option value="0" <%= "0" == request.getParameter("priceFrom") ? "selected" : "" %>>Dưới 100.000 VND</option>
                        <option value="100000" <%= "100000" == request.getParameter("priceFrom") ? "selected" : "" %>>100.000 VND - 500.000 VND</option>
                        <option value="500000" <%= "500000" == request.getParameter("priceFrom") ? "selected" : "" %>>500.000 VND - 1.000.000 VND</option>
                        <option value="1000000" <%= "1000000" == request.getParameter("priceFrom") ? "selected" : "" %>>Trên 1.000.000 VND</option>
                    </select>
                </div>

                <!-- Lọc theo cân nặng -->
                <div class="form-group mb-3">
                    <label >Cân nặng từ (kg)</label>
                    <select class="form-control" name="weightFrom">
                        <option value="">Chọn cân nặng</option>
                        <option value="0" <%= "0" == request.getParameter("weightFrom") ? "selected" : "" %>>Dưới 1 kg</option>
                        <option value="1" <%= "1" == request.getParameter("weightFrom") ? "selected" : "" %>>1 kg - 5 kg</option>
                        <option value="5" <%= "5" == request.getParameter("weightFrom") ? "selected" : "" %>>5 kg - 10 kg</option>
                        <option value="10" <%= "10" == request.getParameter("weightFrom") ? "selected" : "" %>>Trên 10 kg</option>
                    </select>
                </div>

                <div class="form-group mb-3">
                    <button class="btn btn-primary" type="submit">Tìm</button>
                </div>
            </div>
        </div>

    </div>
</div>


<jsp:include page="footer.jsp" />
</body>
</html>
