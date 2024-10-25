<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Nest Dashboard</title>
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="shortcut icon" type="image/x-icon" href="nest-backend/assets/imgs/theme/favicon.svg" />
  <link href="nest-backend/assets/css/main.css?v=1.1" rel="stylesheet" type="text/css" />

  <script>
    function populateForm(importID, staffName, warehouseName, supplierName, importTime) {
      document.getElementById('import_id').value = importID;
      document.getElementById('staffID').value = staffName; // Adjust according to the actual ID of the staff
      document.getElementById('warehouseID').value = warehouseName; // Adjust according to the actual ID
      document.getElementById('supplierID').value = supplierName; // Adjust according to the actual ID
      document.getElementById('importTime').value = importTime; // Fill in the import time
      document.getElementById('submit_button').innerText = "Update Import"; // Change button text
      document.getElementById('cancel_button').style.display = 'block'; // Show cancel button
    }

    function resetForm() {
      document.getElementById('import_id').value = '';
      document.getElementById('staffID').value = '';
      document.getElementById('warehouseID').value = '';
      document.getElementById('supplierID').value = '';
      document.getElementById('importTime').value = '';
      document.getElementById('submit_button').innerText = "Create Import"; // Reset button text
      document.getElementById('cancel_button').style.display = 'none'; // Hide cancel button
    }

    function validateForm() {
      const staffField = document.getElementById("staffID");
      const warehouseField = document.getElementById("warehouseID");
      const supplierField = document.getElementById("supplierID");

      if (staffField.value === "" || warehouseField.value === "" || supplierField.value === "") {
        alert("Please fill in all required fields.");
        return false;
      }
      return true;
    }
  </script>
</head>

<body>

<div class="screen-overlay"></div>
<jsp:include page="bar-staff.jsp">
  <jsp:param name="page" value="import" />
</jsp:include>

<main class="main-wrap">
  <jsp:include page="header-staff.jsp"></jsp:include>

  <section class="content-main">
    <div class="content-header">
      <div>
        <h2 class="content-title card-title">Imports</h2>
        <p>Add, edit, or delete imports</p>
      </div>
      <div>
        <form action="Import" method="post">
          <input type="text" name="searchKeyword" placeholder="Search Imports" class="form-control bg-white" />
          <button type="submit" class="btn btn-primary">Search</button>
        </form>
      </div>
    </div>

    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-md-3">
            <form action="importCU" method="post" onsubmit="return validateForm()">
              <div class="mb-4">
                <label for="staffID" class="form-label">Staff</label>
                <input type="number" class="form-control" id="staffID" name="staffID" required />
              </div>
              <div class="mb-4">
                <label for="warehouseID" class="form-label">Warehouse</label>
                <select class="form-control" id="warehouseID" name="warehouseID" required>
                  <c:forEach var="warehouse" items="${warehouseList}">
                    <option value="${warehouse.warehouseID}">${warehouse.name}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="mb-4">
                <label for="supplierID" class="form-label">Supplier</label>
                <select class="form-control" id="supplierID" name="supplierID" required>
                  <c:forEach var="supplier" items="${supplierList}">
                    <option value="${supplier.supplierID}">${supplier.name}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="mb-4">
                <label for="importTime" class="form-label">Import Time</label>
                <input type="datetime-local" class="form-control" id="importTime" name="time" required />
              </div>
              <div class="d-grid">
                <button type="submit" class="btn btn-primary" id="submit_button">Create Import</button>
                <button type="button" class="btn btn-secondary mt-2" id="cancel_button" onclick="resetForm()" style="display: none;">Cancel</button>
              </div>
              <input type="hidden" id="import_id" name="importID" />
            </form>
          </div>

          <div class="col-md-9">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>Staff Name</th>
                  <th>Warehouse Name</th>
                  <th>Supplier Name</th>
                  <th>Import Time</th>
                  <th class="text-end">Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<Import> importList = (List<Import>) request.getAttribute("imports");
                  if (importList != null && !importList.isEmpty()) {
                    for (Import imp : importList) {
                %>
                <tr>
                  <td onclick="populateForm('<%= imp.getImportID() %>', '<%= imp.getAccountName() %>', '<%= imp.getWarehouseName() %>', '<%= imp.getSupplierName() %>', '<%= imp.getTime() %>')">
                    <%= imp.getImportID() %>
                  </td>
                  <td><%= imp.getAccountName() %></td>
                  <td><%= imp.getWarehouseName() %></td>
                  <td><%= imp.getSupplierName() %></td>
                  <td><%= imp.getTime() %></td>
                  <td class="text-end">
                    <button class="btn btn-light rounded btn-sm font-sm">
                      <a href="importDelete?importID=<%= imp.getImportID() %>">
                        <i class="material-icons md-delete"></i> Delete
                      </a>
                    </button>
                  </td>
                </tr>
                <%
                  }
                } else {
                %>
                <tr>
                  <td colspan="6" class="text-center">No imports found.</td>
                </tr>
                <%
                  }
                %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</main>

<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/select2.min.js"></script>
<script src="nest-backend/assets/js/vendors/perfect-scrollbar.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<script src="nest-backend/assets/js/vendors/chart.js"></script>
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
<script src="nest-backend/assets/js/custom-chart.js" type="text/javascript"></script>
</body>
</html>