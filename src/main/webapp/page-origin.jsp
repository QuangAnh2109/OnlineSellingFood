<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Origin" %>
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
<div class="screen-overlay"></div>
<jsp:include page="bar-staff.jsp">
  <jsp:param name="page" value="origin"/>
  <jsp:param name="menu" value="product"/>
</jsp:include>
<main class="main-wrap">
  <jsp:include page="header-staff.jsp"></jsp:include>
  <section class="content-main">
    <div class="content-header">
      <div>
        <h2 class="content-title card-title">Origins</h2>
        <p>List of product origins</p>
      </div>
      <div>
        <form action="originSearch" method="post">
          <input type="text" name="searchKeyword" placeholder="Search Origins" class="form-control bg-white" />
          <button type="submit" class="btn btn-primary">Search</button>
        </form>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-hover">
            <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
            </tr>
            </thead>
            <tbody>
            <%
              List<Origin> originList = (List<Origin>) request.getAttribute("originList");
              if (originList != null && !originList.isEmpty()) {
                for (Origin origin : originList) {
            %>
            <tr>
              <td><%= origin.getOriginID() %></td>
              <td><b><%= origin.getName() %></b></td>
            </tr>
            <%
              }
            } else {
            %>
            <tr>
              <td colspan="2" class="text-center">No origins found.</td>
            </tr>
            <%
              }
            %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>


  <!-- content-main end// -->
  <footer class="main-footer font-xs">
    <div class="row pb-30 pt-15">
      <div class="col-sm-6">
        <script>
          document.write(new Date().getFullYear());
        </script>
        &copy; Nest - HTML Ecommerce Template .
      </div>
      <div class="col-sm-6">
        <div class="text-sm-end">All rights reserved</div>
      </div>
    </div>
  </footer>
</main>
<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/select2.min.js"></script>
<script src="nest-backend/assets/js/vendors/perfect-scrollbar.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<script src="nest-backend/assets/js/vendors/chart.js"></script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
<script src="nest-backend/assets/js/custom-chart.js" type="text/javascript"></script>
</body>
</html>
