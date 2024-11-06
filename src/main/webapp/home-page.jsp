<%@ page import="model.Account" %>
<%@ page import="dal.CategoryDAO" %>
<%@ page import="dal.ProductDAO" %>
<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="dal.ManufacterDAO" %>
<%@ page import="model.Discount" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dal.DiscountDAO" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
  <meta charset="utf-8" />
  <title>Thương mại điện tử</title>
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
  <link rel="stylesheet" href="nest-frontend/assets/css/plugins/animate.min.css" />
  <link rel="stylesheet" href="nest-frontend/assets/css/main.css?v=4.0" />
</head>

<body>
<%
String accountName;
try{
  accountName =  ((Account)session.getAttribute("account")).getName();
}catch(NullPointerException e){
  accountName="";
}
%>
<jsp:include page="header.jsp">
  <jsp:param name="accountName" value="<%=accountName%>"/>
</jsp:include>
<!--End header-->
<main class="main">
  <section class="home-slider position-relative mb-30">
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <div class="home-slide-cover mt-30">
            <div class="hero-slider-1 style-5 dot-style-1 dot-style-1-position-2">
              <div class="single-hero-slider single-animation-wrap" style="background-image: url(nest-frontend/assets/imgs/slider/slider-7.png)">
                <div class="slider-content">
                  <h1 class="display-2 mb-40">
                    Đừng bỏ lỡ những<br />
                    ưu đãi tuyệt vời
                  </h1>
                  <p class="mb-65">Đăng ký nhận bản tin hàng ngày</p>
                </div>
              </div>
              <div class="single-hero-slider single-animation-wrap" style="background-image: url(nest-frontend/assets/imgs/slider/slider-8.png)">
                <div class="slider-content">
                  <h1 class="display-2 mb-40">
                    Rau củ tươi<br />
                    Giảm giá lớn
                  </h1>
                  <form class="form-subcriber d-flex">
                    <button class="btn" type="submit">Đăng ký ngay</button>
                  </form>
                </div>
              </div>
            </div>
            <div class="slider-arrow hero-slider-1-arrow"></div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="row">
            <div class="col-md-6 col-lg-12">
              <div class="banner-img style-4 mt-30">
                <img src="nest-frontend/assets/imgs/banner/banner-14.png" alt="" />
                <div class="banner-text">
                  <h4 class="mb-30">
                    Tươi mỗi ngày &amp;<br />Sạch sẽ với các<br />
                    sản phẩm của chúng tôi
                  </h4>
                  <a href="shop-grid-right.html" class="btn btn-xs mb-50">Mua ngay<i class="fi-rs-arrow-small-right"></i></a>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-12">
              <div class="banner-img style-5 mt-5 mt-md-30">
                <img src="nest-frontend/assets/imgs/banner/banner-15.png" alt="" />
                <div class="banner-text">
                  <h5 class="mb-20">
                    Sản phẩm hữu cơ<br />
                    Tốt nhất
                  </h5>
                  <a href="shop-grid-right.html" class="btn btn-xs">Mua ngay<i class="fi-rs-arrow-small-right"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--End hero slider-->
  <section class="popular-categories section-padding">
    <div class="container wow animate__animated animate__fadeIn">
      <div class="section-title">
        <div class="title">
          <h3>Danh mục nổi bật</h3>
        </div>
        <div class="slider-arrow slider-arrow-2 flex-right carausel-10-columns-arrow" id="carausel-10-columns-arrows"></div>
      </div>
      <div class="carausel-10-columns-cover position-relative">
        <div class="carausel-10-columns" id="carausel-10-columns">
          <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ProductDAO productDAO = new ProductDAO();
            List<Category> categories = categoryDAO.getAllCategories();

            for (Category category : categories) {
              int categoryID = category.getCategoryID();
              int productCount = productDAO.countProductsByCategory(categoryID);
          %>
          <jsp:include page="category-box.jsp">
            <jsp:param name="name" value="<%= category.getName() %>"/>
            <jsp:param name="quantity" value="<%= productCount %>"/>
            <jsp:param name="color" value="2"/>
          </jsp:include>
          <%
            }
          %>
        </div>
      </div>
    </div>
  </section>
  <!--End category slider-->
  <section class="banners mb-25">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="banner-img wow animate__animated animate__fadeInUp" data-wow-delay="0">
            <img src="nest-frontend/assets/imgs/banner/banner-1.png" alt="" />
            <div class="banner-text">
              <h4>
                Tươi mới mỗi ngày & <br />Sạch sẽ với<br />
                sản phẩm của chúng tôi
              </h4>
              <a href="shop-grid-right.html" class="btn btn-xs">Mua Ngay<i class="fi-rs-arrow-small-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="banner-img wow animate__animated animate__fadeInUp" data-wow-delay=".2s">
            <img src="nest-frontend/assets/imgs/banner/banner-2.png" alt="" />
            <div class="banner-text">
              <h4>
                Bữa sáng của bạn<br />
                lành mạnh và dễ dàng
              </h4>
              <a href="shop-grid-right.html" class="btn btn-xs">Mua Ngay<i class="fi-rs-arrow-small-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 d-md-none d-lg-flex">
          <div class="banner-img mb-sm-0 wow animate__animated animate__fadeInUp" data-wow-delay=".4s">
            <img src="nest-frontend/assets/imgs/banner/banner-3.png" alt="" />
            <div class="banner-text">
              <h4>Sản phẩm hữu cơ <br />tốt nhất </h4>
              <a href="shop-grid-right.html" class="btn btn-xs">Mua Ngay<i class="fi-rs-arrow-small-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--End banners-->
  <section class="product-tabs section-padding position-relative">
    <div class="container">
      <div class="section-title style-2 wow animate__animated animate__fadeIn">
        <h3>Sản phẩm bán chạy</h3>
      </div>
      <!--End nav-tabs-->
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="tab-one" role="tabpanel" aria-labelledby="tab-one">
          <!--product list-->
          <div class="row product-grid-4">
            <%
              List<Product> products = productDAO.get5ProductByDiscount();
              ManufacterDAO manufacterDAO = new ManufacterDAO();
            %>
            <% for (Product product : products) {
              List<String> images = productDAO.getProductImages(product.getProductID());
              String defaultImageUrl = images.size() > 0 ? images.get(0) : "default-image.jpg";
              String hoverImageUrl = images.size() > 1 ? images.get(1) : defaultImageUrl;
            %>
            <jsp:include page="product-box.jsp">
              <jsp:param name="category" value="<%= categoryDAO.getCategoryName(product.getCategoryID())%>" />
              <jsp:param name="name" value="<%= product.getName() %>" />
              <jsp:param name="manufacturer" value="<%= manufacterDAO.getManufacturerName(product.getManufacturerID()) %>" />
              <jsp:param name="star" value="4" />
              <jsp:param name="discount" value="<%= product.getDiscountID() != null ? product.getDiscountID().toString() : '0' %>" />
              <jsp:param name="price" value="<%= product.getPrice().toString() %>" />
              <jsp:param name="productID" value="<%= product.getProductID().toString() %>" />
              <jsp:param name="imageUrl" value="<%= defaultImageUrl %>" />
              <jsp:param name="hoverImageUrl" value="<%= hoverImageUrl %>" />
            </jsp:include>
            <% } %>
          </div>
          <!--End product-grid-4-->
        </div>
      </div>
      <!--End tab-content-->
    </div>
  </section>
  <!--Products Tabs-->
  <section class="section-padding pb-5">
    <div class="container">
      <div class="section-title wow animate__animated animate__fadeIn" data-wow-delay="0">
        <h3 class="">Sản phẩm phổ biến</h3>
      </div>
      <!-- product deals -->
      <div class="row">
        <%

          DiscountDAO discountDAO = new DiscountDAO();
          List<Product> products1 = productDAO.get4ProductByDiscount();


          for (Product product : products1) {
            Discount discount = discountDAO.getDiscountByDiscountId(product.getDiscountID());
            if(discount!=null){
            String manufacturerName = manufacterDAO.getManufacturerName(product.getManufacturerID());
            int discountPercentage = (discount != null) ? discount.getDiscountPercent() : 0;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
            //String datetime = (discount != null) ? sdf.format(discount.getEndTime()) : "";
            String datetime =discount.getEndTime().format(DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm:ss"));
        %>
        <jsp:include page="deal-box.jsp">
          <jsp:param name="datetime" value="<%= datetime%>"/>
          <jsp:param name="name" value="<%= product.getName() %>"/>
          <jsp:param name="manufacturer" value="<%= manufacturerName %>"/>
          <jsp:param name="star" value="4"/>
          <jsp:param name="discount" value="<%= discountPercentage %>"/>
          <jsp:param name="price" value="<%= product.getPrice() %>"/>
          <jsp:param name="productID" value="<%= product.getProductID() %>"/>
        </jsp:include>
        <% }} %>
      </div>
    </div>
  </section>
  <!--End Deals-->
</main>
<jsp:include page="footer.jsp"></jsp:include>
<!-- Vendor JS-->
<script src="nest-frontend/assets/js/vendor/modernizr-3.6.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/jquery-3.6.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/jquery-migrate-3.3.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/bootstrap.bundle.min.js"></script>
<script src="nest-frontend/assets/js/plugins/slick.js"></script>
<script src="nest-frontend/assets/js/plugins/jquery.syotimer.min.js"></script>
<script src="nest-frontend/assets/js/plugins/waypoints.js"></script>
<script src="nest-frontend/assets/js/plugins/wow.js"></script>
<script src="nest-frontend/assets/js/plugins/perfect-scrollbar.js"></script>
<script src="nest-frontend/assets/js/plugins/magnific-popup.js"></script>
<script src="nest-frontend/assets/js/plugins/select2.min.js"></script>
<script src="nest-frontend/assets/js/plugins/counterup.js"></script>
<script src="nest-frontend/assets/js/plugins/jquery.countdown.min.js"></script>
<script src="nest-frontend/assets/js/plugins/images-loaded.js"></script>
<script src="nest-frontend/assets/js/plugins/isotope.js"></script>
<script src="nest-frontend/assets/js/plugins/scrollup.js"></script>
<script src="nest-frontend/assets/js/plugins/jquery.vticker-min.js"></script>
<script src="nest-frontend/assets/js/plugins/jquery.theia.sticky.js"></script>
<script src="nest-frontend/assets/js/plugins/jquery.elevatezoom.js"></script>
<!-- Template  JS -->
<script src="nest-frontend/assets/js/main.js?v=4.0"></script>
<script src="nest-frontend/assets/js/shop.js?v=4.0"></script>
</body>
</html>