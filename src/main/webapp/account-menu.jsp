<%
  String pageActive = request.getParameter("page");
%>
<div class="dashboard-menu">
  <ul class="nav flex-column" role="tablist">
    <li class="nav-item">
      <a class="nav-link" id="account-detail-tab" href="page-account-information.jsp"><i class="fi-rs-user mr-10"></i>Account details</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="orders-tab" data-bs-toggle="tab" href="#orders" role="tab" aria-controls="orders" aria-selected="false"><i class="fi-rs-shopping-bag mr-10"></i>Orders</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="track-orders-tab" data-bs-toggle="tab" href="#track-orders" role="tab" aria-controls="track-orders" aria-selected="false"><i class="fi-rs-shopping-cart-check mr-10"></i>Track Your Order</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="contact-tab" href="AccountContact"><i class="fi-rs-user mr-10"></i>My Contact</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="change-password-tab" href="page-account-changepass.jsp"><i class="fi-rs-user mr-10"></i>Change password</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="logout"><i class="fi-rs-sign-out mr-10"></i>Logout</a>
    </li>
  </ul>
</div>
<script>
  document.getElementById("<%=pageActive%>").classList.add("active");
</script>