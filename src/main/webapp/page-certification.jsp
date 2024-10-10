<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Certification" %>
<%@ page import="model.CertificateIssuer" %>
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
<div class="screen-overlay"></div>
<aside class="navbar-aside" id="offcanvas_aside">
    <div class="aside-top">
        <a href="index.html" class="brand-wrap">
            <img src="nest-backend/assets/imgs/theme/logo.svg" class="logo" alt="Nest Dashboard" />
        </a>
        <div>
            <button class="btn btn-icon btn-aside-minimize"><i class="text-muted material-icons md-menu_open"></i></button>
        </div>
    </div>
    <nav>
        <ul class="menu-aside">
            <li class="menu-item">
                <a class="menu-link" href="index.html">
                    <i class="icon material-icons md-home"></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>
            <li class="menu-item has-submenu active">
                <a class="menu-link" href="page-products-list.html">
                    <i class="icon material-icons md-shopping_bag"></i>
                    <span class="text">Products</span>
                </a>
                <div class="submenu">
                    <a href="certificationList"class="active">Certification</a>
                    <a href="certificateIssuerList">Certificate Issuer</a>
                    <a href="categoryList"  >Categories</a>
                    <a href="originList" >Origin</a>
                </div>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="page-orders-1.html">
                    <i class="icon material-icons md-shopping_cart"></i>
                    <span class="text">Orders</span>
                </a>
                <div class="submenu">
                    <a href="page-orders-1.html">Order list 1</a>
                    <a href="page-orders-2.html">Order list 2</a>
                    <a href="page-orders-detail.html">Order detail</a>
                </div>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="page-sellers-cards.html">
                    <i class="icon material-icons md-store"></i>
                    <span class="text">Sellers</span>
                </a>
                <div class="submenu">
                    <a href="page-sellers-cards.html">Sellers cards</a>
                    <a href="page-sellers-list.html">Sellers list</a>
                    <a href="page-seller-detail.html">Seller profile</a>
                </div>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="page-form-product-1.html">
                    <i class="icon material-icons md-add_box"></i>
                    <span class="text">Add product</span>
                </a>
                <div class="submenu">
                    <a href="page-form-product-1.html">Add product 1</a>
                    <a href="page-form-product-2.html">Add product 2</a>
                    <a href="page-form-product-3.html">Add product 3</a>
                    <a href="page-form-product-4.html">Add product 4</a>
                </div>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="page-transactions-1.html">
                    <i class="icon material-icons md-monetization_on"></i>
                    <span class="text">Transactions</span>
                </a>
                <div class="submenu">
                    <a href="page-transactions-1.html">Transaction 1</a>
                    <a href="page-transactions-2.html">Transaction 2</a>
                </div>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-person"></i>
                    <span class="text">Account</span>
                </a>
                <div class="submenu">
                    <a href="page-account-login.html">User login</a>
                    <a href="page-account-register.html">User registration</a>
                    <a href="page-error-404.html">Error 404</a>
                </div>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="page-reviews.html">
                    <i class="icon material-icons md-comment"></i>
                    <span class="text">Reviews</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="page-brands.html"> <i class="icon material-icons md-stars"></i> <span class="text">Brands</span> </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" disabled href="#">
                    <i class="icon material-icons md-pie_chart"></i>
                    <span class="text">Statistics</span>
                </a>
            </li>
        </ul>
        <hr />
        <ul class="menu-aside">
            <li class="menu-item has-submenu">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-settings"></i>
                    <span class="text">Settings</span>
                </a>
                <div class="submenu">
                    <a href="page-settings-1.html">Setting sample 1</a>
                    <a href="page-settings-2.html">Setting sample 2</a>
                </div>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="page-blank.html">
                    <i class="icon material-icons md-local_offer"></i>
                    <span class="text"> Starter page </span>
                </a>
            </li>
        </ul>
        <br />
        <br />
    </nav>
