<%--
  Created by IntelliJ IDEA.
  User: anh21
  Date: 9/29/2024
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String category = request.getParameter("category"), name = request.getParameter("name"), manufacturer = request.getParameter("manufacturer");
    int star = Integer.parseInt(request.getParameter("star")), discount = Integer.parseInt(request.getParameter("discount")), price = Integer.parseInt(request.getParameter("price")), productID = Integer.parseInt(request.getParameter("productID"));
%>
<div class="col-lg-1-5 col-md-4 col-12 col-sm-6">
    <div class="product-cart-wrap mb-30 wow animate__animated animate__fadeIn" data-wow-delay=".1s">
        <div class="product-img-action-wrap">
            <div class="product-img product-img-zoom">
                <a href="shop-product-right.html">
                    <img class="default-img" src="nest-frontend/assets/imgs/shop/product-1-1.jpg" alt="" />
                    <img class="hover-img" src="nest-frontend/assets/imgs/shop/product-1-2.jpg" alt="" />
                </a>
            </div>
        </div>
        <div class="product-content-wrap">
            <div class="product-category">
                <a href="shop-grid-right.html"><%=category%></a>
            </div>
            <h2><a href="shop-product-right.html"><%=name%></a></h2>
            <div class="product-rate-cover">
                <div class="product-rate d-inline-block">
                    <div class="product-rating" style="width: <%=star*2%>0%"></div>
                </div>
                <span class="font-small ml-5 text-muted"> (<%=star%>)</span>
            </div>
            <div>
                <span class="font-small text-muted">By <a href="vendor-details-1.html"><%=manufacturer%></a></span>
            </div>
            <div class="product-card-bottom">
                <div class="product-price">
                    <%if(discount!=0){%>
                    <span><%=price-price*discount/100%> VND</span>
                    <span class="old-price"><%=price%> VND</span>
                    <%}
                    else{
                    %>
                    <span><%=price%> VND</span>
                    <%}%>
                </div>
                <div class="add-cart">
                    <form action="test" method="post">
                        <input type="text" hidden name="productID" value="<%=productID%>">
                        <input type="submit" class="add mr-5" value="Add to cart" style="color: #3BB77E">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>