<%@ page import="common.Host" %>
<%@ page import="dal.FeedbackProductDAO" %>
<%@ page import="dal.DiscountDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String category = request.getParameter("category");
    String name = request.getParameter("name");
    String manufacturer = request.getParameter("manufacturer");
    int discount = Integer.parseInt(request.getParameter("discount"));
    int discountPercent = new DiscountDAO().getDiscountById(discount).getDiscountPercent();
    int price = Integer.parseInt(request.getParameter("price"));
    int productID = Integer.parseInt(request.getParameter("productID"));
    String imageUrl = request.getParameter("imageUrl");

    // Tạo đối tượng DAO để lấy số sao trung bình
    FeedbackProductDAO feedbackDAO = new FeedbackProductDAO();
    int averageStar = feedbackDAO.averageStarInProduct(productID);
%>

<div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
    <div class="product-cart-wrap mb-30 wow animate__animated animate__fadeIn" data-wow-delay=".1s">
        <div class="product-img-action-wrap">
            <div class="product-img product-img-zoom">
                <a href="ProductDetail?productID=<%=productID%>">
                    <img class="default-img" src="<%=Host.IMG_LINK+imageUrl+"?raw=true"%>" alt="<%=name%>" />
                </a>
            </div>
        </div>
        <div class="product-content-wrap">
            <div class="product-category">
                <a href="shop-grid-left.jsp?category=<%=category%>"><%=category%></a>
            </div>
            <h2><a href="ProductDetail?productID=<%=productID%>"><%=name%></a></h2>

            <!-- Phần hiển thị số sao trung bình -->
            <div class="product-rate-cover">
                <div class="rate" style="width: <%= averageStar * 20 %>%">
                    <%
                        // Nếu averageStar == 0, hiển thị tất cả các sao rỗng
                        if (averageStar == 0) {
                            for (int i = 1; i <= 5; i++) {
                    %>
                    <span class="star">&#9734;</span> <!-- Ngôi sao rỗng -->
                    <%
                        }
                    } else {
                        // Nếu có review, hiển thị sao đầy và sao rỗng tương ứng
                        for (int i = 1; i <= 5; i++) {
                            if (i <= averageStar) {
                    %>
                    <span class="star">&#9733;</span> <!-- Ngôi sao đầy -->
                    <%
                    } else {
                    %>
                    <span class="star">&#9734;</span> <!-- Ngôi sao rỗng -->
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </div>
            <div>
                <span class="font-small text-muted">By <a href="vendor-details-1.html?manufacturer=<%=manufacturer%>"><%=manufacturer%></a></span>
            </div>
            <div class="product-card-bottom">
                <div class="product-price">
                    <% if (discount != 0) { %>
                    <span><%=price - price * 10 / 100%> VND</span>
                    <span class="old-price"><%=price%> VND</span>
                    <% } else { %>
                    <span><%=price%> VND</span>
                    <% } %>
                </div>
            </div>
            <div class="product-card-bottom">
                <div class="add-cart">
                    <form action="addtocart" method="post">
                        <input type="hidden" name="productID" value="<%=productID%>">
                        <input type="submit" class="add mr-5" value="Thêm vào giỏ hàng" style="color: #3BB77E">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>