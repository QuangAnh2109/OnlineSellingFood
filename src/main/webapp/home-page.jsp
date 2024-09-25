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
<jsp:include page="header.jsp" />
<div class="mobile-header-active mobile-header-wrapper-style">
  <div class="mobile-header-wrapper-inner">
    <div class="mobile-header-top">
      <div class="mobile-header-logo">
        <a href="index.html"><img src="nest-frontend/assets/imgs/theme/logo.svg" alt="logo" /></a>
      </div>
      <div class="mobile-menu-close close-style-wrap close-style-position-inherit">
        <button class="close-style search-close">
          <i class="icon-top"></i>
          <i class="icon-bottom"></i>
        </button>
      </div>
    </div>
    <div class="mobile-header-content-area">
      <div class="mobile-search search-style-3 mobile-header-border">
        <form action="#">
          <input type="text" placeholder="Search for items…" />
          <button type="submit"><i class="fi-rs-search"></i></button>
        </form>
      </div>
      <div class="mobile-menu-wrap mobile-header-border">
        <!-- mobile menu start -->
        <nav>
          <ul class="mobile-menu font-heading">
            <li class="menu-item-has-children">
              <a href="index.html">Home</a>
              <ul class="dropdown">
                <li><a href="index.html">Home 1</a></li>
                <li><a href="index-2.html">Home 2</a></li>
                <li><a href="index-3.html">Home 3</a></li>
                <li><a href="index-4.html">Home 4</a></li>
                <li><a href="index-5.html">Home 5</a></li>
                <li><a href="index-6.html">Home 6</a></li>
              </ul>
            </li>
            <li class="menu-item-has-children">
              <a href="shop-grid-right.html">shop</a>
              <ul class="dropdown">
                <li><a href="shop-grid-right.html">Shop Grid – Right Sidebar</a></li>
                <li><a href="shop-grid-left.html">Shop Grid – Left Sidebar</a></li>
                <li><a href="shop-list-right.html">Shop List – Right Sidebar</a></li>
                <li><a href="shop-list-left.html">Shop List – Left Sidebar</a></li>
                <li><a href="shop-fullwidth.html">Shop - Wide</a></li>
                <li class="menu-item-has-children">
                  <a href="#">Single Product</a>
                  <ul class="dropdown">
                    <li><a href="shop-product-right.html">Product – Right Sidebar</a></li>
                    <li><a href="shop-product-left.html">Product – Left Sidebar</a></li>
                    <li><a href="shop-product-full.html">Product – No sidebar</a></li>
                    <li><a href="shop-product-vendor.html">Product – Vendor Infor</a></li>
                  </ul>
                </li>
                <li><a href="shop-filter.html">Shop – Filter</a></li>
                <li><a href="shop-wishlist.html">Shop – Wishlist</a></li>
                <li><a href="shop-cart.html">Shop – Cart</a></li>
                <li><a href="shop-checkout.html">Shop – Checkout</a></li>
                <li><a href="shop-compare.html">Shop – Compare</a></li>
                <li class="menu-item-has-children">
                  <a href="#">Shop Invoice</a>
                  <ul class="dropdown">
                    <li><a href="shop-invoice-1.html">Shop Invoice 1</a></li>
                    <li><a href="shop-invoice-2.html">Shop Invoice 2</a></li>
                    <li><a href="shop-invoice-3.html">Shop Invoice 3</a></li>
                    <li><a href="shop-invoice-4.html">Shop Invoice 4</a></li>
                    <li><a href="shop-invoice-5.html">Shop Invoice 5</a></li>
                    <li><a href="shop-invoice-6.html">Shop Invoice 6</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="menu-item-has-children">
              <a href="#">Vendors</a>
              <ul class="dropdown">
                <li><a href="vendors-grid.html">Vendors Grid</a></li>
                <li><a href="vendors-list.html">Vendors List</a></li>
                <li><a href="vendor-details-1.html">Vendor Details 01</a></li>
                <li><a href="vendor-details-2.html">Vendor Details 02</a></li>
                <li><a href="vendor-dashboard.html">Vendor Dashboard</a></li>
                <li><a href="vendor-guide.html">Vendor Guide</a></li>
              </ul>
            </li>
            <li class="menu-item-has-children">
              <a href="#">Mega menu</a>
              <ul class="dropdown">
                <li class="menu-item-has-children">
                  <a href="#">Women's Fashion</a>
                  <ul class="dropdown">
                    <li><a href="shop-product-right.html">Dresses</a></li>
                    <li><a href="shop-product-right.html">Blouses & Shirts</a></li>
                    <li><a href="shop-product-right.html">Hoodies & Sweatshirts</a></li>
                    <li><a href="shop-product-right.html">Women's Sets</a></li>
                  </ul>
                </li>
                <li class="menu-item-has-children">
                  <a href="#">Men's Fashion</a>
                  <ul class="dropdown">
                    <li><a href="shop-product-right.html">Jackets</a></li>
                    <li><a href="shop-product-right.html">Casual Faux Leather</a></li>
                    <li><a href="shop-product-right.html">Genuine Leather</a></li>
                  </ul>
                </li>
                <li class="menu-item-has-children">
                  <a href="#">Technology</a>
                  <ul class="dropdown">
                    <li><a href="shop-product-right.html">Gaming Laptops</a></li>
                    <li><a href="shop-product-right.html">Ultraslim Laptops</a></li>
                    <li><a href="shop-product-right.html">Tablets</a></li>
                    <li><a href="shop-product-right.html">Laptop Accessories</a></li>
                    <li><a href="shop-product-right.html">Tablet Accessories</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="menu-item-has-children">
              <a href="blog-category-fullwidth.html">Blog</a>
              <ul class="dropdown">
                <li><a href="blog-category-grid.html">Blog Category Grid</a></li>
                <li><a href="blog-category-list.html">Blog Category List</a></li>
                <li><a href="blog-category-big.html">Blog Category Big</a></li>
                <li><a href="blog-category-fullwidth.html">Blog Category Wide</a></li>
                <li class="menu-item-has-children">
                  <a href="#">Single Product Layout</a>
                  <ul class="dropdown">
                    <li><a href="blog-post-left.html">Left Sidebar</a></li>
                    <li><a href="blog-post-right.html">Right Sidebar</a></li>
                    <li><a href="blog-post-fullwidth.html">No Sidebar</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="menu-item-has-children">
              <a href="#">Pages</a>
              <ul class="dropdown">
                <li><a href="page-about.html">About Us</a></li>
                <li><a href="page-contact.html">Contact</a></li>
                <li><a href="page-account.html">My Account</a></li>
                <li><a href="page-login.html">Login</a></li>
                <li><a href="page-register.html">Register</a></li>
                <li><a href="page-purchase-guide.html">Purchase Guide</a></li>
                <li><a href="page-privacy-policy.html">Privacy Policy</a></li>
                <li><a href="page-terms.html">Terms of Service</a></li>
                <li><a href="page-404.html">404 Page</a></li>
              </ul>
            </li>
            <li class="menu-item-has-children">
              <a href="#">Language</a>
              <ul class="dropdown">
                <li><a href="#">English</a></li>
                <li><a href="#">French</a></li>
                <li><a href="#">German</a></li>
                <li><a href="#">Spanish</a></li>
              </ul>
            </li>
          </ul>
        </nav>
        <!-- mobile menu end -->
      </div>
      <div class="mobile-header-info-wrap">
        <div class="single-mobile-header-info">
          <a href="page-contact.html"><i class="fi-rs-marker"></i> Our location </a>
        </div>
        <div class="single-mobile-header-info">
          <a href="page-login.html"><i class="fi-rs-user"></i>Log In / Sign Up </a>
        </div>
        <div class="single-mobile-header-info">
          <a href="#"><i class="fi-rs-headphones"></i>(+01) - 2345 - 6789 </a>
        </div>
      </div>
      <div class="mobile-social-icon mb-50">
        <h6 class="mb-15">Follow Us</h6>
        <a href="#"><img src="nest-frontend/assets/imgs/theme/icons/icon-facebook-white.svg" alt="" /></a>
        <a href="#"><img src="nest-frontend/assets/imgs/theme/icons/icon-twitter-white.svg" alt="" /></a>
        <a href="#"><img src="nest-frontend/assets/imgs/theme/icons/icon-instagram-white.svg" alt="" /></a>
        <a href="#"><img src="nest-frontend/assets/imgs/theme/icons/icon-pinterest-white.svg" alt="" /></a>
        <a href="#"><img src="nest-frontend/assets/imgs/theme/icons/icon-youtube-white.svg" alt="" /></a>
      </div>
      <div class="site-copyright">Copyright 2021 © Nest. All rights reserved. Powered by AliThemes.</div>
    </div>
  </div>
