<%@ page import="model.Account" %>
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
  <link rel="stylesheet" href="nest-frontend/assets/css/plugins/animate.min.css" />
  <link rel="stylesheet" href="nest-frontend/assets/css/main.css?v=4.0" />
</head>

<body>
<%
String accountName;
try{
  accountName =  ((Account)session.getAttribute("account")).getLastName();
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
                    Do not miss amazing<br />
                    grocery deals
                  </h1>
                  <p class="mb-65">Sign up for the daily newsletter</p>
                </div>
              </div>
              <div class="single-hero-slider single-animation-wrap" style="background-image: url(nest-frontend/assets/imgs/slider/slider-8.png)">
                <div class="slider-content">
                  <h1 class="display-2 mb-40">
                    Fresh Vegetables<br />
                    Big discount
                  </h1>
                  <p class="mb-65">Save up to 50% off on your first order</p>
                  <form class="form-subcriber d-flex">
                    <input type="email" placeholder="Your emaill address" />
                    <button class="btn" type="submit">Subscribe</button>
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
                    Everyday Fresh &amp; <br />Clean with Our<br />
                    Products
                  </h4>
                  <a href="shop-grid-right.html" class="btn btn-xs mb-50">Shop Now <i class="fi-rs-arrow-small-right"></i></a>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-12">
              <div class="banner-img style-5 mt-5 mt-md-30">
                <img src="nest-frontend/assets/imgs/banner/banner-15.png" alt="" />
                <div class="banner-text">
                  <h5 class="mb-20">
                    The best Organic <br />
                    Products Online
                  </h5>
                  <a href="shop-grid-right.html" class="btn btn-xs">Shop Now <i class="fi-rs-arrow-small-right"></i></a>
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
          <h3>Featured Categories</h3>
        </div>
        <div class="slider-arrow slider-arrow-2 flex-right carausel-10-columns-arrow" id="carausel-10-columns-arrows"></div>
      </div>
      <div class="carausel-10-columns-cover position-relative">
        <div class="carausel-10-columns" id="carausel-10-columns">
          <jsp:include page="category-box.jsp">
            <jsp:param name="name" value="category name 1"/>
            <jsp:param name="quantity" value="12"/>
            <jsp:param name="color" value="2"/>
          </jsp:include>
          <jsp:include page="category-box.jsp">
            <jsp:param name="name" value="category name 2"/>
            <jsp:param name="quantity" value="78"/>
            <jsp:param name="color" value="11"/>
          </jsp:include>
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
                Everyday Fresh & <br />Clean with Our<br />
                Products
              </h4>
              <a href="shop-grid-right.html" class="btn btn-xs">Shop Now <i class="fi-rs-arrow-small-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="banner-img wow animate__animated animate__fadeInUp" data-wow-delay=".2s">
            <img src="nest-frontend/assets/imgs/banner/banner-2.png" alt="" />
            <div class="banner-text">
              <h4>
                Make your Breakfast<br />
                Healthy and Easy
              </h4>
              <a href="shop-grid-right.html" class="btn btn-xs">Shop Now <i class="fi-rs-arrow-small-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 d-md-none d-lg-flex">
          <div class="banner-img mb-sm-0 wow animate__animated animate__fadeInUp" data-wow-delay=".4s">
            <img src="nest-frontend/assets/imgs/banner/banner-3.png" alt="" />
            <div class="banner-text">
              <h4>The best Organic <br />Products Online</h4>
              <a href="shop-grid-right.html" class="btn btn-xs">Shop Now <i class="fi-rs-arrow-small-right"></i></a>
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
        <h3>Popular Products</h3>
      </div>
      <!--End nav-tabs-->
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="tab-one" role="tabpanel" aria-labelledby="tab-one">
          <!--product list-->
          <div class="row product-grid-4">
            <jsp:include page="product-box.jsp">
              <jsp:param name="category" value="category name 1"/>
              <jsp:param name="name" value="product name 1"/>
              <jsp:param name="manufacturer" value="manufacturer name 1"/>
              <jsp:param name="star" value="4"/>
              <jsp:param name="discount" value="0"/>
              <jsp:param name="price" value="100000"/>
              <jsp:param name="productID" value="1"/>
            </jsp:include>
            <jsp:include page="product-box.jsp">
              <jsp:param name="category" value="category name 2"/>
              <jsp:param name="name" value="product name 2"/>
              <jsp:param name="manufacturer" value="manufacturer name 2"/>
              <jsp:param name="star" value="5"/>
              <jsp:param name="discount" value="0"/>
              <jsp:param name="price" value="20000"/>
              <jsp:param name="productID" value="2"/>
            </jsp:include>
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
        <h3 class="">Deals Of The Day</h3>
      </div>
      <!-- product deals -->
      <div class="row">
        <jsp:include page="deal-box.jsp">
          <jsp:param name="datetime" value="2025/03/25 00:00:00"/>
          <jsp:param name="name" value="product name 1"/>
          <jsp:param name="manufacturer" value="manufacturer name 1"/>
          <jsp:param name="star" value="4"/>
          <jsp:param name="discount" value="30"/>
          <jsp:param name="price" value="100000"/>
          <jsp:param name="productID" value="1"/>
        </jsp:include>
        <jsp:include page="deal-box.jsp">
          <jsp:param name="datetime" value="2026/03/25 00:00:00"/>
          <jsp:param name="name" value="product name 2"/>
          <jsp:param name="manufacturer" value="manufacturer name 2"/>
          <jsp:param name="star" value="2"/>
          <jsp:param name="discount" value="60"/>
          <jsp:param name="price" value="20000"/>
          <jsp:param name="productID" value="2"/>
        </jsp:include>
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