</aside>
<main class="main-wrap">
    <header class="main-header navbar">
        <div class="col-search">
            <form class="searchform">
                <div class="input-group">
                    <input list="search_terms" type="text" class="form-control" placeholder="Search term" />
                    <button class="btn btn-light bg" type="button"><i class="material-icons md-search"></i></button>
                </div>
                <datalist id="search_terms">
                    <option value="Products"></option>
                    <option value="New orders"></option>
                    <option value="Apple iphone"></option>
                    <option value="Ahmed Hassan"></option>
                </datalist>
            </form>
        </div>
        <div class="col-nav">
            <button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside"><i class="material-icons md-apps"></i></button>
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
                        <a class="dropdown-item text-brand" href="#"><img src="assets/imgs/theme/flag-us.png" alt="English" />English</a>
                        <a class="dropdown-item" href="#"><img src="assets/imgs/theme/flag-fr.png" alt="Français" />Français</a>
                        <a class="dropdown-item" href="#"><img src="assets/imgs/theme/flag-jp.png" alt="Français" />日本語</a>
                        <a class="dropdown-item" href="#"><img src="assets/imgs/theme/flag-cn.png" alt="Français" />中国人</a>
                    </div>
                </li>
                <li class="dropdown nav-item">
                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownAccount" aria-expanded="false"> <img class="img-xs rounded-circle" src="assets/imgs/people/avatar-2.png" alt="User" /></a>
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
    <section class="content-main">
        <div class="content-header">
            <div>
                <h2 class="content-title card-title">Certifications</h2>
                <p>Add, edit or delete a certification</p>
            </div>
            <div>
                <form action="certificationSearch" method="post">
                    <input type="text" name="searchKeyword" placeholder="Search Certifications" class="form-control bg-white" />
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <form action="certificationCU" method="post" onsubmit="return validateForm()">
                            <div class="mb-4">
                                <label for="certificate_name" class="form-label">Name</label>
                                <input type="text" placeholder="Type here" class="form-control" id="certificate_name" name="name" required />
                                <input type="hidden" id="certification_id" name="certificationID" />
                            </div>
                            <div class="mb-4">
                                <label for="certificate_detail" class="form-label">Detail</label>
                                <input type="text" placeholder="Enter details" class="form-control" id="certificate_detail" name="detail" required />
                            </div>
                            <div class="mb-4">
                                <label for="certificate_issuer" class="form-label">Certificate Issuer</label>
                                <select class="form-control" id="certificate_issuer" name="certificateIssuerID" required>
                                    <%
                                        List<CertificateIssuer> issuerList = (List<CertificateIssuer>) request.getAttribute("issuerList");
                                        if (issuerList != null && !issuerList.isEmpty()) {
                                            for (CertificateIssuer issuer : issuerList) {
                                    %>
                                    <option value="<%= issuer.getCertificateIssuerID() %>"><%= issuer.getName() %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label for="image_link" class="form-label">Image Link</label>
                                <input type="text" placeholder="Enter image link" class="form-control" id="image_link" name="imgID" />
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" id="submit_button">Create certification</button>
                                <button type="button" class="btn btn-secondary mt-2" id="cancel_button" onclick="resetForm()" style="display: none;">Cancel</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Detail</th>
                                    <th>Issuer</th>
                                    <th>Image</th>
                                    <th class="text-end">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Certification> certificationList = (List<Certification>) request.getAttribute("certificationList");
                                    if (certificationList != null && !certificationList.isEmpty()) {
                                        for (Certification certification : certificationList) {
                                %>
                                <tr>
                                    <td onclick="populateForm('<%= certification.getCertificationID() %>', '<%= certification.getName() %>', '<%= certification.getDetail() %>', '<%= certification.getImgID() %>', '<%= certification.getCertificateIssuerID() %>')"><%= certification.getCertificationID() %></td>
                                    <td onclick="populateForm('<%= certification.getCertificationID() %>', '<%= certification.getName() %>', '<%= certification.getDetail() %>', '<%= certification.getImgID() %>', '<%= certification.getCertificateIssuerID() %>')"><b><%= certification.getName() %></b></td>
                                    <td><%= certification.getDetail() %></td>
                                    <td><%= certification.getCertificateIssuerID() %></td>
<%--                                    <td><img src="<%= certification.getImgID() %>" alt="Image" style="width: 50px; height: auto;"></td>--%>
                                    <td><iframe src="https://drive.google.com/file/d/1xkIu0lq41MMsoxSOD7SqHxW9PnSOgbDy/preview" width="640" height="480" allow="autoplay"></iframe></td>
                                    <td class="text-end">
                                        <button class="btn btn-light rounded btn-sm font-sm">
                                            <a href="certificationDelete?certificationID=<%= certification.getCertificationID() %>"><i class="material-icons md-delete"></i>Delete</a>
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="6" class="text-center">No certifications found.</td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Script to populate the form -->
    <script>
        function populateForm(certificationID, name, detail, imgID, certificateIssuerID) {
            document.getElementById("certificate_name").value = name;
            document.getElementById("certificate_detail").value = detail;
            document.getElementById("image_link").value = imgID;
            document.getElementById("certification_id").value = certificationID;

            // Set the selected value for the issuer
            document.getElementById("certificate_issuer").value = certificateIssuerID;

            document.getElementById("submit_button").innerText = "Update certification"; // Change button label to "Update certification"

            // Show Cancel button
            document.getElementById("cancel_button").style.display = "block";
        }

        function validateForm() {
            const nameField = document.getElementById("certificate_name");
            const detailField = document.getElementById("certificate_detail");
            if (nameField.value.trim() === "" || detailField.value.trim() === "") {
                alert("Please fill in all required fields.");
                return false; // Prevent form submission if any required field is empty
            }
            return true; // Allow form submission if all checks pass
        }

        function resetForm() {
            document.getElementById("certificate_name").value = "";
            document.getElementById("certificate_detail").value = "";
            document.getElementById("image_link").value = "";
            document.getElementById("certification_id").value = "";
            document.getElementById("submit_button").innerText = "Create certification"; // Reset button label to default
            document.getElementById("cancel_button").style.display = "none"; // Hide Cancel button
        }
    </script>


    <!-- content-main end// -->
    <footer class="main-footer font-xs">
        <div class="row pb-30 pt-15">
            <div class="col-sm-6">
                <script>
                    document.write(new Date().getFullYear());
                </script>
                &copy; Nest - HTML Ecommerce Template .
            </div>
            <div class="col-sm-6">
                <div class="text-sm-end">All rights reserved</div>
            </div>
        </div>
    </footer>
</main>
<script src="assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="assets/js/vendors/select2.min.js"></script>
<script src="assets/js/vendors/perfect-scrollbar.js"></script>
<script src="assets/js/vendors/jquery.fullscreen.min.js"></script>
<!-- Main Script -->
<script src="assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>
