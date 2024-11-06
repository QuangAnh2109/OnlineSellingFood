<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Account" %>
<%@ page import="model.Product" %>
<%@ page import="dal.ManufacterDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.ProductDAO" %>
<%@ page import="dal.CategoryDAO" %>
<%@ page import="dal.UnitDAO" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="utf-8"/>
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
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        const errorMessage = "<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage").toString() : "" %>";
        if (errorMessage) {
            const loginModal = new bootstrap.Modal(document.getElementById('loginModal'), {});
            loginModal.show();
        }
    });

    function login() {
        window.location.href = "http://localhost:9998/OnlineSellingFood_war/login"; // URL trang đăng nhập
    }

    function register() {
        window.location.href = "http://localhost:9998/OnlineSellingFood_war/register"; // URL trang đăng ký
    }
</script>

<style>
    /* Đặt form trả lời ban đầu ẩn đi */
    .reply-form {
        display: none;
    }

    /* Hiển thị form trả lời khi người dùng di chuột qua khu vực bình luận */
    .comment-list:hover .reply-form {
        display: block;
    }
</style>

<body class="single-product">
<%
    UnitDAO unitDAO = new UnitDAO();
    ManufacterDAO manufacterDAO = new ManufacterDAO();
    String accountName = "";
    try {
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            accountName = account.getName();
        }
    } catch (Exception e) {
        accountName = "";
    }

    Product product = (Product) request.getAttribute("product");
    String productImageUrl = "C:\\Users\\admin\\OneDrive\\Documents\\GitHub\\OnlineSellingFood\\src\\main\\webapp\\Img\\dep1.png"; // Default image
%>
<jsp:include page="header.jsp">
    <jsp:param name="accountName" value="<%= accountName %>"/>
