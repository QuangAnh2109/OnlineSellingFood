<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/19/2024
  Time: 3:44 PM
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
    <link rel="stylesheet" href="nest-frontend/assets/css/plugins/slider-range.css" />
    <link rel="stylesheet" href="nest-frontend/assets/css/main.css?v=4.0" />
</head>

<body>
<!-- Quick view -->
<div class="modal fade custom-modal" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12 mb-md-0 mb-sm-5">
                        <div class="detail-gallery">
                            <span class="zoom-icon"><i class="fi-rs-search"></i></span>
                            <!-- MAIN SLIDES -->
                            <div class="product-image-slider">
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-2.jpg" alt="product image" />
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-1.jpg" alt="product image" />
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-3.jpg" alt="product image" />
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-4.jpg" alt="product image" />
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-5.jpg" alt="product image" />
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-6.jpg" alt="product image" />
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-7.jpg" alt="product image" />
                                </figure>
                            </div>
                            <!-- THUMBNAILS -->
                            <div class="slider-nav-thumbnails">
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-3.jpg" alt="product image" /></div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-4.jpg" alt="product image" /></div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-5.jpg" alt="product image" /></div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-6.jpg" alt="product image" /></div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-7.jpg" alt="product image" /></div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-8.jpg" alt="product image" /></div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-9.jpg" alt="product image" /></div>
                            </div>
                        </div>
                        <!-- End Gallery -->
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="detail-info pr-30 pl-30">
                            <span class="stock-status out-stock"> Sale Off </span>
                            <h3 class="title-detail"><a href="shop-product-right.html" class="text-heading">Seeds of Change Organic Quinoa, Brown</a></h3>
                            <div class="product-detail-rating">
                                <div class="product-rate-cover text-end">
                                    <div class="product-rate d-inline-block">
                                        <div class="product-rating" style="width: 90%"></div>
                                    </div>
                                    <span class="font-small ml-5 text-muted"> (32 reviews)</span>
                                </div>
                            </div>
                            <div class="clearfix product-price-cover">
                                <div class="product-price primary-color float-left">
                                    <span class="current-price text-brand">$38</span>
                                    <span>
                                                <span class="save-price font-md color3 ml-15">26% Off</span>
                                                <span class="old-price font-md ml-15">$52</span>
                                            </span>
                                </div>
                            </div>
                            <div class="detail-extralink mb-30">
                                <div class="detail-qty border radius">
                                    <a href="#" class="qty-down"><i class="fi-rs-angle-small-down"></i></a>
                                    <span class="qty-val">1</span>
                                    <a href="#" class="qty-up"><i class="fi-rs-angle-small-up"></i></a>
                                </div>
                                <div class="product-extra-link2">
                                    <button type="submit" class="button button-add-to-cart"><i class="fi-rs-shopping-cart"></i>Add to cart</button>
                                </div>
                            </div>
                            <div class="font-xs">
                                <ul>
                                    <li class="mb-5">Vendor: <span class="text-brand">Nest</span></li>
                                    <li class="mb-5">MFG:<span class="text-brand"> Jun 4.2021</span></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Detail Info -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<header class="header-area header-style-1 header-height-2">


    <div class="header-middle header-middle-ptb-1 d-none d-lg-block">
        <div class="container">
            <div class="header-wrap">
                <div class="logo logo-width-1">
                    <a href="index.html"><img src="nest-frontend/assets/imgs/theme/logo.svg" alt="logo" /></a>
                </div>
                <div class="header-right">
                    <div class="search-style-2">
                        <form action="#">
                            <select class="select-active">
                                <option>All Categories</option>
                                <option>Milks and Dairies</option>
                                <option>Wines & Alcohol</option>
                                <option>Clothing & Beauty</option>
                                <option>Pet Foods & Toy</option>
                                <option>Fast food</option>
                                <option>Baking material</option>
                                <option>Vegetables</option>
                                <option>Fresh Seafood</option>
                                <option>Noodles & Rice</option>
                                <option>Ice cream</option>
                            </select>
                            <input type="text" placeholder="Search for items..." />
                        </form>
                    </div>
                    <div class="header-action-right">
                        <div class="header-action-2">
                            <div class="search-location">
                                <form action="#">
                                    <select class="select-active">
                                        <option>Your Location</option>
                                        <option>Alabama</option>
                                        <option>Alaska</option>
                                        <option>Arizona</option>
                                        <option>Delaware</option>
                                        <option>Florida</option>
                                        <option>Georgia</option>
                                        <option>Hawaii</option>
                                        <option>Indiana</option>
                                        <option>Maryland</option>
                                        <option>Nevada</option>
                                        <option>New Jersey</option>
                                        <option>New Mexico</option>
                                        <option>New York</option>
                                    </select>
                                </form>
                            </div>
                            <div class="header-action-icon-2">
                                <a href="shop-compare.html">
                                    <img class="svgInject" alt="Nest" src="nest-frontend/assets/imgs/theme/icons/icon-compare.svg" />
                                    <span class="pro-count blue">3</span>
                                </a>
                                <a href="shop-compare.html"><span class="lable ml-0">Compare</span></a>
                            </div>
                            <div class="header-action-icon-2">
                                <a href="shop-wishlist.html">
                                    <img class="svgInject" alt="Nest" src="nest-frontend/assets/imgs/theme/icons/icon-heart.svg" />
                                    <span class="pro-count blue">6</span>
                                </a>
                                <a href="shop-wishlist.html"><span class="lable">Wishlist</span></a>
                            </div>
                            <div class="header-action-icon-2">
                                <a class="mini-cart-icon" href="shop-cart.html">
                                    <img alt="Nest" src="nest-frontend/assets/imgs/theme/icons/icon-cart.svg" />
                                    <span class="pro-count blue">2</span>
                                </a>
                                <a href="shop-cart.html"><span class="lable">Cart</span></a>
                                <div class="cart-dropdown-wrap cart-dropdown-hm2">
                                    <ul>
                                        <li>
                                            <div class="shopping-cart-img">
                                                <a href="shop-product-right.html"><img alt="Nest" src="nest-frontend/assets/imgs/shop/thumbnail-3.jpg" /></a>
                                            </div>
                                            <div class="shopping-cart-title">
                                                <h4><a href="shop-product-right.html">Daisy Casual Bag</a></h4>
                                                <h4><span>1 × </span>$800.00</h4>
                                            </div>
                                            <div class="shopping-cart-delete">
                                                <a href="#"><i class="fi-rs-cross-small"></i></a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="shopping-cart-img">
                                                <a href="shop-product-right.html"><img alt="Nest" src="nest-frontend/assets/imgs/shop/thumbnail-2.jpg" /></a>
                                            </div>
                                            <div class="shopping-cart-title">
                                                <h4><a href="shop-product-right.html">Corduroy Shirts</a></h4>
                                                <h4><span>1 × </span>$3200.00</h4>
                                            </div>
                                            <div class="shopping-cart-delete">
                                                <a href="#"><i class="fi-rs-cross-small"></i></a>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="shopping-cart-footer">
                                        <div class="shopping-cart-total">
                                            <h4>Total <span>$4000.00</span></h4>
                                        </div>
                                        <div class="shopping-cart-button">
                                            <a href="shop-cart.html" class="outline">View cart</a>
                                            <a href="shop-checkout.html">Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="header-action-icon-2">
                                <a href="page-account.html">
                                    <img class="svgInject" alt="Nest" src="nest-frontend/assets/imgs/theme/icons/icon-user.svg" />
                                </a>
                                <a href="page-account.html"><span class="lable ml-0">${account.lastName} ${account.firstName}</span></a>
                                <div class="cart-dropdown-wrap cart-dropdown-hm2 account-dropdown">
                                    <ul>
                                        <li><a href="page-account.jsp"><i class="fi fi-rs-user mr-10"></i>My Account</a></li>
                                        <li><a href="page-account.html"><i class="fi fi-rs-location-alt mr-10"></i>Order Tracking</a></li>
                                        <li><a href="page-account.html"><i class="fi fi-rs-label mr-10"></i>My Voucher</a></li>
                                        <li><a href="shop-wishlist.html"><i class="fi fi-rs-heart mr-10"></i>My Wishlist</a></li>
                                        <li><a href="page-account.html"><i class="fi fi-rs-settings-sliders mr-10"></i>Setting</a></li>
                                        <li><a href="${pageContext.request.contextPath}/logout"><i class="fi fi-rs-sign-out mr-10"></i>Sign out</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>

<!--End header-->


<!-- Preloader Start -->
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="text-center">
                <img src="nest-frontend/assets/imgs/theme/loading.gif" alt="" />
            </div>
        </div>
    </div>
</div>
<!-- Vendor JS-->
<script src="nest-frontend/assets/js/vendor/modernizr-3.6.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/jquery-3.6.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/jquery-migrate-3.3.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/bootstrap.bundle.min.js"></script>
<script src="nest-frontend/assets/js/plugins/slick.js"></script>
<script src="nest-frontend/assets/js/plugins/jquery.syotimer.min.js"></script>
<script src="nest-frontend/assets/js/plugins/wow.js"></script>
<script src="nest-frontend/assets/js/plugins/slider-range.js"></script>
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

