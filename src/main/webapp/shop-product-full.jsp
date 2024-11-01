<%@ page import="model.Account" %>
<%@ page import="model.Product" %>
<%@ page import="dal.ManufacterDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.ProductDAO" %>
<%@ page import="dal.CategoryDAO" %>
<%@ page import="dal.UnitDAO" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8" />
    <title>Nest - Multipurpose eCommerce HTML Template</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:title" content="" />
    <meta property="og:type" content="" />
    <meta property="og:url" content="" />
    <meta property="og:image" content="" />
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="nest-frontend/assets/imgs/theme/favicon.svg" />
    <!-- Template CSS -->
    <link rel="stylesheet" href="nest-frontend/assets/css/main.css?v=4.0" />
</head>

<body class="single-product">
<%
    UnitDAO unitDAO = new UnitDAO();
    ManufacterDAO manufacterDAO = new ManufacterDAO();
    String accountName = "";
    try {
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            accountName = account.getName();
        }
    } catch (Exception e) {
        accountName = "";
    }

    Product product = (Product) request.getAttribute("product");
    String productImageUrl = "C:\\Users\\admin\\OneDrive\\Documents\\GitHub\\OnlineSellingFood\\src\\main\\webapp\\Img\\dep1.png"; // Default image
%>
<jsp:include page="header.jsp">
    <jsp:param name="accountName" value="<%= accountName %>"/>
</jsp:include>
<main class="main">
    <div class="container mb-30">
        <div class="row">
            <div class="col-xl-10 col-lg-12 m-auto">
                <div class="product-detail accordion-detail">
                    <div class="row mb-50 mt-30">
                        <div class="col-md-6 col-sm-12 mb-md-0 mb-sm-5">
                            <div class="detail-gallery">
                                <span class="zoom-icon"><i class="fi-rs-search"></i></span>
                                <div class="product-image-slider">
                                    <figure class="border-radius-10">
                                        <img src="<%= productImageUrl %>" alt="<%= (product != null) ? product.getName() : "Product" %>" />
                                    </figure>
                                </div>
                                <div class="slider-nav-thumbnails">
                                    <div><img src="<%= productImageUrl %>" alt="<%= (product != null) ? product.getName() : "Product" %> (Hover)" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="detail-info pr-30 pl-30">
                                <!-- Stock Status and Product Name -->
                                <span class="stock-status out-stock">Sale Off</span>
                                <h2 class="title-detail"><%= (product != null) ? product.getName() : "Product name not available." %></h2>

                                <!-- Static 4-Star Rating and Placeholder for Reviews -->
                                <div class="product-detail-rating">
                                    <div class="product-rate-cover text-end">
                                        <div class="product-rate d-inline-block">
                                            <!-- Set to 80% width to represent a 4-star rating -->
                                            <div class="product-rating" style="width: 80%;"></div>
                                        </div>
                                        <span class="font-small ml-5 text-muted">(0 reviews)</span>
                                    </div>
                                </div>

                                <!-- Product Price (Without Discount) -->
                                <div class="clearfix product-price-cover">
                                    <div class="product-price primary-color float-left">
                                        <!-- Display current price only -->
                                        <span class="current-price text-brand"><%= (product != null) ? product.getPrice() : "Price not available." %> VND</span>
                                    </div>
                                </div>

                                <!-- Product Description -->
                                <div class="short-desc mb-30">
                                    <p class="font-lg"><%= (product != null) ? product.getDetail() : "Product details not available." %></p>
                                </div>

                                <!-- Static Unit Display -->
                                <div class="attr-detail attr-size mb-30">
                                    <strong class="mr-10">Unit: </strong>
                                    <ul class="list-filter size-filter font-small">
                                        <p class="font-lg"><%= (product != null) ? unitDAO.getUnitNameByID(product.getUnitID()): "Product units not available." %></p>
                                    </ul>
                                </div>
                                <div class="product-extra-link2">
                                    <button type="submit" class="button button-add-to-cart"><i class="fi-rs-shopping-cart"></i>Add to cart</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="product-info">
                        <div class="tab-style3">
                            <ul class="nav nav-tabs text-uppercase">
                                <li class="nav-item">
                                    <a class="nav-link active" id="Description-tab" data-bs-toggle="tab" href="#Description">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="Vendor-info-tab" data-bs-toggle="tab" href="#Vendor-info">Manufactor</a>
                                </li>
                                <%-- Uncomment when reviews are available --%>
                                <%-- <li class="nav-item"> --%>
                                <%-- <a class="nav-link" id="Reviews-tab" data-bs-toggle="tab" href="#Reviews">Reviews (<%= (product != null) ? product.getReviews() : 0 %>)</a> --%>
                                <%-- </li> --%>
                            </ul>
                        </div>
                        <div class="tab-content shop_info_tab entry-main-content">
                            <div class="tab-pane fade show active" id="Description">
                                <div class="">
                                    <p class="font-lg"><%= (product != null) ? product.getDetail() : "Product details not available." %></p>
                                </div>
                            </div>
                            <div class="tab-pane fade show active" id="Vendor-info">
                                <div class="">
                                    <p class="font-lg"><%= (product != null) ? manufacterDAO.getManufacturerName(product.getManufacturerID()) : "Product Manufactor not available." %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-60">
                        <div class="col-12">
                            <h2 class="section-title style-1 mb-30">Related products</h2>
                        </div>
                        <div class="row product-grid-4">
                            <%
                                ProductDAO productDAO = new ProductDAO();
                                List<Product> products = productDAO.get5RelatedProductsByManufacturer(product.getManufacturerID());
                                CategoryDAO categoryDAO = new CategoryDAO();
                            %>
                            <% for (Product product1 : products) {
                                List<String> images = productDAO.getProductImages(product1.getProductID());
                                String defaultImageUrl = images.size() > 0 ? images.get(0) : "default-image.jpg";
                                String hoverImageUrl = images.size() > 1 ? images.get(1) : defaultImageUrl;
                            %>
                            <jsp:include page="product-box.jsp">
                                <jsp:param name="category" value="<%= categoryDAO.getCategoryName(product1.getCategoryID())%>" />
                                <jsp:param name="name" value="<%= product1.getName() %>" />
                                <jsp:param name="manufacturer" value="<%= manufacterDAO.getManufacturerName(product1.getManufacturerID()) %>" />
                                <jsp:param name="star" value="4" />
                                <jsp:param name="discount" value="<%= product1.getDiscountID() != null ? product1.getDiscountID().toString() : '0' %>" />
                                <jsp:param name="price" value="<%= product1.getPrice().toString() %>" />
                                <jsp:param name="productID" value="<%= product1.getProductID().toString() %>" />
                                <jsp:param name="imageUrl" value="<%= defaultImageUrl %>" />
                                <jsp:param name="hoverImageUrl" value="<%= hoverImageUrl %>" />
                            </jsp:include>
                            <% } %>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="footer.jsp" />
<script src="nest-frontend/assets/js/vendor/jquery-3.6.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/bootstrap.bundle.min.js"></script>
<script src="nest-frontend/assets/js/plugins.js"></script>
<script src="nest-frontend/assets/js/main.js?v=4.0"></script>
</body>
</html>
