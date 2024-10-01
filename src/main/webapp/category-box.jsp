<%--
  Created by IntelliJ IDEA.
  User: anh21
  Date: 9/29/2024
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    String name = request.getParameter("name");
    int quantity = Integer.parseInt(request.getParameter("quantity")), color = Integer.parseInt(request.getParameter("color"));
%>
<div class="card-2 bg-<%=color%> wow animate__animated animate__fadeInUp" data-wow-delay="0s">
    <figure class="img-hover-scale overflow-hidden">
        <a href="shop-grid-right.html"><img src="nest-frontend/assets/imgs/shop/cat-15.png" alt="" /></a>
    </figure>
    <h6><a href="shop-grid-right.html"><%=name%></a></h6>
    <span><%=quantity%> items</span>
</div>