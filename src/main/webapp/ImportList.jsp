<%@ page import="java.util.List" %>
<%@ page import="dto.ImportRespone" %>
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
      if (confirm("Are you sure you want to delete import with ID=" + importID + "?")) {
        window.location = "importDelete?importID=" + importID;
      }
    }
  </script>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Nest Dashboard - Imports</title>
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="shortcut icon" type="image/x-icon" href="nest-backend/assets/imgs/theme/favicon.svg" />
  <link href="nest-backend/assets/css/main.css?v=1.1" rel="stylesheet" type="text/css" />
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
      <h2 class="content-title card-title">Imports</h2>
      <p>Add, edit, or delete imports</p>
    </div>

    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-md-3">
            <form action="importCU" method="post">
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
                <button type="submit" class="btn btn-primary">Create Import</button>
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
                <c:forEach var="imp" items="${importList}">
                  <tr>
                    <td>${imp.getImportID()}</td>
                    <td>${imp.getAccountName()}</td>
                    <td>${imp.getWarehouseName()}</td>
                    <td>${imp.getSupplierName()}</td>
                    <td>${imp.getImportTime()}</td>
                    <td class="text-end">
                      <a href="#" onclick="doDelete('${imp.importID}')" class="btn btn-light rounded btn-sm font-sm">
                        <i class="material-icons md-delete"></i> Delete
                      </a>
                    </td>
                  </tr>
                </c:forEach>

                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>

<footer class="main-footer font-xs">
  <div class="row pb-30 pt-15">
    <div class="col-sm-6">
      <script>document.write(new Date().getFullYear());</script>
      &copy; Nest - HTML Ecommerce Template.
    </div>
    <div class="col-sm-6">
      <div class="text-sm-end">All rights reserved</div>
    </div>
  </div>
</footer>

<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>