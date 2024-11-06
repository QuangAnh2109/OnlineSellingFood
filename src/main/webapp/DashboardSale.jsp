<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.OrderResponse" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<jsp:include page="bar-staff.jsp">
    <jsp:param name="page" value=""/>
    <jsp:param name="menu" value="homepage"/>
</jsp:include>
<main class="main-wrap">
    <jsp:include page="header-staff.jsp"></jsp:include>
    <section class="content-main">
        <div class="content-header">
            <div>
                <h2 class="content-title card-title">Bảng điều khiển</h2>
                <p>Toàn bộ dữ liệu về doanh nghiệp của bạn ở đây</p>
            </div>

            <form action="ExportSale" method="get">

                <button type="submit" class="btn btn-primary">
                    <i  class="text-muted material-icons md-post_add"></i> Tạo báo cáo
                </button>
            </form>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="card card-body mb-4">
                    <article class="icontext">
                        <span class="icon icon-sm rounded-circle bg-primary-light"><i class="text-primary material-icons md-monetization_on"></i></span>
                        <div class="text">
                            <h6 class="mb-1 card-title">Doanh thu</h6>
                            <span>${totalRevenue} VND</span>

                        </div>
                    </article>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="card card-body mb-4">
                    <article class="icontext">
                        <span class="icon icon-sm rounded-circle bg-success-light"><i class="text-success material-icons md-local_shipping"></i></span>
                        <div class="text">
                            <h6 class="mb-1 card-title">Đơn hàng</h6>
                            <span>${totalOrders}</span>

                        </div>
                    </article>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="card card-body mb-4">
                    <article class="icontext">
                        <span class="icon icon-sm rounded-circle bg-warning-light"><i class="text-warning material-icons md-qr_code"></i></span>
                        <div class="text">
                            <h6 class="mb-1 card-title">Sản phẩm</h6>
                            <span>${totalProducts}</span>

                        </div>
                    </article>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-xl-8 col-lg-12">
                <div class="card mb-4">

                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <div class="card mb-4">

                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="card mb-4">

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-lg-12">
                <div class="card mb-4">

                </div>
                <div class="card mb-4">

                </div>
            </div>
        </div>
        <div class="card mb-4">


            <div class="card-body">
                <div class="table-responsive">
                    <div class="table-responsive">
                        <table class="table align-middle table-nowrap mb-0">
                            <thead class="table-light">
                            <tr>

                                <th class="align-middle" scope="col">Mã đơn hàng</th>
                                <th class="align-middle" scope="col">Tên khách hàng</th>
                                <th class="align-middle" scope="col">Ngày đặt hàng</th>
                                <th class="align-middle" scope="col">Giá</th>
                                <th class="align-middle" scope="col">Trạng thái đơn hàng</th>
                                <th class="align-middle" scope="col">Phương thức thanh toán</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${orderList}">
                                <tr>

                                    <td>${order.getOrderID()}</td>
                                    <td>${order.getCustomerName()}</td>
                                    <td>${order.getOrderDate()}</td>
                                    <td>${order.getPrice()} VND</td>
                                    <td>${order.getOrderStatusName()}</td>
                                    <td>${order.getOrderPaymentName()}</td>

                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- table-responsive end// -->
            </div>
        </div>

    </section>
    <!-- content-main end// -->
</main>
<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/select2.min.js"></script>
<script src="nest-backend/assets/js/vendors/perfect-scrollbar.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<script src="nest-backend/assets/js/vendors/chart.js"></script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
<script src="nest-backend/assets/js/custom-chart.js" type="text/javascript"></script>
</body>
</html>
