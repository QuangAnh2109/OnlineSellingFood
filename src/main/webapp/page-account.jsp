<%@ page import="model.Account" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/19/2024
  Time: 4:19 PM
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
<%
  String accountName =  ((Account)session.getAttribute("account")).getName();
%>
<jsp:include page="header.jsp">
  <jsp:param name="accountName" value="<%=accountName%>"/>
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
        <div class="col-lg-10 m-auto">
          <div class="row">
            <div class="col-md-3">
              <div class="dashboard-menu">
                <ul class="nav flex-column" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="dashboard-tab" data-bs-toggle="tab" href="#dashboard" role="tab" aria-controls="dashboard" aria-selected="false"><i class="fi-rs-settings-sliders mr-10"></i>Dashboard</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="orders-tab" data-bs-toggle="tab" href="#orders" role="tab" aria-controls="orders" aria-selected="false"><i class="fi-rs-shopping-bag mr-10"></i>Orders</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="track-orders-tab" data-bs-toggle="tab" href="#track-orders" role="tab" aria-controls="track-orders" aria-selected="false"><i class="fi-rs-shopping-cart-check mr-10"></i>Track Your Order</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="address-tab" data-bs-toggle="tab" href="#address" role="tab" aria-controls="address" aria-selected="true"><i class="fi-rs-marker mr-10"></i>My Address</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="account-detail-tab" data-bs-toggle="tab" href="#account-detail" role="tab" aria-controls="account-detail" aria-selected="true"><i class="fi-rs-user mr-10"></i>Account details</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="change-password-tab" data-bs-toggle="tab" href="#change-password" role="tab" aria-controls="change-password" aria-selected="false"><i class="fi-rs-user mr-10"></i>Change password</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fi-rs-sign-out mr-10"></i>Logout</a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-md-9">
              <div class="tab-content account dashboard-content pl-50">
                <div class="tab-pane fade active show" id="dashboard" role="tabpanel" aria-labelledby="dashboard-tab">
                  <div class="card">
                    <div class="card-header">
                      <h3 class="mb-0">Hello Rosie!</h3>
                    </div>
                    <div class="card-body">
                      <p>
                        From your account dashboard. you can easily check &amp; view your <a href="#">recent orders</a>,<br />
                        manage your <a href="#">shipping and billing addresses</a> and <a href="#">edit your password and account details.</a>
                      </p>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="orders" role="tabpanel" aria-labelledby="orders-tab">
                  <div class="card">
                    <div class="card-header">
                      <h3 class="mb-0">Your Orders</h3>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                          <tr>
                            <th>Order</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Total</th>
                            <th>Actions</th>
                          </tr>
                          </thead>
                          <tbody>
                          <tr>
                            <td>#1357</td>
                            <td>March 45, 2020</td>
                            <td>Processing</td>
                            <td>$125.00 for 2 item</td>
                            <td><a href="#" class="btn-small d-block">View</a></td>
                          </tr>
                          <tr>
                            <td>#2468</td>
                            <td>June 29, 2020</td>
                            <td>Completed</td>
                            <td>$364.00 for 5 item</td>
                            <td><a href="#" class="btn-small d-block">View</a></td>
                          </tr>
                          <tr>
                            <td>#2366</td>
                            <td>August 02, 2020</td>
                            <td>Completed</td>
                            <td>$280.00 for 3 item</td>
                            <td><a href="#" class="btn-small d-block">View</a></td>
                          </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="track-orders" role="tabpanel" aria-labelledby="track-orders-tab">
                  <div class="card">
                    <div class="card-header">
                      <h3 class="mb-0">Orders tracking</h3>
                    </div>
                    <div class="card-body contact-from-area">
                      <p>To track your order please enter your OrderID in the box below and press "Track" button. This was given to you on your receipt and in the confirmation email you should have received.</p>
                      <div class="row">
                        <div class="col-lg-8">
                          <form class="contact-form-style mt-30 mb-50" action="#" method="post">
                            <div class="input-style mb-20">
                              <label>Order ID</label>
                              <input name="order-id" placeholder="Found in your order confirmation email" type="text" />
                            </div>
                            <div class="input-style mb-20">
                              <label>Billing email</label>
                              <input name="billing-email" placeholder="Email you used during checkout" type="email" />
                            </div>
                            <button class="submit submit-auto-width" type="submit">Track</button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="address" role="tabpanel" aria-labelledby="address-tab">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="card mb-3 mb-lg-0">
                        <div class="card-header">
                          <h3 class="mb-0">Billing Address</h3>
                        </div>
                        <div class="card-body">
                          <address>
                            3522 Interstate<br />
                            75 Business Spur,<br />
                            Sault Ste. <br />Marie, MI 49783
                          </address>
                          <p>New York</p>
                          <a href="#" class="btn-small">Edit</a>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="card">
                        <div class="card-header">
                          <h5 class="mb-0">Shipping Address</h5>
                        </div>
                        <div class="card-body">
                          <address>
                            4299 Express Lane<br />
                            Sarasota, <br />FL 34249 USA <br />Phone: 1.941.227.4444
                          </address>
                          <p>Sarasota</p>
                          <a href="#" class="btn-small">Edit</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="account-detail" role="tabpanel" aria-labelledby="account-detail-tab">
                  <div class="card">
                    <div class="card-header">
                      <h5>Account Details</h5>
                    </div>
                    <div class="card-body">
                      <p>Already have an account? <a href="login">Log in instead!</a></p>
                      <form action="profile1" method="post" name="enq">
                        <div class="row">
                          <div class="form-group col-md-6">
                            <label>First Name <span class="required">*</span></label>
                            <input required="" class="form-control" name="firstName" type="text"
                            value="${account.firstName}"/>
                          </div>
                          <div class="form-group col-md-6">
                            <label>Last Name <span class="required">*</span></label>
                            <input required="" class="form-control" name="lastName" type="text" value="${account.lastName}"/>
                          </div>
                          <div class="form-group col-md-12">
                            <label>Email Address <span class="required">*</span></label>
                            <input required="" class="form-control" name="email" type="email"
                                   value="${account.email}"readonly="" />
                          </div>
                          <div class="form-group col-md-12">
                            <label> Address <span class="required">*</span></label>
                            <input required="" class="form-control" name="address" type="text"
                                   value="${contactInformation.address}"/>
                          </div>
                          <div class="form-group col-md-12">
                            <label>Phone Number <span class="required">*</span></label>
                            <input required="" class="form-control" name="phone" type="text"
                                   value="${contactInformation.phoneNumber}"/>
                          </div>
                          <div class="form-group col-md-12">
                            <label>Birth Year <span class="required">*</span></label>
                            <input required="" class="form-control" name="birthYear" type="text"
                                   value="${account.birthYear}"/>
                          </div>

                          <div class="col-md-12">
                            <button type="submit" class="btn btn-fill-out submit font-weight-bold" name="submit" value="Submit">Save Change</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="change-password" role="tabpanel" aria-labelledby="change-password-tab">
                  <div class="card">
                    <div class="card-header">
                      <h5>Change Password</h5>
                    </div>
                    <div class="card-body">
                      <p>Already have an account? <a href="login">Log in instead!</a></p>
                      <form  action="${pageContext.request.contextPath}/changepass" name="enq">
                        <div class="form-group col-md-12">
                          <label>Old Password <span class="required">*</span></label>
                          <input required="" class="form-control" name="oldPassword" type="password" />
                        </div>
                        <div class="form-group col-md-12">
                          <label>New Password <span class="required">*</span></label>
                          <input required="" class="form-control" name="newPassword" type="password" />
                        </div>
                        <div class="form-group col-md-12">
                          <label>Confirm Password <span class="required">*</span></label>
                          <input required="" class="form-control" name="confirmPassword" type="password" />
                        </div>

                          <div class="col-md-12">
                            <button type="submit" class="btn btn-fill-out submit font-weight-bold" name="submit" value="Submit">Save Change</button>
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

