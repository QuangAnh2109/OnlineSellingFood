<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/19/2024
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
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

<body>
<jsp:include page="header.jsp">
  <jsp:param name="accountName" value=""/>
</jsp:include>
<!--End header-->
<main class="main pages">
  <div class="page-header breadcrumb-wrap">
    <div class="container">
      <div class="breadcrumb">
        <a href="index.html" rel="nofollow"><i class="fi-rs-home mr-5"></i>Home</a>
        <span></span> Pages <span></span> My Account
      </div>
    </div>
  </div>
  <div class="page-content pt-150 pb-150">
    <div class="container">
      <div class="row">
        <div class="col-xl-8 col-lg-10 col-md-12 m-auto">
          <div class="row">
            <div class="col-lg-6 pr-30 d-none d-lg-block">
              <img class="border-radius-15" src="nest-frontend/assets/imgs/page/login-1.png" alt="" />
            </div>
            <div class="col-lg-6 col-md-8">
              <div class="login_wrap widget-taber-content background-white">
                <div class="padding_eight_all bg-white">
                  <div class="heading_s1">
                    <h1 class="mb-5">Login</h1>
                    <p class="mb-30">Don't have an account? <a href="page-register.jsp">Create here</a></p>
                  </div>
                  <c:set var="cookie" value="${pageContext.request.cookies}"/>
                  <form  action="login" method="post">
                    <div class="form-group">
                      <input type="text" required="" name="email" placeholder="Email *"
                             value="${cookie.cuser.value}"/>
                    </div>
                    <div class="form-group">
                      <input required="" type="password" name="password" placeholder="Your password *"
                             value="${cookie.cpass.value}"/>
                    </div>
                    <h4 style="color: red">${requestScope.error}</h4>
                    <div class="login_footer form-group mb-50">
                      <div class="chek-form">
                        <div class="custome-checkbox">
                          <input class="form-check-input" type="checkbox" ${(cookie.crem!=null?'checked':'')} name="rem" id="remember_me" value="ON" />
                          <label class="form-check-label" for="remember_me"><span>Remember me</span></label>
                        </div>
                      </div>
                      <a class="text-muted" href="forgotpassword.jsp">Forgot password?</a>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-heading btn-block hover-up" name="login">Log in</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<jsp:include page="footer.jsp"></jsp:include>
<!-- Vendor JS-->
<script src="nest-frontend/assets/js/vendor/modernizr-3.6.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/jquery-3.6.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/jquery-migrate-3.3.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/bootstrap.bundle.min.js"></script>
<script src="nest-frontend/assets/js/plugins/slick.js"></script>
<script src="nest-frontend/assets/js/plugins/jquery.syotimer.min.js"></script>
<script src="nest-frontend/assets/js/plugins/wow.js"></script>
<script src="nest-frontend/assets/js/plugins/perfect-scrollbar.js"></script>
<script src="nest-frontend/assets/js/plugins/magnific-popup.js"></script>
<script src="nest-frontend/assets/js/plugins/select2.min.js"></script>
<script src="nest-frontend/assets/js/plugins/waypoints.js"></script>
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

