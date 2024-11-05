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
    <style>
    .filter-form {
    margin-bottom: 20px;
    }

    .filter-dropdowns {
    background-color: #f8f8f8;
    padding: 10px;
    border-radius: 5px;
    }

    .filter-item {
    margin-right: 15px;
    flex: 1;
    }

    .filter-item select,
    .filter-item input {
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    }
    </style>
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
    if (sortOption == null || (!sortOption.equals("Price") && !sortOption.equals("Name"))) {
        sortOption = "Name";
    }

    String searchTerm = request.getParameter("searchTerm");

    ProductDAO productDAO = new ProductDAO();
    int totalProducts = productDAO.countProductsByCategoryAndSearch(categoryID, searchTerm);
    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
    boolean ascending = true;
    List<Product> products = productDAO.getProductsByPageAndSort(categoryID, page1, pageSize, sortOption, ascending, searchTerm);
%>

<jsp:include page="header.jsp">
    <jsp:param name="accountName" value="<%=accountName%>"/>
</jsp:include>
<!-- Giao diện lọc sản phẩm -->
<div class="container mb-30">
    <div class="row">
        <div class="col-lg-12">
            <form action="" method="get" class="filter-form">
                <div class="filter-dropdowns d-flex justify-content-between">
                    <!-- Dropdown cho Danh Mục -->
                    <div class="filter-item">
                        <select name="categoryID" onchange="this.form.submit()">
                            <option value="">All Categories</option>
                            <% for (Category category : allCategories) { %>
                            <option value="<%= category.getCategoryID() %>" <%= categoryID == category.getCategoryID() ? "selected" : "" %>>
                                <%= category.getName() %>
                            </option>
                            <% } %>
                        </select>
                    </div>

                    <!-- Dropdown cho Nhà Sản Xuất -->
                    <div class="filter-item">
                        <select name="manufacturerID" onchange="this.form.submit()">
                            <option value="">All Manufacturers</option>
                            <% ManufacterDAO manufacterDAO = new ManufacterDAO();%>
                            <% List<Manufacturer> allManufacturers = manufacterDAO.getAllManufacturers(); %>
                            <% for (Manufacturer manufacturer : allManufacturers) { %>
                            <option value="<%= manufacturer.getManufacturerID() %>" <%= request.getParameter("manufacturerID") != null && request.getParameter("manufacturerID").equals(String.valueOf(manufacturer.getManufacturerID())) ? "selected" : "" %>>
                                <%= manufacturer.getName() %>
                            </option>
                            <% } %>
                        </select>
                    </div>

                    <!-- Dropdown cho Xuất Xứ -->
                    <div class="filter-item">
                        <select name="origin" onchange="this.form.submit()">
                            <option value="">All Origins</option>
                            <% OriginDAO originDAO = new OriginDAO();%>
                            <% List<Origin> allOrigins = originDAO.getAllOrigins(); %>
                            <% for (Origin origin : allOrigins) { %>
                            <option value="<%= origin %>" <%= request.getParameter("origin") != null && request.getParameter("origin").equals(origin) ? "selected" : "" %>>
                                <%= origin %>
                            </option>
                            <% } %>
                        </select>
                    </div>


                    <!-- Thanh chọn theo giá -->
                    <div class="filter-item">
                        <input type="text" name="minPrice" placeholder="Min Price" value="<%= request.getParameter("minPrice") != null ? request.getParameter("minPrice") : "" %>"/>
                        <input type="text" name="maxPrice" placeholder="Max Price" value="<%= request.getParameter("maxPrice") != null ? request.getParameter("maxPrice") : "" %>"/>
                        <button type="submit">Filter</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


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

        </div>
    </div>
</div>


<jsp:include page="footer.jsp" />
</body>
</html>
