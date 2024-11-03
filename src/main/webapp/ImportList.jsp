<%@ page import="java.util.List" %>
<%@ page import="dto.ImportRespone" %>
<%@ page import="model.Warehouse" %>
<%@ page import="model.Supplier" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <script>
    function populateForm(importID, accountName, warehouseName, supplierName, importTime) {
      document.getElementById('import_id').value = importID || '';
      document.getElementById('staffID').value = accountName || '';
      document.getElementById('warehouseID').value = warehouseName || '';
      document.getElementById('supplierID').value = supplierName || '';
      document.getElementById('importTime').value = importTime || '';
    }


    function doDelete(importID) {
      if (confirm("Are you sure you want to delete import ?")) {
        window.location = "importDelete?importID=" + importID;
      }

    }

    function validateDate() {
      const dateInput = document.getElementById('time').value;
      const selectedDate = new Date(dateInput);
      const today = new Date();


      today.setHours(0, 0, 0, 0);

      if (selectedDate < today) {
        alert('The date cannot be in the past.');
        return false;
      }
      return true;
    }

  </script>
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
  <jsp:param name="page" value="discount"/>
  <jsp:param name="menu" value="product"/>
</jsp:include>
<main class="main-wrap">
  <jsp:include page="header-staff.jsp"></jsp:include>
  <section class="content-main">
    <div class="content-header">
      <div>
        <h2 class="content-title card-title">Imports</h2>
        <p>Add, edit or delete a Imports</p>
      </div>

      <div>


      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-md-3">
            <form action="Import" method="post" onsubmit="return validateDate()" >
              <div class="mb-4">
                <label for="staffID" class="form-label">Staff</label>
                <input type="number" class="form-control" id="staffID" name="staffID" value="${sessionScope.loggedInStaffID}" readonly="" />
              </div>
              <div class="mb-4">
                <label for="warehouseID" class="form-label">Warehouse</label>
                <select class="form-control" id="warehouseID" name="warehouseID" >
                  <%
                    List<Warehouse> warehouseList = (List<Warehouse>) request.getAttribute("warehouses");
                    if (warehouseList != null) {
                      for (Warehouse wh : warehouseList) {
                  %>
                  <option value="<%= wh.getWarehouseID() %>"><%= wh.getName() %></option>
                  <%
                      }
                    }
                  %>
                </select>
              </div>
              <div class="mb-4">
                <label for="supplierID" class="form-label">Supplier</label>
                <select class="form-control" id="supplierID" name="supplierID" >
                  <%
                    List<Supplier> supplierList = (List<Supplier>) request.getAttribute("suppliers");
                    if (supplierList != null) {
                      for (Supplier sp : supplierList) {
                  %>
                  <option value="<%= sp.getSupplierID() %>"><%= sp.getName() %></option>
                  <%
                      }
                    }
                  %>
                </select>
              </div>
              <div class="mb-4">
                <label for="time" class="form-label">Import Time</label>
                <input type="date" class="form-control" id="time" name="time" required />
              </div>
              <div class="d-grid">
                <button type="submit" class="btn btn-primary">Create Import</button>
              </div>
            </form>
          </div>
          <div class="col-md-9">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                <tr>

                  <th>Staff Name</th>
                  <th>Warehouse Name</th>
                  <th>Supplier Name</th>
                  <th>Import Time</th>
                  <th class="text-end">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="imp" items="${importList}">
                  <tr>

                    <td>${imp.getAccountName()}</td>
                    <td>${imp.getWarehouseName()}</td>
                    <td>${imp.getSupplierName()}</td>
                    <td>${imp.getImportTime()}</td>
                    <td class="text-end">
                      <a href="#" onclick="doDelete('${imp.importID}')" class="btn btn-light rounded btn-sm font-sm">
                        <i class="material-icons md-delete"></i> Delete
                      </a>
                      <a href="ImportProduct?id=${imp.importID}"
                         class="btn btn-light rounded btn-sm font-sm">
                        <i class="material-icons md-add_shopping_cart"></i> Import Product
                      </a>
                    </td>
                  </tr>
                </c:forEach>

                </tbody>
              </table>

              <div class="pagination-container">
                <nav aria-label="Page navigation">
                  <ul class="pagination justify-content-center">
                    <c:forEach begin="0" end="${endPage}" var="i">
                      <li class="page-item ${i == 0 ? 'active' : ''}">
                        <a class="page-link" href="Import?index=${i}">${i == 0 ? "Page" : i}</a>
                      </li>
                    </c:forEach>
                  </ul>
                </nav>
              </div>


            </div>
          </div>
          <!-- .col// -->
        </div>
        <!-- .row // -->
      </div>
      <!-- card body .// -->
    </div>
    <!-- card .// -->
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
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>