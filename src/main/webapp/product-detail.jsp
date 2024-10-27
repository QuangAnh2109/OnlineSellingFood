<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <jsp:include page="header.jsp"></jsp:include>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8"/>
    <title>Nest - Multipurpose eCommerce HTML Template</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta property="og:title" content=""/>
    <meta property="og:type" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:image" content=""/>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="nest-frontend/assets/imgs/theme/favicon.svg"/>
    <!-- Template CSS -->
    <link rel="stylesheet" href="nest-frontend/assets/css/main.css?v=4.0"/>
</head>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        const stars = document.querySelectorAll('.stars input[type="radio"]');
        const labels = document.querySelectorAll('.stars label');
        const ratingText = document.querySelector('.rating-text');

        const ratingMessages = {
            1: "Rất không hài lòng",
            2: "Không hài lòng",
            3: "Bình thường",
            4: "Hài lòng",
            5: "Xuất sắc"
        };

        function updateStars(ratingValue) {
            // Đặt tất cả sao về màu xám
            labels.forEach(label => label.style.color = 'lightgray');

            // Đổi màu vàng cho các sao từ phải sang trái dựa trên ngôi sao được chọn
            for (let i = 0; i < ratingValue; i++) {
                labels[i].style.color = '#FFD700';
            }
            // Cập nhật văn bản hiển thị mức độ hài lòng
            ratingText.textContent = ratingMessages[ratingValue];
        }

        // Thiết lập mặc định là 1 sao (Rất không hài lòng)
        updateStars(1);

        // Lắng nghe sự kiện thay đổi khi người dùng chọn sao khác
        stars.forEach(star => {
            star.addEventListener('change', function () {
                const ratingValue = parseInt(this.value);
                updateStars(ratingValue);
            });
        });
    });
</script>
<script>
    // JavaScript kiểm tra đăng nhập và hiển thị modal
    document.addEventListener('DOMContentLoaded', function () {
        const reviewButton = document.querySelector('.button-contactForm');

        reviewButton.addEventListener('click', function (event) {
            event.preventDefault();

            const isLoggedIn = false; // Đặt thành true nếu người dùng đã đăng nhập

            if (!isLoggedIn) {
                const loginModal = new bootstrap.Modal(document.getElementById('loginModal'), {});
                loginModal.show();
            } else {
                document.getElementById('commentForm').submit();
            }
        });
    });

    function login() {
        window.location.href = "http://localhost:9998/OnlineSellingFood_war/login"; // URL trang đăng nhập
    }

    function register() {
        window.location.href = "http://localhost:9998/OnlineSellingFood_war/register"; // URL trang đăng ký
    }
</script>

