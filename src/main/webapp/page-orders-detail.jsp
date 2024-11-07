<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <main class="main-wrap">
            <section class="content-main">
                <div class="content-header">
                    <div>
                        <h2 class="content-title card-title">Chi tiết đơn hàng</h2>
                        <p>Chi tiết đơn hàng: ${orderID}</p>
                    </div>
                </div>
                <div class="card">
                    <header class="card-header">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-6 mb-lg-0 mb-15">
                                <span> <i class="material-icons md-calendar_today"></i> <b>${orderTime}</b> </span> <br />
                                <small class="text-muted">ID đặt hàng:${orderID} </small>
                            </div>
                            <div class="col-lg-6 col-md-6 ms-auto text-md-end">
                                <select class="form-select d-inline-block mb-lg-0 mr-5 mw-200">
                                    <option>Change status</option>
                                    <option>Awaiting payment</option>
                                    <option>Confirmed</option>
                                    <option>Shipped</option>
                                    <option>Delivered</option>
                                </select>
                                <a class="btn btn-primary" href="#">Lưu</a>
                                <a class="btn btn-secondary print ms-2" href="#"><i class="icon material-icons md-print"></i></a>
                            </div>
                        </div>
                    </header>
                    <!-- card-header end// -->
                    <div class="card-body">
                        <div class="row mb-50 mt-20 order-info-wrap">
                            <div class="col-md-4">
                                <article class="icontext align-items-start">
                                    <span class="icon icon-sm rounded-circle bg-primary-light">
                                        <i class="text-primary material-icons md-person"></i>
                                    </span>
                                    <div class="text">
                                        <h6 class="mb-1">Khách hàng</h6>
                                        <p class="mb-1">
                                            ${customerName} <br />
                                            ${email} <br />
                                            ${phone}
                                        </p>
                                        <a href="page-account-information.jsp">Xem chi tiết</a>
                                    </div>
                                </article>
                            </div>
                            <!-- col// -->
                            <div class="col-md-4">
                                <article class="icontext align-items-start">
                                    <span class="icon icon-sm rounded-circle bg-primary-light">
                                        <i class="text-primary material-icons md-local_shipping"></i>
                                    </span>
                                    <div class="text">
                                        <h6 class="mb-1">Order info</h6>
                                        <p class="mb-1">
                                            Shipping: Fargo express <br />
                                            Pay method: card <br />
                                            Status: new
                                        </p>
                                        <a href="#">Download info</a>
                                    </div>
                                </article>
                            </div>
                            <!-- col// -->
                            <div class="col-md-4">
                                <article class="icontext align-items-start">
                                    <span class="icon icon-sm rounded-circle bg-primary-light">
                                        <i class="text-primary material-icons md-place"></i>
                                    </span>
                                    <div class="text">
                                        <h6 class="mb-1">Địa chỉ nhận hàng</h6>
                                        <p class="mb-1">
                                           ${address} <br />

                                        </p>
                                        <a href="page-account-contact.jsp">Xem chi tiết</a>
                                    </div>
                                </article>
                            </div>
                            <!-- col// -->
                        </div>
                        <!-- row // -->
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th width="40%">Sản phẩm</th>
                                                <th width="20%">Giá</th>
                                                <th width="20%">Số lượng</th>
                                                <th width="20%" class="text-end">Tổng tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${list}" var="l">
                                        <tr>
                                            <td>
                                                <a class="itemside" href="#">
                                                    <div class="left">
                                                        <img src="nest-backend/assets/imgs/items/1.jpg" width="40" height="40" class="img-xs" alt="Item" />
                                                    </div>
                                                    <div class="info">${l.productName}</div>
                                                </a>
                                            </td>
                                            <td>${l.price}VND</td>
                                            <td>${l.quantity}</td>
                                            <td class="text-end">${l.totalPrice}VND</td>
                                        </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="4">
                                                <article class="float-end">
                                                    <dl class="dlist">
                                                        <dt>Tổng tiền:</dt>
                                                        <dd>${l.totalPrice}VND</dd>
                                                    </dl>
                                                    <dl class="dlist">
                                                        <dt>Phiếu giảm giá:</dt>
                                                        <dd>${l.discountVoucher}%</dd>
                                                    </dl>
                                                    <dl class="dlist">
                                                        <dt>Tổng tiền sau khi áp dụng phiếu giảm giá:</dt>
                                                        <dd><b class="h5">${l.totalPriceAfterVoucher}VND</b></dd>
                                                    </dl>
                                                    <dl class="dlist">
                                                        <dt class="text-muted">Trạng thái:</dt>
                                                        <dd>
                                                            <span class="badge rounded-pill alert-success text-success">${l.statusDetail}</span>
                                                        </dd>
                                                    </dl>
                                                </article>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- table-responsive// -->
                            </div>
                            <!-- col// -->
                            <div class="col-lg-1"></div>
                            <div class="col-lg-4">
                                <div class="box shadow-sm bg-light">
                                    <h6 class="mb-15">Payment info</h6>
                                    <p>
                                        <img src="nest-backend/assets/imgs/card-brands/2.png" class="border" height="20" /> Master Card **** **** 4768 <br />
                                        Business name: Grand Market LLC <br />
                                        Phone: +1 (800) 555-154-52
                                    </p>
                                </div>
                                <div class="h-25 pt-4">
                                    <div class="mb-3">
                                        <label>Notes</label>
                                        <textarea class="form-control" name="notes" id="notes" placeholder="Type some note"></textarea>
                                    </div>
                                    <button class="btn btn-primary">Save note</button>
                                </div>
                            </div>
                            <!-- col// -->
                        </div>
                    </div>
                    <!-- card-body end// -->
                </div>
                <!-- card end// -->
            </section>
            <!-- content-main end// -->
        </main>
        <script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
        <script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
        <script src="nest-backend/assets/js/vendors/select2.min.js"></script>
        <script src="nest-backend/assets/js/vendors/perfect-scrollbar.js"></script>
        <script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
        <!-- Main Script -->
        <script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
    </body>
</html>
