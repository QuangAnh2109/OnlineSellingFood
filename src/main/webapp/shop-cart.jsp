<%--
  Created by IntelliJ IDEA.
  User: ducdx
  Date: 10/21/2024
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        accountName =  ((Account)session.getAttribute("account")).getName();
    }catch(NullPointerException e){
        accountName="";
    }
%>
<jsp:include page="header.jsp">
    <jsp:param name="accountName" value="<%=accountName%>"/>
</jsp:include>

<main class="main">
    <div class="page-header breadcrumb-wrap">
        <div class="container">
            <div class="breadcrumb">
                <a href="home" rel="nofollow"><i class="fi-rs-home mr-5"></i>Home</a>
                <span></span> Shop
                <span></span> Cart
            </div>
        </div>
    </div>
    <div class="container mb-80 mt-50">
        <div class="row">
            <div class="col-lg-8 mb-40">
                <h1 class="heading-2 mb-10">Your Cart</h1>
                <div class="d-flex justify-content-between">
                    <h6 class="text-body">There are <span class="text-brand">${products.size()}</span> products in your cart</h6>
                    <h6 class="text-body">
                        <a href="#" onclick="clearCart()" class="text-muted">
                            <i class="fi-rs-trash mr-5"></i>Clear Cart
                        </a>
                    </h6>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="table-responsive shopping-summery">
                    <table class="table table-wishlist">
                        <thead>
                        <tr class="main-heading">
                            <th scope="col" colspan="2">Product</th>
                            <th scope="col">Unit Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Subtotal</th>
                            <th scope="col" class="end">Remove</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="product" varStatus="status">
                            <c:if test="${not empty products}">
                                <c:forEach items="${products}" var="product">
                                    <tr>
                                        <td>${product.name}</td>
                                        <td>${product.price}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty products}">
                                <tr>
                                    <td colspan="3">No products in the cart.</td>
                                </tr>
                            </c:if>
                            <tr>
                                <td class="image product-thumbnail">
                                    <img src="${product.image}" alt="${product.name}">
                                </td>
                                <td class="product-des product-name">
                                    <h6 class="mb-5">
                                        <a class="product-name mb-10 text-heading" href="product?id=${product.id}">
                                                ${product.name}
                                        </a>
                                    </h6>
                                </td>
                                <td class="price" data-title="Price">
                                    <h4 class="text-body">$${product.price}</h4>
                                </td>
                                <td class="text-center detail-info" data-title="Stock">
                                    <div class="detail-extralink mr-15">
                                        <div class="detail-qty border radius">
                                            <a href="#" class="qty-down" onclick="updateQuantity(${product.id}, 'down')">
                                                <i class="fi-rs-angle-small-down"></i>
                                            </a>
                                            <span class="qty-val">1</span>
                                            <a href="#" class="qty-up" onclick="updateQuantity(${product.id}, 'up')">
                                                <i class="fi-rs-angle-small-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td class="price" data-title="Price">
                                    <h4 class="text-brand">$${product.price}</h4>
                                </td>
                                <td class="action text-center" data-title="Remove">
                                    <a href="#" onclick="removeFromCart(${product.id})" class="text-body">
                                        <i class="fi-rs-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="divider-2 mb-30"></div>
                <div class="cart-action d-flex justify-content-between">
                    <a href="shop" class="btn">
                        <i class="fi-rs-arrow-left mr-10"></i>Continue Shopping
                    </a>
                    <a href="#" onclick="updateCart()" class="btn mr-10 mb-sm-15">
                        <i class="fi-rs-refresh mr-10"></i>Update Cart
                    </a>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="border p-md-4 cart-totals ml-30">
                    <div class="table-responsive">
                        <table class="table no-border">
                            <tbody>
                            <tr>
                                <td class="cart_total_label">
                                    <h6 class="text-muted">Subtotal</h6>
                                </td>
                                <td class="cart_total_amount">
                                    <h4 class="text-brand text-end">$${total}</h4>
                                </td>
                            </tr>
                            <tr>
                                <td class="cart_total_label">
                                    <h6 class="text-muted">Shipping</h6>
                                </td>
                                <td class="cart_total_amount">
                                    <h5 class="text-heading text-end">Free</h5>
                                </td>
                            </tr>
                            <tr>
                                <td class="cart_total_label">
                                    <h6 class="text-muted">Total</h6>
                                </td>
                                <td class="cart_total_amount">
                                    <h4 class="text-brand text-end">$${total}</h4>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <a href="checkout" class="btn mb-20 w-100">
                        Proceed To CheckOut<i class="fi-rs-sign-out ml-15"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    function removeFromCart(productId) {
        fetch('cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `action=remove&productID=${productId}`
        }).then(() => window.location.reload());
    }

    function clearCart() {
        if(confirm('Are you sure you want to clear your cart?')) {
            fetch('cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'action=clear'
            }).then(() => window.location.reload());
        }
    }

    function updateQuantity(productId, action) {
        // Implement quantity update logic
        const qtyElement = event.target.closest('.detail-qty').querySelector('.qty-val');
        let qty = parseInt(qtyElement.textContent);

        if(action === 'up') {
            qty++;
        } else if(action === 'down' && qty > 1) {
            qty--;
        }

        qtyElement.textContent = qty;
    }

    function updateCart() {
        // Implement cart update logic
        window.location.reload();
    }

</script>
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