<body class="single-product">
<!-- Quick view -->
<div class="modal fade custom-modal" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel"
     aria-hidden="true">
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
                                    <img src="nest-frontend/assets/imgs/shop/product-16-2.jpg" alt="product image"/>
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-1.jpg" alt="product image"/>
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-3.jpg" alt="product image"/>
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-4.jpg" alt="product image"/>
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-5.jpg" alt="product image"/>
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-6.jpg" alt="product image"/>
                                </figure>
                                <figure class="border-radius-10">
                                    <img src="nest-frontend/assets/imgs/shop/product-16-7.jpg" alt="product image"/>
                                </figure>
                            </div>
                            <!-- THUMBNAILS -->
                            <div class="slider-nav-thumbnails">
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-3.jpg" alt="product image"/>
                                </div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-4.jpg" alt="product image"/>
                                </div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-5.jpg" alt="product image"/>
                                </div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-6.jpg" alt="product image"/>
                                </div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-7.jpg" alt="product image"/>
                                </div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-8.jpg" alt="product image"/>
                                </div>
                                <div><img src="nest-frontend/assets/imgs/shop/thumbnail-9.jpg" alt="product image"/>
                                </div>
                            </div>
                        </div>
                        <!-- End Gallery -->
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="detail-info pr-30 pl-30">
                            <span class="stock-status out-stock"> Sale Off </span>
                            <h3 class="title-detail"><a href="shop-product-right.html" class="text-heading">Seeds of
                                Change Organic Quinoa, Brown</a></h3>
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
                                    <button type="submit" class="button button-add-to-cart"><i
                                            class="fi-rs-shopping-cart"></i>Add to cart
                                    </button>
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
<!--End header-->
<main class="main">
    <div class="page-header breadcrumb-wrap">
        <div class="container">
            <div class="breadcrumb">
                <a href="index.html" rel="nofollow"><i class="fi-rs-home mr-5"></i>Home</a>
                <span></span> <a href="shop-grid-right.html">Vegetables & tubers</a> <span></span> Seeds of Change
                Organic
            </div>
        </div>
    </div>
    <div class="container mb-30">
        <div class="row">
            <div class="col-xl-10 col-lg-12 m-auto">
                <div class="product-detail accordion-detail">
                    <div class="row mb-50 mt-30">
                        <div class="col-md-6 col-sm-12 col-xs-12 mb-md-0 mb-sm-5">
                            <div class="detail-gallery">
                                <span class="zoom-icon"><i class="fi-rs-search"></i></span>
                                <!-- MAIN SLIDES -->
                                <div class="product-image-slider">
                                    <figure class="border-radius-10">
                                        <img src="nest-frontend/assets/imgs/shop/product-16-2.jpg" alt="product image"/>
                                    </figure>
                                    <figure class="border-radius-10">
                                        <img src="nest-frontend/assets/imgs/shop/product-16-1.jpg" alt="product image"/>
                                    </figure>
                                    <figure class="border-radius-10">
                                        <img src="nest-frontend/assets/imgs/shop/product-16-3.jpg" alt="product image"/>
                                    </figure>
                                    <figure class="border-radius-10">
                                        <img src="nest-frontend/assets/imgs/shop/product-16-4.jpg" alt="product image"/>
                                    </figure>
                                    <figure class="border-radius-10">
                                        <img src="nest-frontend/assets/imgs/shop/product-16-5.jpg" alt="product image"/>
                                    </figure>
                                    <figure class="border-radius-10">
                                        <img src="nest-frontend/assets/imgs/shop/product-16-6.jpg" alt="product image"/>
                                    </figure>
                                    <figure class="border-radius-10">
                                        <img src="nest-frontend/assets/imgs/shop/product-16-7.jpg" alt="product image"/>
                                    </figure>
                                </div>
                                <!-- THUMBNAILS -->
                                <div class="slider-nav-thumbnails">
                                    <div><img src="nest-frontend/assets/imgs/shop/thumbnail-3.jpg" alt="product image"/>
                                    </div>
                                    <div><img src="nest-frontend/assets/imgs/shop/thumbnail-4.jpg" alt="product image"/>
                                    </div>
                                    <div><img src="nest-frontend/assets/imgs/shop/thumbnail-5.jpg" alt="product image"/>
                                    </div>
                                    <div><img src="nest-frontend/assets/imgs/shop/thumbnail-6.jpg" alt="product image"/>
                                    </div>
                                    <div><img src="nest-frontend/assets/imgs/shop/thumbnail-7.jpg" alt="product image"/>
                                    </div>
                                    <div><img src="nest-frontend/assets/imgs/shop/thumbnail-8.jpg" alt="product image"/>
                                    </div>
                                    <div><img src="nest-frontend/assets/imgs/shop/thumbnail-9.jpg" alt="product image"/>
                                    </div>
                                </div>
                            </div>
                            <!-- End Gallery -->
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="detail-info pr-30 pl-30">
                                <span class="stock-status out-stock"> Sale Off </span>
                                <h2 class="title-detail">Seeds of Change Organic Quinoa, Brown</h2>
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
                                <div class="short-desc mb-30">
                                    <p class="font-lg">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquam
                                        rem officia, corrupti reiciendis minima nisi modi, quasi, odio minus dolore
                                        impedit fuga eum eligendi.</p>
                                </div>
                                <div class="attr-detail attr-size mb-30">
                                    <strong class="mr-10">Size / Weight: </strong>
                                    <ul class="list-filter size-filter font-small">
                                        <li><a href="#">50g</a></li>
                                        <li class="active"><a href="#">60g</a></li>
                                        <li><a href="#">80g</a></li>
                                        <li><a href="#">100g</a></li>
                                        <li><a href="#">150g</a></li>
                                    </ul>
                                </div>
                                <div class="detail-extralink mb-50">
                                    <div class="detail-qty border radius">
                                        <a href="#" class="qty-down"><i class="fi-rs-angle-small-down"></i></a>
                                        <span class="qty-val">1</span>
                                        <a href="#" class="qty-up"><i class="fi-rs-angle-small-up"></i></a>
                                    </div>
                                    <div class="product-extra-link2">
                                        <button type="submit" class="button button-add-to-cart"><i
                                                class="fi-rs-shopping-cart"></i>Add to cart
                                        </button>
                                        <a aria-label="Add To Wishlist" class="action-btn hover-up"
                                           href="shop-wishlist.html"><i class="fi-rs-heart"></i></a>
                                        <a aria-label="Compare" class="action-btn hover-up" href="shop-compare.html"><i
                                                class="fi-rs-shuffle"></i></a>
                                    </div>
                                </div>
                                <div class="font-xs">
                                    <ul class="mr-50 float-start">
                                        <li class="mb-5">Type: <span class="text-brand">Organic</span></li>
                                        <li class="mb-5">MFG:<span class="text-brand"> Jun 4.2021</span></li>
                                        <li>LIFE: <span class="text-brand">70 days</span></li>
                                    </ul>
                                    <ul class="float-start">
                                        <li class="mb-5">SKU: <a href="#">FWM15VKT</a></li>
                                        <li class="mb-5">Tags: <a href="#" rel="tag">Snack</a>, <a href="#" rel="tag">Organic</a>,
                                            <a href="#" rel="tag">Brown</a></li>
                                        <li>Stock:<span class="in-stock text-brand ml-5">8 Items In Stock</span></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Detail Info -->
                        </div>
                    </div>
                    <div class="product-info">
                        <div class="tab-style3">
                            <ul class="nav nav-tabs text-uppercase">
                                <li class="nav-item">
                                    <a class="nav-link active" id="Description-tab" data-bs-toggle="tab"
                                       href="#Description">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="Additional-info-tab" data-bs-toggle="tab"
                                       href="#Additional-info">Additional info</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="Vendor-info-tab" data-bs-toggle="tab" href="#Vendor-info">Vendor</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="Reviews-tab" data-bs-toggle="tab" href="#Reviews">Reviews
                                        (3)</a>
                                </li>
                            </ul>
                            <div class="tab-content shop_info_tab entry-main-content">
                                <div class="tab-pane fade show active" id="Description">
                                    <div class="">
                                        <p>Uninhibited carnally hired played in whimpered dear gorilla koala depending
                                            and much yikes off far quetzal goodness and from for grimaced goodness
                                            unaccountably and meadowlark near unblushingly crucial scallop tightly
                                            neurotic hungrily some and dear furiously this apart.</p>
                                        <p>Spluttered narrowly yikes left moth in yikes bowed this that grizzly much
                                            hello on spoon-fed that alas rethought much decently richly and wow against
                                            the frequent fluidly at formidable acceptably flapped besides and much circa
                                            far over the bucolically hey precarious goldfinch mastodon goodness gnashed
                                            a jellyfish and one however because.</p>
                                        <ul class="product-more-infor mt-30">
                                            <li><span>Type Of Packing</span> Bottle</li>
                                            <li><span>Color</span> Green, Pink, Powder Blue, Purple</li>
                                            <li><span>Quantity Per Case</span> 100ml</li>
                                            <li><span>Ethyl Alcohol</span> 70%</li>
                                            <li><span>Piece In One</span> Carton</li>
                                        </ul>
                                        <hr class="wp-block-separator is-style-dots"/>
                                        <p>Laconic overheard dear woodchuck wow this outrageously taut beaver hey hello
                                            far meadowlark imitatively egregiously hugged that yikes minimally unanimous
                                            pouted flirtatiously as beaver beheld above forward energetic across this
                                            jeepers beneficently cockily less a the raucously that magic upheld far so
                                            the this where crud then below after jeez enchanting drunkenly more much wow
                                            callously irrespective limpet.</p>
                                        <h4 class="mt-30">Packaging & Delivery</h4>
                                        <hr class="wp-block-separator is-style-wide"/>
                                        <p>Less lion goodness that euphemistically robin expeditiously bluebird smugly
                                            scratched far while thus cackled sheepishly rigid after due one assenting
                                            regarding censorious while occasional or this more crane went more as this
                                            less much amid overhung anathematic because much held one exuberantly sheep
                                            goodness so where rat wry well concomitantly.</p>
                                        <p>Scallop or far crud plain remarkably far by thus far iguana lewd precociously
                                            and and less rattlesnake contrary caustic wow this near alas and next and
                                            pled the yikes articulate about as less cackled dalmatian in much less well
                                            jeering for the thanks blindly sentimental whimpered less across objectively
                                            fanciful grimaced wildly some wow and rose jeepers outgrew lugubrious
                                            luridly irrationally attractively dachshund.</p>
                                        <h4 class="mt-30">Suggested Use</h4>
                                        <ul class="product-more-infor mt-30">
                                            <li>Refrigeration not necessary.</li>
                                            <li>Stir before serving</li>
                                        </ul>
                                        <h4 class="mt-30">Other Ingredients</h4>
                                        <ul class="product-more-infor mt-30">
                                            <li>Organic raw pecans, organic raw cashews.</li>
                                            <li>This butter was produced using a LTG (Low Temperature Grinding)
                                                process
                                            </li>
                                            <li>Made in machinery that processes tree nuts but does not process peanuts,
                                                gluten, dairy or soy
                                            </li>
                                        </ul>
                                        <h4 class="mt-30">Warnings</h4>
                                        <ul class="product-more-infor mt-30">
                                            <li>Oil separation occurs naturally. May contain pieces of shell.</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="Additional-info">
                                    <table class="font-md">
                                        <tbody>
                                        <tr class="stand-up">
                                            <th>Stand Up</th>
                                            <td>
                                                <p>35″L x 24″W x 37-45″H(front to back wheel)</p>
                                            </td>
                                        </tr>
                                        <tr class="folded-wo-wheels">
                                            <th>Folded (w/o wheels)</th>
                                            <td>
                                                <p>32.5″L x 18.5″W x 16.5″H</p>
                                            </td>
                                        </tr>
                                        <tr class="folded-w-wheels">
                                            <th>Folded (w/ wheels)</th>
                                            <td>
                                                <p>32.5″L x 24″W x 18.5″H</p>
                                            </td>
                                        </tr>
                                        <tr class="door-pass-through">
                                            <th>Door Pass Through</th>
                                            <td>
                                                <p>24</p>
                                            </td>
                                        </tr>
                                        <tr class="frame">
                                            <th>Frame</th>
                                            <td>
                                                <p>Aluminum</p>
                                            </td>
                                        </tr>
                                        <tr class="weight-wo-wheels">
                                            <th>Weight (w/o wheels)</th>
                                            <td>
                                                <p>20 LBS</p>
                                            </td>
                                        </tr>
                                        <tr class="weight-capacity">
                                            <th>Weight Capacity</th>
                                            <td>
                                                <p>60 LBS</p>
                                            </td>
                                        </tr>
                                        <tr class="width">
                                            <th>Width</th>
                                            <td>
                                                <p>24″</p>
                                            </td>
                                        </tr>
                                        <tr class="handle-height-ground-to-handle">
                                            <th>Handle height (ground to handle)</th>
                                            <td>
                                                <p>37-45″</p>
                                            </td>
                                        </tr>
                                        <tr class="wheels">
                                            <th>Wheels</th>
                                            <td>
                                                <p>12″ air / wide track slick tread</p>
                                            </td>
                                        </tr>
                                        <tr class="seat-back-height">
                                            <th>Seat back height</th>
                                            <td>
                                                <p>21.5″</p>
                                            </td>
                                        </tr>
                                        <tr class="head-room-inside-canopy">
                                            <th>Head room (inside canopy)</th>
                                            <td>
                                                <p>25″</p>
                                            </td>
                                        </tr>
                                        <tr class="pa_color">
                                            <th>Color</th>
                                            <td>
                                                <p>Black, Blue, Red, White</p>
                                            </td>
                                        </tr>
                                        <tr class="pa_size">
                                            <th>Size</th>
                                            <td>
                                                <p>M, S</p>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="Vendor-info">
                                    <div class="vendor-logo d-flex mb-30">
                                        <img src="nest-frontend/assets/imgs/vendor/vendor-18.svg" alt=""/>
                                        <div class="vendor-name ml-15">
                                            <h6>
                                                <a href="vendor-details-2.html">Noodles Co.</a>
                                            </h6>
                                            <div class="product-rate-cover text-end">
                                                <div class="product-rate d-inline-block">
                                                    <div class="product-rating" style="width: 90%"></div>
                                                </div>
                                                <span class="font-small ml-5 text-muted"> (32 reviews)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="contact-infor mb-50">
                                        <li><img src="nest-frontend/assets/imgs/theme/icons/icon-location.svg"
                                                 alt=""/><strong>Address: </strong> <span>5171 W Campbell Ave undefined Kent, Utah 53127 United States</span>
                                        </li>
                                        <li><img src="nest-frontend/assets/imgs/theme/icons/icon-contact.svg"
                                                 alt=""/><strong>Contact
                                            Seller:</strong><span>(+91) - 540-025-553</span></li>
                                    </ul>
                                    <div class="d-flex mb-55">
                                        <div class="mr-30">
                                            <p class="text-brand font-xs">Rating</p>
                                            <h4 class="mb-0">92%</h4>
                                        </div>
                                        <div class="mr-30">
                                            <p class="text-brand font-xs">Ship on time</p>
                                            <h4 class="mb-0">100%</h4>
                                        </div>
                                        <div>
                                            <p class="text-brand font-xs">Chat response</p>
                                            <h4 class="mb-0">89%</h4>
                                        </div>
                                    </div>
                                    <p>Noodles & Company is an American fast-casual restaurant that offers international
                                        and American noodle dishes and pasta in addition to soups and salads. Noodles &
                                        Company was founded in 1995 by Aaron Kennedy and is headquartered in Broomfield,
                                        Colorado. The company went public in 2013 and recorded a $457 million revenue in
                                        2017.In late 2018, there were 460 Noodles & Company locations across 29 states
                                        and Washington, D.C.</p>
                                </div>
                                <div class="tab-pane fade" id="Reviews">
                                    <!--Comments-->
                                    <div class="comments-area">
                                        <div class="row">
                                            <div class="col-lg-8">
                                                <h4 class="mb-30">Customer questions & answers</h4>
                                                <div class="comment-list">
                                                    <div class="single-comment justify-content-between d-flex mb-30">
                                                        <div class="user justify-content-between d-flex">
                                                            <div class="thumb text-center">
                                                                <img src="nest-frontend/assets/imgs/blog/author-2.png"
                                                                     alt=""/>
                                                                <a href="#" class="font-heading text-brand">Sienna</a>
                                                            </div>
                                                            <div class="desc">
                                                                <div class="d-flex justify-content-between mb-10">
                                                                    <!--                                                                            <div class="d-flex align-items-center">-->
                                                                    <!--                                                                                <span class="font-xs text-muted">December 4, 2021 at 3:12 pm </span>-->
                                                                    <!--                                                                            </div>-->
                                                                    <div class="product-rate d-inline-block">
                                                                        <div class="product-rating"
                                                                             style="width: 100%"></div>
                                                                    </div>
                                                                </div>
                                                                <p class="mb-10">Lorem ipsum dolor sit amet, consectetur
                                                                    adipisicing elit. Delectus, suscipit exercitationem
                                                                    accusantium obcaecati quos voluptate nesciunt
                                                                    facilis itaque modi commodi dignissimos sequi
                                                                    repudiandae minus ab deleniti totam officia id
                                                                    incidunt? <a href="#" class="reply">Reply</a></p>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <h4 class="mb-30">Customer reviews</h4>
                                                <div class="d-flex mb-30">
                                                    <div class="product-rate d-inline-block mr-15">
                                                        <div class="product-rating" style="width: 90%"></div>
                                                    </div>
                                                    <h6>4.8 out of 5</h6>
                                                </div>
                                                <div class="progress">
                                                    <span>5 star</span>
                                                    <div class="progress-bar" role="progressbar" style="width: 50%"
                                                         aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%
                                                    </div>
                                                </div>
                                                <div class="progress">
                                                    <span>4 star</span>
                                                    <div class="progress-bar" role="progressbar" style="width: 25%"
                                                         aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%
                                                    </div>
                                                </div>
                                                <div class="progress">
                                                    <span>3 star</span>
                                                    <div class="progress-bar" role="progressbar" style="width: 45%"
                                                         aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">45%
                                                    </div>
                                                </div>
                                                <div class="progress">
                                                    <span>2 star</span>
                                                    <div class="progress-bar" role="progressbar" style="width: 65%"
                                                         aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">65%
                                                    </div>
                                                </div>
                                                <div class="progress mb-30">
                                                    <span>1 star</span>
                                                    <div class="progress-bar" role="progressbar" style="width: 85%"
                                                         aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">85%
                                                    </div>
                                                </div>
                                                <a href="#" class="font-xs text-muted">How are ratings calculated?</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--comment form-->
                                    <div class="comment-form">
                                        <h4 class="mb-15">Add a review</h4>
                                        <form class="form-contact comment_form" action="yourServletURL" method="POST"
                                              id="commentForm">
                                            <div class="rating-container">
                                                <div class="rating-section">
                                                    <label for="rating">Mức độ đánh giá *</label>
                                                    <div class="stars">
                                                        <input type="radio" name="rating" id="star1" value="1"
                                                               checked><label for="star1"
                                                                              title="Rất không hài lòng">&#9733;</label>
                                                        <input type="radio" name="rating" id="star2" value="2"><label
                                                            for="star2" title="Không hài lòng">&#9733;</label>
                                                        <input type="radio" name="rating" id="star3" value="3"><label
                                                            for="star3" title="Bình thường">&#9733;</label>
                                                        <input type="radio" name="rating" id="star4" value="4"><label
                                                            for="star4" title="Hài lòng">&#9733;</label>
                                                        <input type="radio" name="rating" id="star5" value="5"><label
                                                            for="star5" title="Xuất sắc">&#9733;</label>
                                                    </div>
                                                    <span class="rating-text">Rất không hài lòng</span>
                                                </div>


                                                <div class="row">
                                                    <div class="col-lg-8 col-md-12">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <textarea class="form-control w-100" name="comment"
                                                                              id="comment" cols="30" rows="9"
                                                                              placeholder="Write Comment"></textarea>
                                                                </div>
                                                            </div>
                                                            <!--                                                                <div class="col-sm-6">-->
                                                            <!--                                                                    <div class="form-group">-->
                                                            <!--                                                                        <input class="form-control" name="name" id="name" type="text" placeholder="Name" />-->
                                                            <!--                                                                    </div>-->
                                                            <!--                                                                </div>-->
                                                            <!--                                                                <div class="col-sm-6">-->
                                                            <!--                                                                    <div class="form-group">-->
                                                            <!--                                                                        <input class="form-control" name="email" id="email" type="email" placeholder="Email" />-->
                                                            <!--                                                                    </div>-->
                                                            <!--                                                                </div>-->

                                                        </div>
                                                        <div class="form-group">
                                                            <button type="submit" class="button button-contactForm">
                                                                Submit Review
                                                            </button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-60">
                            <div class="col-12">
                                <h2 class="section-title style-1 mb-30">Related products</h2>
                            </div>
                            <div class="col-12">
                                <div class="row related-products">
                                    <div class="col-lg-3 col-md-4 col-12 col-sm-6">
                                        <div class="product-cart-wrap hover-up">
                                            <div class="product-img-action-wrap">
                                                <div class="product-img product-img-zoom">
                                                    <a href="shop-product-right.html" tabindex="0">
                                                        <img class="default-img"
                                                             src="nest-frontend/assets/imgs/shop/product-2-1.jpg"
                                                             alt=""/>
                                                        <img class="hover-img"
                                                             src="nest-frontend/assets/imgs/shop/product-2-2.jpg"
                                                             alt=""/>
                                                    </a>
                                                </div>
                                                <div class="product-action-1">
                                                    <a aria-label="Quick view" class="action-btn small hover-up"
                                                       data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                            class="fi-rs-search"></i></a>
                                                    <a aria-label="Add To Wishlist" class="action-btn small hover-up"
                                                       href="shop-wishlist.html" tabindex="0"><i
                                                            class="fi-rs-heart"></i></a>
                                                    <a aria-label="Compare" class="action-btn small hover-up"
                                                       href="shop-compare.html" tabindex="0"><i
                                                            class="fi-rs-shuffle"></i></a>
                                                </div>
                                                <div class="product-badges product-badges-position product-badges-mrg">
                                                    <span class="hot">Hot</span>
                                                </div>
                                            </div>
                                            <div class="product-content-wrap">
                                                <h2><a href="shop-product-right.html" tabindex="0">Ulstra Bass
                                                    Headphone</a></h2>
                                                <div class="rating-result" title="90%">
                                                    <span> </span>
                                                </div>
                                                <div class="product-price">
                                                    <span>$238.85 </span>
                                                    <span class="old-price">$245.8</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-12 col-sm-6">
                                        <div class="product-cart-wrap hover-up">
                                            <div class="product-img-action-wrap">
                                                <div class="product-img product-img-zoom">
                                                    <a href="shop-product-right.html" tabindex="0">
                                                        <img class="default-img"
                                                             src="nest-frontend/assets/imgs/shop/product-3-1.jpg"
                                                             alt=""/>
                                                        <img class="hover-img"
                                                             src="nest-frontend/assets/imgs/shop/product-4-2.jpg"
                                                             alt=""/>
                                                    </a>
                                                </div>
                                                <div class="product-action-1">
                                                    <a aria-label="Quick view" class="action-btn small hover-up"
                                                       data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                            class="fi-rs-search"></i></a>
                                                    <a aria-label="Add To Wishlist" class="action-btn small hover-up"
                                                       href="shop-wishlist.html" tabindex="0"><i
                                                            class="fi-rs-heart"></i></a>
                                                    <a aria-label="Compare" class="action-btn small hover-up"
                                                       href="shop-compare.html" tabindex="0"><i
                                                            class="fi-rs-shuffle"></i></a>
                                                </div>
                                                <div class="product-badges product-badges-position product-badges-mrg">
                                                    <span class="sale">-12%</span>
                                                </div>
                                            </div>
                                            <div class="product-content-wrap">
                                                <h2><a href="shop-product-right.html" tabindex="0">Smart Bluetooth
                                                    Speaker</a></h2>
                                                <div class="rating-result" title="90%">
                                                    <span> </span>
                                                </div>
                                                <div class="product-price">
                                                    <span>$138.85 </span>
                                                    <span class="old-price">$145.8</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-12 col-sm-6">
                                        <div class="product-cart-wrap hover-up">
                                            <div class="product-img-action-wrap">
                                                <div class="product-img product-img-zoom">
                                                    <a href="shop-product-right.html" tabindex="0">
                                                        <img class="default-img"
                                                             src="nest-frontend/assets/imgs/shop/product-4-1.jpg"
                                                             alt=""/>
                                                        <img class="hover-img"
                                                             src="nest-frontend/assets/imgs/shop/product-4-2.jpg"
                                                             alt=""/>
                                                    </a>
                                                </div>
                                                <div class="product-action-1">
                                                    <a aria-label="Quick view" class="action-btn small hover-up"
                                                       data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                            class="fi-rs-search"></i></a>
                                                    <a aria-label="Add To Wishlist" class="action-btn small hover-up"
                                                       href="shop-wishlist.html" tabindex="0"><i
                                                            class="fi-rs-heart"></i></a>
                                                    <a aria-label="Compare" class="action-btn small hover-up"
                                                       href="shop-compare.html" tabindex="0"><i
                                                            class="fi-rs-shuffle"></i></a>
                                                </div>
                                                <div class="product-badges product-badges-position product-badges-mrg">
                                                    <span class="new">New</span>
                                                </div>
                                            </div>
                                            <div class="product-content-wrap">
                                                <h2><a href="shop-product-right.html" tabindex="0">HomeSpeak 12UEA
                                                    Goole</a></h2>
                                                <div class="rating-result" title="90%">
                                                    <span> </span>
                                                </div>
                                                <div class="product-price">
                                                    <span>$738.85 </span>
                                                    <span class="old-price">$1245.8</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-12 col-sm-6 d-lg-block d-none">
                                        <div class="product-cart-wrap hover-up mb-0">
                                            <div class="product-img-action-wrap">
                                                <div class="product-img product-img-zoom">
                                                    <a href="shop-product-right.html" tabindex="0">
                                                        <img class="default-img"
                                                             src="nest-frontend/assets/imgs/shop/product-5-1.jpg"
                                                             alt=""/>
                                                        <img class="hover-img"
                                                             src="nest-frontend/assets/imgs/shop/product-3-2.jpg"
                                                             alt=""/>
                                                    </a>
                                                </div>
                                                <div class="product-action-1">
                                                    <a aria-label="Quick view" class="action-btn small hover-up"
                                                       data-bs-toggle="modal" data-bs-target="#quickViewModal"><i
                                                            class="fi-rs-search"></i></a>
                                                    <a aria-label="Add To Wishlist" class="action-btn small hover-up"
                                                       href="shop-wishlist.html" tabindex="0"><i
                                                            class="fi-rs-heart"></i></a>
                                                    <a aria-label="Compare" class="action-btn small hover-up"
                                                       href="shop-compare.html" tabindex="0"><i
                                                            class="fi-rs-shuffle"></i></a>
                                                </div>
                                                <div class="product-badges product-badges-position product-badges-mrg">
                                                    <span class="hot">Hot</span>
                                                </div>
                                            </div>
                                            <div class="product-content-wrap">
                                                <h2><a href="shop-product-right.html" tabindex="0">Dadua Camera 4K
                                                    2021EF</a></h2>
                                                <div class="rating-result" title="90%">
                                                    <span> </span>
                                                </div>
                                                <div class="product-price">
                                                    <span>$89.8 </span>
                                                    <span class="old-price">$98.8</span>
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
        </div>
</main>
<!-- Modal đăng nhập -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Notification</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">

                <p>Vui lòng đăng nhập tài khoản để đánh giá.</p>
                <div class="d-flex justify-content-center gap-3 mt-3">
                    <button class="btn btn-outline-primary" onclick="register()">Đăng ký</button>
                    <button class="btn btn-primary" onclick="login()">Đăng nhập</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Kết thúc Modal đăng nhập -->
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
<script src="./nest-frontend/assets/js/main.js?v=4.0"></script>
<script src="./nest-frontend/assets/js/shop.js?v=4.0"></script>
</body>
</html>
