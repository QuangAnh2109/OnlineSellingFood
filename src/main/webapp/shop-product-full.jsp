<%@ page import="model.Account" %>
<%@ page import="model.Product" %>
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
    String productImageUrl = "C:/Users/admin/OneDrive/Documents/GitHub/OnlineSellingFood/src/main/webapp/Img/dep1.png"; // Đặt ảnh mặc định
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
                                        <img src="<%= productImageUrl %>" alt="<%= product.getName() %>" />
                                    </figure>
                                </div>
                                <div class="slider-nav-thumbnails">
                                    <div><img src="<%= productImageUrl %>" alt="<%= product.getName() %> (Hover)" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="detail-info pr-30 pl-30">
                                <span class="stock-status out-stock">Sale Off</span>
                                <h2 class="title-detail"><%= product.getName() %></h2>
                                <div class="product-detail-rating">
                                    <div class="product-rate-cover text-end">
                                        <div class="product-rate d-inline-block">
                                            <div class="product-rating" style="width: <%= product.getStar() * 20 %>%"></div>
                                        </div>
                                        <span class="font-small ml-5 text-muted">( <%= product.getReviews() %> reviews)</span>
                                    </div>
                                </div>
                                <div class="clearfix product-price-cover">
                                    <div class="product-price primary-color float-left">
                                        <span class="current-price text-brand"><%= product.getPrice() %> VND</span>
                                        <%
                                            if (product.getDiscountID() != null && product.getDiscountID() != 0) {
                                        %>
                                        <span class="save-price font-md color3 ml-15"><%= product.getDiscount() %>% Off</span>
                                        <span class="old-price font-md ml-15"><%= product.getOldPrice() %> VND</span>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="short-desc mb-30">
                                    <p class="font-lg"><%= product.getDetail() %></p>
                                </div>
                                <div class="attr-detail attr-size mb-30">
                                    <strong class="mr-10">Size / Weight: </strong>
                                    <ul class="list-filter size-filter font-small">
                                        <%
                                            for (String size : product.getSizes()) {
                                        %>
                                        <li><a href="#"><%= size %></a></li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>
                                <div class="detail-extralink mb-50">
                                    <div class="detail-qty border radius">
                                        <a href="#" class="qty-down"><i class="fi-rs-angle-small-down"></i></a>
                                        <span class="qty-val">1</span>
                                        <a href="#" class="qty-up"><i class="fi-rs-angle-small-up"></i></a>
                                    </div>
                                    <div class="product-extra-link2">
                                        <button type="submit" class="button button-add-to-cart"><i class="fi-rs-shopping-cart"></i>Add to cart</button>
                                        <a class="action-btn hover-up" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                                        <a class="action-btn hover-up" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                                    </div>
                                </div>
                                <div class="font-xs">
                                    <ul class="mr-50 float-start">
                                        <li class="mb-5">Type: <span class="text-brand">Organic</span></li>
                                        <li class="mb-5">MFG:<span class="text-brand"> Jun 4.2021</span></li>
                                        <li>LIFE: <span class="text-brand">70 days</span></li>
                                    </ul>
                                    <ul class="float-start">
                                        <li class="mb-5">SKU: <a href="#">FWM15VKT</a></li>
                                        <li class="mb-5">Tags: <a href="#" rel="tag">Snack</a>, <a href="#" rel="tag">Organic</a>, <a href="#" rel="tag">Brown</a></li>
                                        <li>Stock:<span class="in-stock text-brand ml-5">8 Items In Stock</span></li>
                                    </ul>
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
                                    <a class="nav-link" id="Vendor-info-tab" data-bs-toggle="tab" href="#Vendor-info">Vendor</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="Reviews-tab" data-bs-toggle="tab" href="#Reviews">Reviews (<%= product.getReviews() %>)</a>
                                </li>
                            </ul>
                            <div class="tab-pane fade" id="Reviews">
                                <div class="comment-review">
                                    <h4 class="mb-30"><%= product.getReviews() %> Reviews</h4>
                                    <div class="review-list">
                                        <%
                                            for (Review review : product.getReviewList()) {
                                        %>
                                        <div class="single-review">
                                            <div class="review-avatar">
                                                <img src="<%= review.getAvatarUrl() %>" alt="Review Avatar" />
                                            </div>
                                            <div class="review-content">
                                                <div class="review-header">
                                                    <h5 class="review-title"><%= review.getTitle() %></h5>
                                                    <div class="review-rating">
                                                        <span><%= review.getRating() %></span>
                                                        <i class="fi-rs-star"></i>
                                                    </div>
                                                </div>
                                                <p><%= review.getContent() %></p>
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="review-form">
                                    <h4 class="mb-30">Add a Review</h4>
                                    <form action="#">
                                        <div class="form-group">
                                            <label for="review-title">Title</label>
                                            <input type="text" id="review-title" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label for="review-text">Review</label>
                                            <textarea id="review-text" class="form-control" rows="5"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="review-rating">Rating</label>
                                            <select id="review-rating" class="form-control">
                                                <%
                                                    for (int i = 1; i <= 5; i++) {
                                                %>
                                                <option value="<%= i %>"><%= i %> Star</option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit Review</button>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade show active" id="Description">
                                <h4 class="mb-30">Product Description</h4>
                                <p><%= product.getDetail() %></p>
                            </div>
                            <div class="tab-pane fade" id="Vendor-info">
                                <h4 class="mb-30">Vendor Information</h4>
                                <p>Vendor: <%= product.getVendor() %></p>
                                <p>Contact: <%= product.getContactInfo() %></p>
                            </div>
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
