<%@ page import="model.Account" %>
<%@ page import="model.Warehouse" %>
<%@ page import="java.util.List" %>
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
<%
  String msg = (String)session.getAttribute("msg");
  if(msg==null) msg="";
  session.removeAttribute("msg");
%>
<div class="screen-overlay"></div>
<jsp:include page="bar-staff.jsp">
  <jsp:param name="page" value="registerstaff"/>
  <jsp:param name="menu" value="account"/>
</jsp:include>
<main class="main-wrap">
  <jsp:include page="header-staff.jsp"></jsp:include>
  <section class="content-main mt-80 mb-80">
    <div class="card mx-auto card-login">
      <div class="card-body">
        <h4 class="card-title mb-4">Create an Account</h4>
        <h5 style="color: red"><%=msg%></h5>
        <form action="registerstaff" method="post">
          <div class="mb-3">
            <label class="form-label">Role ID</label>
            <select class="form-control" name="roleID" required>
              <option value="2" selected>Delivery Staff</option>
              <option value="3">Import Staff</option>
              <option value="4">Warehouse Management</option>
              <option value="5">Sales Management</option>
            </select>
          </div><!-- form-group// -->

          <div class="mb-3">
            <label class="form-label">Warehouse</label>
            <select class="form-control" name="WarehouseID" required>
              <%
                for(Warehouse wh:(List<Warehouse>)request.getAttribute("warehouses")){
              %>
              <option value="<%=wh.getWarehouseID()%>"><%=wh.getName()%></option>
              <%
                }
              %>
            </select>
          </div>
          <!-- form-group// -->
          <div class="mb-3">
            <label class="form-label">Name</label>
            <input class="form-control" name="name" placeholder="Your name" type="text" required />
          </div>
          <!-- form-group// -->
          <div class="mb-3">
            <label class="form-label">Gender</label>
            <select class="form-control" name="gender" required>
              <option value="1">Male</option>
              <option value="2">Female</option>
            </select>
          </div>
          <!-- form-group// -->
          <div class="mb-3">
            <label class="form-label">Email</label>
            <input class="form-control" name="email" placeholder="Your email" type="email" required />
          </div>
          <!-- form-group// -->
          <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input class="form-control" name="phone" placeholder="Phone Number" type="text" required />
          </div>
          <div class="mb-3">
            <label class="form-label">Address</label>
            <input class="form-control" name="address" placeholder="Adress" type="text" required />
          </div>
          <!-- form-group// -->
          <div class="mb-3">
            <label class="form-label">Birth</label>
            <input class="form-control" name="birth" type="date" required id="datePicker"/>
          </div>
          <!-- form-group  .// -->
          <div class="mb-4">
            <button type="submit" class="btn btn-primary w-100">Submit</button>
          </div>
          <!-- form-group// -->
        </form>
      </div>
    </div>
  </section>
</main>
<script>
  datePicker.max = new Date().toISOString().split("T")[0];
</script>
<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>

