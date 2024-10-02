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
            <div class="col-lg-6 col-md-8">
              <div class="login_wrap widget-taber-content background-white">
                <div class="padding_eight_all bg-white">
                  <div class="heading_s1">
                    <h1 class="mb-5">Create an Account</h1>
                    <p class="mb-30">Already have an account? <a href="page-login.html">Login</a></p>
                  </div>
                  <form action="register" method="post">
                    <!-- First Name -->
                    <div class="form-group">
                      <input type="text" required="" name="firstName" minlength="2" maxlength="100" placeholder="First Name" />
                    </div>

                    <!-- Last Name -->
                    <div class="form-group">
                      <input type="text" required="" name="lastName" minlength="2" maxlength="100" placeholder="Last Name" />
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                      <input type="email" required="" name="email" placeholder="Email" minlength="10" maxlength="100"/>
                    </div>

                    <!-- Birth Year -->
                    <div class="form-group">
                      <input type="number" required="" name="birthYear" placeholder="Birth Year" min="1900" max="2023" />
                    </div>
                    <!-- Contact Information -->
                    <div class="form-group">
                      <input type="text" required="" name="phone" placeholder="PhoneNumber" minlength="10" maxlength="10"/>

                    </div>
                    <div class="form-group">
                      <input type="text" required="" name="address"  minlength="5" maxlength="200" placeholder="Address" />

                    </div>
                    <!-- Password -->
                    <div class="form-group">
                      <input required="" type="password" name="password" minlength="8" maxlength="64" placeholder="Password" />
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group">
                      <input required="" type="password" name="confirmPassword" minlength="8" maxlength="64" placeholder="Confirm Password" />
                    </div>

                    <!-- Agree to Terms -->
                    <div class="login_footer form-group mb-50">
                      <div class="chek-form">
                        <div class="custome-checkbox">
                          <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox12" value="" />
                          <label class="form-check-label" for="exampleCheckbox12">
                            <span>I agree to terms &amp; Policy.</span>
                          </label>
                        </div>
                      </div>
                      <a href="page-privacy-policy.html"><i class="fi-rs-book-alt mr-5 text-muted"></i>Learn more</a>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group mb-30">
                      <button type="submit" class="btn btn-fill-out btn-block hover-up font-weight-bold" name="register">Submit & Register</button>
                    </div>

                    <p class="font-xs text-muted">
                      <strong>Note:</strong> Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our privacy policy.
                    </p>
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