</jsp:include>
<main class="main">
    <div class="container mb-30">
        <div class="row">
            <div class="col-xl-10 col-lg-12 m-auto">
                <div class="product-detail accordion-detail">
                    <div class="row mb-50 mt-30">
                        <div class="col-md-6 col-sm-12 mb-md-0 mb-sm-5">
                            <div class="detail-gallery">
                                <span class="zoom-icon"><i class="fi-rs-search"></i></span>
                                <div class="product-image-slider">
                                    <figure class="border-radius-10">
                                        <img src="<%= productImageUrl %>"
                                             alt="<%= (product != null) ? product.getName() : "Product" %>"/>
                                    </figure>
                                </div>
                                <div class="slider-nav-thumbnails">
                                    <div><img src="<%= productImageUrl %>"
                                              alt="<%= (product != null) ? product.getName() : "Product" %> (Hover)"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="detail-info pr-30 pl-30">
                                <!-- Stock Status and Product Name -->
                                <span class="stock-status out-stock">Sale Off</span>
                                <h2 class="title-detail"><%= (product != null) ? product.getName() : "Product name not available." %>
                                </h2>

                                <!-- Static 4-Star Rating and Placeholder for Reviews -->
                                <div class="product-detail-rating">
                                    <div class="product-rate-cover text-end">
                                        <div class="product-rate d-inline-block">
                                            <!-- Set to 80% width to represent a 4-star rating -->
                                            <div class="product-rating" style="width: 80%;"></div>
                                        </div>
                                        <span class="font-small ml-5 text-muted">(${count} Đánh giá)</span>
                                    </div>
                                </div>

                                <!-- Product Price (Without Discount) -->
                                <div class="clearfix product-price-cover">
                                    <div class="product-price primary-color float-left">
                                        <!-- Display current price only -->
                                        <span class="current-price text-brand"><%= (product != null) ? product.getPrice() : "Price not available." %> VND</span>
                                    </div>
                                </div>

                                <!-- Product Description -->
                                <div class="short-desc mb-30">
                                    <p class="font-lg"><%= (product != null) ? product.getDetail() : "Product details not available." %>
                                    </p>
                                </div>

                                <!-- Static Unit Display -->
                                <div class="attr-detail attr-size mb-30">
                                    <strong class="mr-10">Unit: </strong>
                                    <ul class="list-filter size-filter font-small">
                                        <p class="font-lg"><%= (product != null) ? unitDAO.getUnitNameByID(product.getUnitID()): "Product units not available." %></p>
                                    </ul>
                                </div>
                                <div class="product-extra-link2">
                                    <button type="submit" class="button button-add-to-cart"><i class="fi-rs-shopping-cart"></i>Add to cart</button>
                                </div>

                            </div>
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
                                    <a class="nav-link" id="Vendor-info-tab" data-bs-toggle="tab" href="#Vendor-info">Manufactor</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="Reviews-tab" data-bs-toggle="tab" href="#Reviews">Đánh giá
                                        (${count})</a>
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
                                                <h4 class="mb-30">Câu hỏi của khách hàng và trả lời</h4>
                                                <!-- Loop through main comments -->
                                                <!-- Loop through main comments -->
                                                <c:forEach var="l" items="${list}">
                                                    <div class="comment-list">
                                                        <div class="single-comment justify-content-between d-flex mb-30">
                                                            <div class="user justify-content-between d-flex">
                                                                <div class="thumb text-center">
                                                                    <img src="nest-frontend/assets/imgs/blog/author-2.png" alt=""/>
                                                                    <div class="user-name">
                                                                        <a href="#" class="font-heading text-brand">${l.customerName}</a>
                                                                    </div>
                                                                </div>
                                                                <div class="desc">
                                                                    <div class="d-flex justify-content-between mb-10 align-items-center">
                                                                        <div class="product-rate-custom">
                                                                            <div class="rate" style="width: ${l.star * 20}%">
                                                                                <c:forEach var="i" begin="1" end="5">
                                                                                    <span class="star">
                                                                                        <c:choose>
                                                                                            <c:when test="${i <= l.star}">
                                                                                                &#9733; <!-- Ngôi sao đầy -->
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                &#9734; <!-- Ngôi sao rỗng -->
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </span>
                                                                                </c:forEach>
                                                                            </div>
                                                                        </div>
                                                                        <span class="comment-time">${l.time}</span>
                                                                    </div>
                                                                    <p class="mb-10">${l.feedback}</p>

                                                                    <!-- Hiển thị nút "Reply" nếu comment không phải của tài khoản hiện tại -->

                                                                    <c:if test="${l.customerID != currentID}">
                                                                        <div class="reply-form">
                                                                            <form action="replyComment" method="post" class="mt-2">
                                                                                <input type="hidden" name="productID" value="${productID}" />
                                                                                <input type="hidden" name="replyID" value="${l.feedbackID}" />

                                                                                <textarea name="replyContent" class="form-control" rows="1" placeholder="Vết phản hồi..."></textarea>
                                                                                <button type="submit" class="btn btn-sm btn-primary mt-2 reply-button">Gửi phản hồi</button>


                                                                                <div class="comment-replies">
                                                                                    <c:forEach var="reply" items="${l.replies}">
                                                                                        <div class="single-reply d-flex mb-10" style="margin-left: 40px;">
                                                                                            <div class="thumb text-center">
                                                                                                <img src="nest-frontend/assets/imgs/blog/author-2.png" alt=""/>
                                                                                            </div>
                                                                                            <div class="reply-desc">
                                                                                                <div class="user-name">
                                                                                                    <a href="#" class="font-heading text-brand">${reply.customerName}</a>
                                                                                                </div>
                                                                                                <span class="comment-time">${reply.time}</span>
                                                                                                <p>${reply.feedback}</p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </c:if>


                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div   >
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>

                                    <!--comment form-->
                                    <div class="comment-form">
                                        <h4 class="mb-15">Thêm đánh giá</h4>
                                        <form class="form-contact comment_form" action="ProductDetail" method="post"
                                              id="commentForm">
                                            <input type="hidden" name="productID"
                                                   value="<%= (product != null) ? product.getProductID() : "" %>">
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
                                                                              placeholder="Viết đánh giá"></textarea>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="form-group">
                                                            <button type="submit" class="button button-contactForm">
                                                                Gửi đánh giá
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
                        <div class="tab-content shop_info_tab entry-main-content">
                            <div class="tab-pane fade show active" id="Description">
                                <div class="">
                                    <p class="font-lg"><%= (product != null) ? product.getDetail() : "Product details not available." %></p>
                                </div>
                            </div>
                            <div class="tab-pane fade show active" id="Vendor-info">
                                <div class="">
                                    <p class="font-lg"><%= (product != null) ? manufacterDAO.getManufacturerName(product.getManufacturerID()) : "Product Manufactor not available." %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-60">
                        <div class="col-12">
                            <h2 class="section-title style-1 mb-30">Related products</h2>
                        </div>
                        <div class="row product-grid-4">
                            <%
                                ProductDAO productDAO = new ProductDAO();
                                List<Product> products = productDAO.get5RelatedProductsByManufacturer(product.getManufacturerID());
                                CategoryDAO categoryDAO = new CategoryDAO();
                            %>
                            <% for (Product product1 : products) {
                                List<String> images = productDAO.getProductImages(product1.getProductID());
                                String defaultImageUrl = images.size() > 0 ? images.get(0) : "default-image.jpg";
                                String hoverImageUrl = images.size() > 1 ? images.get(1) : defaultImageUrl;
                            %>
                            <jsp:include page="product-box.jsp">
                                <jsp:param name="category" value="<%= categoryDAO.getCategoryName(product1.getCategoryID())%>" />
                                <jsp:param name="name" value="<%= product1.getName() %>" />
                                <jsp:param name="manufacturer" value="<%= manufacterDAO.getManufacturerName(product1.getManufacturerID()) %>" />
                                <jsp:param name="star" value="4" />
                                <jsp:param name="discount" value="<%= product1.getDiscountID() != null ? product1.getDiscountID().toString() : '0' %>" />
                                <jsp:param name="price" value="<%= product1.getPrice().toString() %>" />
                                <jsp:param name="productID" value="<%= product1.getProductID().toString() %>" />
                                <jsp:param name="imageUrl" value="<%= defaultImageUrl %>" />
                                <jsp:param name="hoverImageUrl" value="<%= hoverImageUrl %>" />
                            </jsp:include>
                            <% } %>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Notification</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <p style="color:red;">${errorMessage}</p>
                </div>
                <%
                    Account account = (Account) session.getAttribute("account");
                %>
                <c:if test="${account==null}">
                    <div class="d-flex justify-content-center gap-3 mt-3">
                        <button class="btn btn-outline-primary" onclick="register()">Register</button>
                        <button class="btn btn-primary" onclick="login()">Login</button>
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</main>

<jsp:include page="footer.jsp"/>
<script src="nest-frontend/assets/js/vendor/jquery-3.6.0.min.js"></script>
<script src="nest-frontend/assets/js/vendor/bootstrap.bundle.min.js"></script>
<script src="nest-frontend/assets/js/plugins.js"></script>
<script src="nest-frontend/assets/js/main.js?v=4.0"></script>
</body>
</html>