</div>
<!--End header-->
<main class="main">
  <div class="container mb-30">
    <div class="row flex-row-reverse">
      <div class="col-lg-4-5">
        <section class="home-slider position-relative mb-30">
          <div class="home-slide-cover mt-30">
            <div class="hero-slider-1 style-4 dot-style-1 dot-style-1-position-1">
              <div class="single-hero-slider single-animation-wrap" style="background-image: url(nest-frontend/assets/imgs/slider/slider-1.png)">
                <div class="slider-content">
                  <h1 class="display-2 mb-40">
                    Dont miss amazing<br />
                    grocery deals
                  </h1>
                  <p class="mb-65">Sign up for the daily newsletter</p>
                  <form class="form-subcriber d-flex">
                    <input type="email" placeholder="Your emaill address" />
                    <button class="btn" type="submit">Subscribe</button>
                  </form>
                </div>
              </div>
              <div class="single-hero-slider single-animation-wrap" style="background-image: url(nest-frontend/assets/imgs/slider/slider-2.png)">
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
        </section>
        <!--End hero-->
        <section class="product-tabs section-padding position-relative">
          <div class="section-title style-2">
            <h3>Popular Products</h3>
            <ul class="nav nav-tabs links" id="myTab" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link active" id="nav-tab-one" data-bs-toggle="tab" data-bs-target="#tab-one" type="button" role="tab" aria-controls="tab-one" aria-selected="true">All</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="nav-tab-two" data-bs-toggle="tab" data-bs-target="#tab-two" type="button" role="tab" aria-controls="tab-two" aria-selected="false">Milks & Dairies</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="nav-tab-three" data-bs-toggle="tab" data-bs-target="#tab-three" type="button" role="tab" aria-controls="tab-three" aria-selected="false">Coffes & Teas</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="nav-tab-four" data-bs-toggle="tab" data-bs-target="#tab-four" type="button" role="tab" aria-controls="tab-four" aria-selected="false">Pet Foods</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="nav-tab-five" data-bs-toggle="tab" data-bs-target="#tab-five" type="button" role="tab" aria-controls="tab-five" aria-selected="false">Meats</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="nav-tab-six" data-bs-toggle="tab" data-bs-target="#tab-six" type="button" role="tab" aria-controls="tab-six" aria-selected="false">Vegetables</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="nav-tab-seven" data-bs-toggle="tab" data-bs-target="#tab-seven" type="button" role="tab" aria-controls="tab-seven" aria-selected="false">Fruits</button>
              </li>
            </ul>
          </div>
          <!--End nav-tabs-->
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="tab-one" role="tabpanel" aria-labelledby="tab-one">
              <div class="row product-grid-4">
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-1-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-1-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Seeds of Change Organic Quinoe</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$28.85</span>
                          <span class="old-price">$32.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-2-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-2-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">All Natural Italian-Style Chicken Meatballs</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 80%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (3.5)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Stouffer</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$52.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-3-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-3-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="new">New</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Angie’s Boomchickapop Sweet & Salty</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 85%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">StarKist</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$48.85</span>
                          <span class="old-price">$52.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-4-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-4-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Vegetables</a>
                      </div>
                      <h2><a href="shop-product-right.html">Foster Farms Takeout Crispy Classic</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$17.85</span>
                          <span class="old-price">$19.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-5-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-5-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="best">-14%</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Pet Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Blue Diamond Almonds Lightly</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-6-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-6-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Chobani Complete Vanilla Greek</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$54.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-7-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-7-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Meats</a>
                      </div>
                      <h2><a href="shop-product-right.html">Canada Dry Ginger Ale – 2 L Bottle</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$32.85</span>
                          <span class="old-price">$33.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-8-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-8-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Encore Seafoods Stuffed Alaskan</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$35.85</span>
                          <span class="old-price">$37.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Coffes</a>
                      </div>
                      <h2><a href="shop-product-right.html">Gorton’s Beer Battered Fish Fillets</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Old El Paso</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6 d-none d-xl-block">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-10-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-10-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Cream</a>
                      </div>
                      <h2><a href="shop-product-right.html">Haagen-Dazs Caramel Cone Ice Cream</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 50%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (2.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Tyson</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$22.85</span>
                          <span class="old-price">$24.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
              </div>
              <!--End product-grid-4-->
            </div>
            <!--En tab one-->
            <div class="tab-pane fade" id="tab-two" role="tabpanel" aria-labelledby="tab-two">
              <div class="row product-grid-4">
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-10-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-10-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Seeds of Change Organic Quinoa, Brown, & Red Rice</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$28.85</span>
                          <span class="old-price">$32.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-12-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-12-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">All Natural Italian-Style Chicken Meatballs</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 80%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (3.5)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Stouffer</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$52.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-13-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-13-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="new">New</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Angie’s Boomchickapop Sweet & Salty Kettle Corn</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 85%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">StarKist</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$48.85</span>
                          <span class="old-price">$52.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-14-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-14-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Vegetables</a>
                      </div>
                      <h2><a href="shop-product-right.html">Foster Farms Takeout Crispy Classic Buffalo Wings</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$17.85</span>
                          <span class="old-price">$19.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-15-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-15-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="best">-14%</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Pet Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Blue Diamond Almonds Lightly Salted Vegetables</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-16-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-16-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Chobani Complete Vanilla Greek Yogurt</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$54.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-7-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-7-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Meats</a>
                      </div>
                      <h2><a href="shop-product-right.html">Canada Dry Ginger Ale – 2 L Bottle - 200ml - 400g</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$32.85</span>
                          <span class="old-price">$33.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-8-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-8-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Encore Seafoods Stuffed Alaskan Salmon</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$35.85</span>
                          <span class="old-price">$37.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Coffes</a>
                      </div>
                      <h2><a href="shop-product-right.html">Gorton’s Beer Battered Fish Fillets with soft paper</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Old El Paso</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6 d-none d-xl-block">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-10-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-10-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Cream</a>
                      </div>
                      <h2><a href="shop-product-right.html">Haagen-Dazs Caramel Cone Ice Cream Ketchup</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 50%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (2.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Tyson</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$22.85</span>
                          <span class="old-price">$24.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
              </div>
              <!--End product-grid-4-->
            </div>
            <!--En tab two-->
            <div class="tab-pane fade" id="tab-three" role="tabpanel" aria-labelledby="tab-three">
              <div class="row product-grid-4">
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Seeds of Change Organic Quinoa, Brown, & Red Rice</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$28.85</span>
                          <span class="old-price">$32.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-8-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-8-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">All Natural Italian-Style Chicken Meatballs</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 80%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (3.5)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Stouffer</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$52.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-7-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-7-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="new">New</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Angie’s Boomchickapop Sweet & Salty Kettle Corn</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 85%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">StarKist</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$48.85</span>
                          <span class="old-price">$52.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-6-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-6-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Vegetables</a>
                      </div>
                      <h2><a href="shop-product-right.html">Foster Farms Takeout Crispy Classic Buffalo Wings</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$17.85</span>
                          <span class="old-price">$19.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-5-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-5-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="best">-14%</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Pet Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Blue Diamond Almonds Lightly Salted Vegetables</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-4-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-4-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Chobani Complete Vanilla Greek Yogurt</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$54.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-3-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-3-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Meats</a>
                      </div>
                      <h2><a href="shop-product-right.html">Canada Dry Ginger Ale – 2 L Bottle - 200ml - 400g</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$32.85</span>
                          <span class="old-price">$33.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-2-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-2-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Encore Seafoods Stuffed Alaskan Salmon</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$35.85</span>
                          <span class="old-price">$37.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Coffes</a>
                      </div>
                      <h2><a href="shop-product-right.html">Gorton’s Beer Battered Fish Fillets with soft paper</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Old El Paso</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6 d-none d-xl-block">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-1-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-1-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Cream</a>
                      </div>
                      <h2><a href="shop-product-right.html">Haagen-Dazs Caramel Cone Ice Cream Ketchup</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 50%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (2.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Tyson</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$22.85</span>
                          <span class="old-price">$24.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
              </div>
              <!--End product-grid-4-->
            </div>
            <!--En tab three-->
            <div class="tab-pane fade" id="tab-four" role="tabpanel" aria-labelledby="tab-four">
              <div class="row product-grid-4">
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-6-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-6-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Seeds of Change Organic Quinoa, Brown, & Red Rice</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$28.85</span>
                          <span class="old-price">$32.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-7-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-7-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">All Natural Italian-Style Chicken Meatballs</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 80%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (3.5)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Stouffer</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$52.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-8-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-8-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="new">New</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Angie’s Boomchickapop Sweet & Salty Kettle Corn</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 85%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">StarKist</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$48.85</span>
                          <span class="old-price">$52.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Vegetables</a>
                      </div>
                      <h2><a href="shop-product-right.html">Foster Farms Takeout Crispy Classic Buffalo Wings</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$17.85</span>
                          <span class="old-price">$19.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-4-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-4-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="best">-14%</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Pet Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Blue Diamond Almonds Lightly Salted Vegetables</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-3-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-3-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Chobani Complete Vanilla Greek Yogurt</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$54.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-2-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-2-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Meats</a>
                      </div>
                      <h2><a href="shop-product-right.html">Canada Dry Ginger Ale – 2 L Bottle - 200ml - 400g</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$32.85</span>
                          <span class="old-price">$33.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-1-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-1-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Encore Seafoods Stuffed Alaskan Salmon</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$35.85</span>
                          <span class="old-price">$37.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-11-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-11-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Coffes</a>
                      </div>
                      <h2><a href="shop-product-right.html">Gorton’s Beer Battered Fish Fillets with soft paper</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Old El Paso</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6 d-none d-xl-block">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-12-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-12-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Cream</a>
                      </div>
                      <h2><a href="shop-product-right.html">Haagen-Dazs Caramel Cone Ice Cream Ketchup</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 50%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (2.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Tyson</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$22.85</span>
                          <span class="old-price">$24.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
              </div>
              <!--End product-grid-4-->
            </div>
            <!--En tab four-->
            <div class="tab-pane fade" id="tab-five" role="tabpanel" aria-labelledby="tab-five">
              <div class="row product-grid-4">
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-12-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-12-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Seeds of Change Organic Quinoa, Brown, & Red Rice</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$28.85</span>
                          <span class="old-price">$32.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-13-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-13-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">All Natural Italian-Style Chicken Meatballs</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 80%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (3.5)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Stouffer</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$52.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-14-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-14-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="new">New</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Angie’s Boomchickapop Sweet & Salty Kettle Corn</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 85%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">StarKist</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$48.85</span>
                          <span class="old-price">$52.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-15-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-15-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Vegetables</a>
                      </div>
                      <h2><a href="shop-product-right.html">Foster Farms Takeout Crispy Classic Buffalo Wings</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$17.85</span>
                          <span class="old-price">$19.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-16-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-16-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="best">-14%</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Pet Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Blue Diamond Almonds Lightly Salted Vegetables</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-5-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-5-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Chobani Complete Vanilla Greek Yogurt</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$54.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-7-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-7-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Meats</a>
                      </div>
                      <h2><a href="shop-product-right.html">Canada Dry Ginger Ale – 2 L Bottle - 200ml - 400g</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$32.85</span>
                          <span class="old-price">$33.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-8-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-8-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Encore Seafoods Stuffed Alaskan Salmon</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$35.85</span>
                          <span class="old-price">$37.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Coffes</a>
                      </div>
                      <h2><a href="shop-product-right.html">Gorton’s Beer Battered Fish Fillets with soft paper</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Old El Paso</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6 d-none d-xl-block">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-10-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-10-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Cream</a>
                      </div>
                      <h2><a href="shop-product-right.html">Haagen-Dazs Caramel Cone Ice Cream Ketchup</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 50%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (2.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Tyson</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$22.85</span>
                          <span class="old-price">$24.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
              </div>
              <!--End product-grid-4-->
            </div>
            <!--En tab five-->
            <div class="tab-pane fade" id="tab-six" role="tabpanel" aria-labelledby="tab-six">
              <div class="row product-grid-4">
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-4-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-4-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Seeds of Change Organic Quinoa, Brown, & Red Rice</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$28.85</span>
                          <span class="old-price">$32.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-6-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-6-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">All Natural Italian-Style Chicken Meatballs</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 80%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (3.5)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Stouffer</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$52.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-8-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-8-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="new">New</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Angie’s Boomchickapop Sweet & Salty Kettle Corn</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 85%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">StarKist</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$48.85</span>
                          <span class="old-price">$52.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Vegetables</a>
                      </div>
                      <h2><a href="shop-product-right.html">Foster Farms Takeout Crispy Classic Buffalo Wings</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$17.85</span>
                          <span class="old-price">$19.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-5-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-5-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="best">-14%</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Pet Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Blue Diamond Almonds Lightly Salted Vegetables</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-6-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-6-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Chobani Complete Vanilla Greek Yogurt</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$54.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-7-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-7-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Meats</a>
                      </div>
                      <h2><a href="shop-product-right.html">Canada Dry Ginger Ale – 2 L Bottle - 200ml - 400g</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$32.85</span>
                          <span class="old-price">$33.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-8-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-8-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Encore Seafoods Stuffed Alaskan Salmon</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$35.85</span>
                          <span class="old-price">$37.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Coffes</a>
                      </div>
                      <h2><a href="shop-product-right.html">Gorton’s Beer Battered Fish Fillets with soft paper</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Old El Paso</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6 d-none d-xl-block">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-10-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-10-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Cream</a>
                      </div>
                      <h2><a href="shop-product-right.html">Haagen-Dazs Caramel Cone Ice Cream Ketchup</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 50%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (2.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Tyson</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$22.85</span>
                          <span class="old-price">$24.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
              </div>
              <!--End product-grid-4-->
            </div>
            <!--En tab six-->
            <div class="tab-pane fade" id="tab-seven" role="tabpanel" aria-labelledby="tab-seven">
              <div class="row product-grid-4">
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-5-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-5-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Seeds of Change Organic Quinoa, Brown, & Red Rice</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$28.85</span>
                          <span class="old-price">$32.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-3-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-3-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">All Natural Italian-Style Chicken Meatballs</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 80%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (3.5)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Stouffer</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$52.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-7-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-7-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="new">New</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Angie’s Boomchickapop Sweet & Salty Kettle Corn</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 85%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">StarKist</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$48.85</span>
                          <span class="old-price">$52.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Vegetables</a>
                      </div>
                      <h2><a href="shop-product-right.html">Foster Farms Takeout Crispy Classic Buffalo Wings</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$17.85</span>
                          <span class="old-price">$19.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap mb-30">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-10-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-10-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="best">-14%</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Pet Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Blue Diamond Almonds Lightly Salted Vegetables</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-16-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-16-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Hodo Foods</a>
                      </div>
                      <h2><a href="shop-product-right.html">Chobani Complete Vanilla Greek Yogurt</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$54.85</span>
                          <span class="old-price">$55.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-7-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-7-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Meats</a>
                      </div>
                      <h2><a href="shop-product-right.html">Canada Dry Ginger Ale – 2 L Bottle - 200ml - 400g</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$32.85</span>
                          <span class="old-price">$33.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-8-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-8-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="sale">Sale</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Snack</a>
                      </div>
                      <h2><a href="shop-product-right.html">Encore Seafoods Stuffed Alaskan Salmon</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$35.85</span>
                          <span class="old-price">$37.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-9-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-9-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                      <div class="product-badges product-badges-position product-badges-mrg">
                        <span class="hot">Hot</span>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Coffes</a>
                      </div>
                      <h2><a href="shop-product-right.html">Gorton’s Beer Battered Fish Fillets with soft paper</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 90%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (4.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Old El Paso</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$23.85</span>
                          <span class="old-price">$25.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
                <div class="col-lg-1-5 col-md-4 col-12 col-sm-6 d-none d-xl-block">
                  <div class="product-cart-wrap">
                    <div class="product-img-action-wrap">
                      <div class="product-img product-img-zoom">
                        <a href="shop-product-right.html">
                          <img class="default-img" src="nest-frontend/assets/imgs/shop/product-10-1.jpg" alt="" />
                          <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-10-2.jpg" alt="" />
                        </a>
                      </div>
                      <div class="product-action-1">
                        <a aria-label="Add To Wishlist" class="action-btn" href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                        <a aria-label="Compare" class="action-btn" href="shop-compare.html"><i class="fi-rs-shuffle"></i></a>
                        <a aria-label="Quick view" class="action-btn" data-bs-toggle="modal" data-bs-target="#quickViewModal"><i class="fi-rs-eye"></i></a>
                      </div>
                    </div>
                    <div class="product-content-wrap">
                      <div class="product-category">
                        <a href="shop-grid-right.html">Cream</a>
                      </div>
                      <h2><a href="shop-product-right.html">Haagen-Dazs Caramel Cone Ice Cream Ketchup</a></h2>
                      <div class="product-rate-cover">
                        <div class="product-rate d-inline-block">
                          <div class="product-rating" style="width: 50%"></div>
                        </div>
                        <span class="font-small ml-5 text-muted"> (2.0)</span>
                      </div>
                      <div>
                        <span class="font-small text-muted">By <a href="vendor-details-1.html">Tyson</a></span>
                      </div>
                      <div class="product-card-bottom">
                        <div class="product-price">
                          <span>$22.85</span>
                          <span class="old-price">$24.8</span>
                        </div>
                        <div class="add-cart">
                          <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end product card-->
              </div>
              <!--End product-grid-4-->
            </div>
            <!--En tab seven-->
          </div>
          <!--End tab-content-->
        </section>
        <!--Products Tabs-->
        <section class="section-padding pb-5">
          <div class="section-title">
            <h3 class="">Deals Of The Day</h3>
            <a class="show-all" href="shop-grid-right.html">
              All Deals
              <i class="fi-rs-angle-right"></i>
            </a>
          </div>
          <div class="row">
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="product-cart-wrap style-2">
                <div class="product-img-action-wrap">
                  <div class="product-img">
                    <a href="shop-product-right.html">
                      <img src="nest-frontend/assets/imgs/banner/banner-5.png" alt="" />
                    </a>
                  </div>
                </div>
                <div class="product-content-wrap">
                  <div class="deals-countdown-wrap">
                    <div class="deals-countdown" data-countdown="2025/03/25 00:00:00"></div>
                  </div>
                  <div class="deals-content">
                    <h2><a href="shop-product-right.html">Seeds of Change Organic Quinoa, Brown</a></h2>
                    <div class="product-rate-cover">
                      <div class="product-rate d-inline-block">
                        <div class="product-rating" style="width: 90%"></div>
                      </div>
                      <span class="font-small ml-5 text-muted"> (4.0)</span>
                    </div>
                    <div>
                      <span class="font-small text-muted">By <a href="vendor-details-1.html">NestFood</a></span>
                    </div>
                    <div class="product-card-bottom">
                      <div class="product-price">
                        <span>$32.85</span>
                        <span class="old-price">$33.8</span>
                      </div>
                      <div class="add-cart">
                        <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="product-cart-wrap style-2">
                <div class="product-img-action-wrap">
                  <div class="product-img">
                    <a href="shop-product-right.html">
                      <img src="nest-frontend/assets/imgs/banner/banner-6.png" alt="" />
                    </a>
                  </div>
                </div>
                <div class="product-content-wrap">
                  <div class="deals-countdown-wrap">
                    <div class="deals-countdown" data-countdown="2026/04/25 00:00:00"></div>
                  </div>
                  <div class="deals-content">
                    <h2><a href="shop-product-right.html">Perdue Simply Smart Organics Gluten</a></h2>
                    <div class="product-rate-cover">
                      <div class="product-rate d-inline-block">
                        <div class="product-rating" style="width: 90%"></div>
                      </div>
                      <span class="font-small ml-5 text-muted"> (4.0)</span>
                    </div>
                    <div>
                      <span class="font-small text-muted">By <a href="vendor-details-1.html">Old El Paso</a></span>
                    </div>
                    <div class="product-card-bottom">
                      <div class="product-price">
                        <span>$24.85</span>
                        <span class="old-price">$26.8</span>
                      </div>
                      <div class="add-cart">
                        <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6 d-none d-lg-block">
              <div class="product-cart-wrap style-2">
                <div class="product-img-action-wrap">
                  <div class="product-img">
                    <a href="shop-product-right.html">
                      <img src="nest-frontend/assets/imgs/banner/banner-7.png" alt="" />
                    </a>
                  </div>
                </div>
                <div class="product-content-wrap">
                  <div class="deals-countdown-wrap">
                    <div class="deals-countdown" data-countdown="2027/03/25 00:00:00"></div>
                  </div>
                  <div class="deals-content">
                    <h2><a href="shop-product-right.html">Signature Wood-Fired Mushroom</a></h2>
                    <div class="product-rate-cover">
                      <div class="product-rate d-inline-block">
                        <div class="product-rating" style="width: 80%"></div>
                      </div>
                      <span class="font-small ml-5 text-muted"> (3.0)</span>
                    </div>
                    <div>
                      <span class="font-small text-muted">By <a href="vendor-details-1.html">Progresso</a></span>
                    </div>
                    <div class="product-card-bottom">
                      <div class="product-price">
                        <span>$12.85</span>
                        <span class="old-price">$13.8</span>
                      </div>
                      <div class="add-cart">
                        <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6 d-none d-xl-block">
              <div class="product-cart-wrap style-2">
                <div class="product-img-action-wrap">
                  <div class="product-img">
                    <a href="shop-product-right.html">
                      <img src="nest-frontend/assets/imgs/banner/banner-8.png" alt="" />
                    </a>
                  </div>
                </div>
                <div class="product-content-wrap">
                  <div class="deals-countdown-wrap">
                    <div class="deals-countdown" data-countdown="2025/02/25 00:00:00"></div>
                  </div>
                  <div class="deals-content">
                    <h2><a href="shop-product-right.html">Simply Lemonade with Raspberry Juice</a></h2>
                    <div class="product-rate-cover">
                      <div class="product-rate d-inline-block">
                        <div class="product-rating" style="width: 80%"></div>
                      </div>
                      <span class="font-small ml-5 text-muted"> (3.0)</span>
                    </div>
                    <div>
                      <span class="font-small text-muted">By <a href="vendor-details-1.html">Yoplait</a></span>
                    </div>
                    <div class="product-card-bottom">
                      <div class="product-price">
                        <span>$15.85</span>
                        <span class="old-price">$16.8</span>
                      </div>
                      <div class="add-cart">
                        <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!--End Deals-->
        <section class="banners">
          <div class="row">
            <div class="col-lg-4 col-md-6">
              <div class="banner-img">
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
              <div class="banner-img">
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
              <div class="banner-img mb-sm-0">
                <img src="nest-frontend/assets/imgs/banner/banner-3.png" alt="" />
                <div class="banner-text">
                  <h4>The best Organic <br />Products Online</h4>
                  <a href="shop-grid-right.html" class="btn btn-xs">Shop Now <i class="fi-rs-arrow-small-right"></i></a>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!--End banners-->
      </div>
      <div class="col-lg-1-5 primary-sidebar sticky-sidebar pt-30">
        <div class="sidebar-widget widget-category-2 mb-30">
          <h5 class="section-title style-1 mb-30">Category</h5>
          <ul>
            <li>
              <a href="shop-grid-right.html"> <img src="nest-frontend/assets/imgs/theme/icons/category-1.svg" alt="" />Milks & Dairies</a><span class="count">30</span>
            </li>
            <li>
              <a href="shop-grid-right.html"> <img src="nest-frontend/assets/imgs/theme/icons/category-2.svg" alt="" />Clothing</a><span class="count">35</span>
            </li>
            <li>
              <a href="shop-grid-right.html"> <img src="nest-frontend/assets/imgs/theme/icons/category-3.svg" alt="" />Pet Foods </a><span class="count">42</span>
            </li>
            <li>
              <a href="shop-grid-right.html"> <img src="nest-frontend/assets/imgs/theme/icons/category-4.svg" alt="" />Baking material</a><span class="count">68</span>
            </li>
            <li>
              <a href="shop-grid-right.html"> <img src="nest-frontend/assets/imgs/theme/icons/category-5.svg" alt="" />Fresh Fruit</a><span class="count">87</span>
            </li>
          </ul>
        </div>
        <!-- Fillter By Price -->
        <div class="sidebar-widget price_range range mb-30">
          <h5 class="section-title style-1 mb-30">Fill by price</h5>
          <div class="price-filter">
            <div class="price-filter-inner">
              <div id="slider-range" class="mb-20"></div>
              <div class="d-flex justify-content-between">
                <div class="caption">From: <strong id="slider-range-value1" class="text-brand"></strong></div>
                <div class="caption">To: <strong id="slider-range-value2" class="text-brand"></strong></div>
              </div>
            </div>
          </div>
          <div class="list-group">
            <div class="list-group-item mb-10 mt-10">
              <label class="fw-900">Color</label>
              <div class="custome-checkbox">
                <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox1" value="" />
                <label class="form-check-label" for="exampleCheckbox1"><span>Red (56)</span></label>
                <br />
                <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox2" value="" />
                <label class="form-check-label" for="exampleCheckbox2"><span>Green (78)</span></label>
                <br />
                <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox3" value="" />
                <label class="form-check-label" for="exampleCheckbox3"><span>Blue (54)</span></label>
              </div>
              <label class="fw-900 mt-15">Item Condition</label>
              <div class="custome-checkbox">
                <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox11" value="" />
                <label class="form-check-label" for="exampleCheckbox11"><span>New (1506)</span></label>
                <br />
                <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox21" value="" />
                <label class="form-check-label" for="exampleCheckbox21"><span>Refurbished (27)</span></label>
                <br />
                <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox31" value="" />
                <label class="form-check-label" for="exampleCheckbox31"><span>Used (45)</span></label>
              </div>
            </div>
          </div>
          <a href="shop-grid-right.html" class="btn btn-sm btn-default"><i class="fi-rs-filter mr-5"></i> Fillter</a>
        </div>
        <!-- Product sidebar Widget -->
        <div class="sidebar-widget product-sidebar mb-30 p-30 bg-grey border-radius-10">
          <h5 class="section-title style-1 mb-30">New products</h5>
          <div class="single-post clearfix">
            <div class="image">
              <img src="nest-frontend/assets/imgs/shop/thumbnail-3.jpg" alt="#" />
            </div>
            <div class="content pt-10">
              <h5><a href="shop-product-detail.html">Chen Cardigan</a></h5>
              <p class="price mb-0 mt-5">$99.50</p>
              <div class="product-rate">
                <div class="product-rating" style="width: 90%"></div>
              </div>
            </div>
          </div>
          <div class="single-post clearfix">
            <div class="image">
              <img src="nest-frontend/assets/imgs/shop/thumbnail-4.jpg" alt="#" />
            </div>
            <div class="content pt-10">
              <h6><a href="shop-product-detail.html">Chen Sweater</a></h6>
              <p class="price mb-0 mt-5">$89.50</p>
              <div class="product-rate">
                <div class="product-rating" style="width: 80%"></div>
              </div>
            </div>
          </div>
          <div class="single-post clearfix">
            <div class="image">
              <img src="nest-frontend/assets/imgs/shop/thumbnail-5.jpg" alt="#" />
            </div>
            <div class="content pt-10">
              <h6><a href="shop-product-detail.html">Colorful Jacket</a></h6>
              <p class="price mb-0 mt-5">$25</p>
              <div class="product-rate">
                <div class="product-rating" style="width: 60%"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="banner-img wow fadeIn mb-lg-0 animated d-lg-block d-none">
          <img src="nest-frontend/assets/imgs/banner/banner-11.png" alt="" />
          <div class="banner-text">
            <span>Oganic</span>
            <h4>
              Save 17% <br />
              on <span class="text-brand">Oganic</span><br />
              Juice
            </h4>
          </div>
        </div>
      </div>
    </div>
  </div>
  <section class="popular-categories section-padding">
    <div class="container">
      <div class="section-title">
        <div class="title">
          <h3>Shop by Categories</h3>
          <a class="show-all" href="shop-grid-right.html">
            All Categories
            <i class="fi-rs-angle-right"></i>
          </a>
        </div>
        <div class="slider-arrow slider-arrow-2 flex-right carausel-8-columns-arrow" id="carausel-8-columns-arrows"></div>
      </div>
      <div class="carausel-8-columns-cover position-relative">
        <div class="carausel-8-columns" id="carausel-8-columns">
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-1.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html">Milks and <br />Dairies</a>
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-2.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html"
              >Wines & <br />
                Alcohol</a
              >
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-3.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html">Clothing & <br />Beauty</a>
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-4.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html">Pet Foods <br />& Toy</a>
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-5.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html">Packaged <br />fast food</a>
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-6.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html">Baking <br />material</a>
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-7.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html">Vegetables <br />& tubers</a>
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-8.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html">Fresh <br />Seafood</a>
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-9.svg" alt="" /></a>
            </figure>
            <h6>
              <a href="shop-grid-right.html">Noodles <br />Rice</a>
            </h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-10.svg" alt="" /></a>
            </figure>
            <h6><a href="shop-grid-right.html">Fastfood</a></h6>
          </div>
          <div class="card-1">
            <figure class="img-hover-scale overflow-hidden">
              <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/theme/icons/category-11.svg" alt="" /></a>
            </figure>
            <h6><a href="shop-grid-right.html">Ice cream</a></h6>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--End category slider-->
  <section class="section-padding mb-30">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-6 mb-sm-5 mb-md-0">
          <h4 class="section-title style-1 mb-30 animated animated">Top Selling</h4>
          <div class="product-list-small animated animated">
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-1.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Nestle Original Coffee-Mate Coffee Creamer</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-2.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Nestle Original Coffee-Mate Coffee Creamer</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-3.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Nestle Original Coffee-Mate Coffee Creamer</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
          </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-md-6 mb-md-0">
          <h4 class="section-title style-1 mb-30 animated animated">Trending Products</h4>
          <div class="product-list-small animated animated">
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-4.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Organic Cage-Free Grade A Large Brown Eggs</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-5.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Seeds of Change Organic Quinoa, Brown, & Red Rice</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-6.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Naturally Flavored Cinnamon Vanilla Light Roast Coffee</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
          </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-md-6 mb-sm-5 mb-md-0 d-none d-lg-block">
          <h4 class="section-title style-1 mb-30 animated animated">Recently added</h4>
          <div class="product-list-small animated animated">
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-7.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Pepperidge Farm Farmhouse Hearty White Bread</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-8.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Organic Frozen Triple Berry Blend</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-9.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Oroweat Country Buttermilk Bread</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
          </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-md-6 mb-sm-5 mb-md-0 d-none d-xl-block">
          <h4 class="section-title style-1 mb-30 animated animated">Top Rated</h4>
          <div class="product-list-small animated animated">
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-10.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Foster Farms Takeout Crispy Classic Buffalo Wings</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-11.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">Angie’s Boomchickapop Sweet & Salty Kettle Corn</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
            <article class="row align-items-center hover-up">
              <figure class="col-md-4 mb-0">
                <a href="shop-product-right.html"><img src="nest-frontend/assets/imgs/shop/thumbnail-12.jpg" alt="" /></a>
              </figure>
              <div class="col-md-8 mb-0">
                <h6>
                  <a href="shop-product-right.html">All Natural Italian-Style Chicken Meatballs</a>
                </h6>
                <div class="product-rate-cover">
                  <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: 90%"></div>
                  </div>
                  <span class="font-small ml-5 text-muted"> (4.0)</span>
                </div>
                <div class="product-price">
                  <span>$32.85</span>
                  <span class="old-price">$33.8</span>
                </div>
              </div>
            </article>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--End 4 columns-->
</main>
<jsp:include page="footer.jsp" />
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

