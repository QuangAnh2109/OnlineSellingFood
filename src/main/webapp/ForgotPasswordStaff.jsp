<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Nest Dashboard</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:title" content="" />
    <meta property="og:type" content="" />
    <meta property="og:url" content="" />
    <meta property="og:image" content="" />
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="nest-backend/assets/imgs/theme/favicon.svg" />
    <!-- Template CSS -->
    <link href="nest-backend/assets/css/main.css?v=1.1" rel="stylesheet" type="text/css" />
</head>

<body>
<main>
    <header class="main-header style-2 navbar">
        <div class="col-brand">
            <a href="index.html" class="brand-wrap">
                <img src="nest-backend/assets/imgs/theme/logo.svg" class="logo" alt="Nest Dashboard" />
            </a>
        </div>
        <div class="col-nav">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link btn-icon" href="#">
                        <i class="material-icons md-notifications animation-shake"></i>
                        <span class="badge rounded-pill">3</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn-icon darkmode" href="#"> <i class="material-icons md-nights_stay"></i> </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="requestfullscreen nav-link btn-icon"><i class="material-icons md-cast"></i></a>
                </li>
                <li class="dropdown nav-item">
                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownLanguage" aria-expanded="false"><i class="material-icons md-public"></i></a>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownLanguage">
                        <a class="dropdown-item text-brand" href="#"><img src="nest-backend/assets/imgs/theme/flag-us.png" alt="English" />English</a>
                        <a class="dropdown-item" href="#"><img src="nest-backend/assets/imgs/theme/flag-fr.png" alt="Français" />Français</a>
                        <a class="dropdown-item" href="#"><img src="nest-backend/assets/imgs/theme/flag-jp.png" alt="Français" />日本語</a>
                        <a class="dropdown-item" href="#"><img src="nest-backend/assets/imgs/theme/flag-cn.png" alt="Français" />中国人</a>
                    </div>
                </li>
                <li class="dropdown nav-item">
                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownAccount" aria-expanded="false"> <img class="img-xs rounded-circle" src="nest-backend/assets/imgs/people/avatar-2.png" alt="User" /></a>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownAccount">
                        <a class="dropdown-item" href="#"><i class="material-icons md-perm_identity"></i>Edit Profile</a>
                        <a class="dropdown-item" href="#"><i class="material-icons md-settings"></i>Account Settings</a>
                        <a class="dropdown-item" href="#"><i class="material-icons md-account_balance_wallet"></i>Wallet</a>
                        <a class="dropdown-item" href="#"><i class="material-icons md-receipt"></i>Billing</a>
                        <a class="dropdown-item" href="#"><i class="material-icons md-help_outline"></i>Help center</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-danger" href="#"><i class="material-icons md-exit_to_app"></i>Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </header>
    <section class="content-main mt-80 mb-80">
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
                                            <h1 class="mb-5">Forgot Password</h1>
                                            <p class="mb-30">Don't have an account? <a href="register">Create here</a></p>
                                        </div>
                                        <%
                                            String email = request.getParameter("email");
                                            if(email==null){
                                        %>
                                        <form  method="post" action="${pageContext.request.contextPath}/forgotpassword" onsubmit="return validateForm()">
                                            <div class="form-group">
                                                <input name="email" id="email" type="text" required=""  placeholder="Enter Email  *" />
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" class="button is-primary" >Submit</button>
                                            </div><
                                        </form>
                                        <%
                                        }
                                        else{
                                        %>
                                        <form  method="post" action="page-change-pass-staff.jsp" onsubmit="return validateForm()">
                                            <div class="form-group">
                                                <input name="email" id="emailforgot" type="text" required="" value="<%out.print(email);%>" readonly/>
                                                <input name="otp" id="otp" type="text" required=""  placeholder="Enter OTP  *" />
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" class="button is-primary" >Submit</button>
                                            </div><
                                        </form>
                                        <%
                                            }
                                        %>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <footer class="main-footer text-center">
        <p class="font-xs">
            <script>
                document.write(new Date().getFullYear());
            </script>
            &copy; Nest - HTML Ecommerce Template .
        </p>
        <p class="font-xs mb-30">All rights reserved</p>
    </footer>
</main>
<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>

