<%@ page import="java.util.List" %>
<%@ page import="dto.ImportRespone" %>
<%@ page import="model.Warehouse" %>
<%@ page import="model.Supplier" %>
<%@ page import="model.Product" %>
<%@ page import="model.Unit" %>
<%@ page import="dal.UnitDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    function validateForm() {
        const mfgDate = new Date(document.getElementById("mfg").value);
        const expDate = new Date(document.getElementById("exp").value);

        if (expDate < mfgDate) {
            alert("Expiration date cannot be before Manufacturing date.");
            return false; // Ngăn không cho gửi form
        }
        return true; // Cho phép gửi form nếu hợp lệ
    }

    function doDelete(importID) {

        if (confirm("Are you sure you want to delete Product ?")) {
            window.location = "importProductDelete?importID=" + importID ;
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        const form = document.querySelector("form");

        form.addEventListener("submit", function(event) {
            if (!validateForm()) {
                event.preventDefault(); // Ngăn không cho gửi form
            }
        });
    });

    document.addEventListener("DOMContentLoaded", function() {
        const urlParams = new URLSearchParams(window.location.search);
        const importId = urlParams.get("id");

        if (importId) {
            document.getElementById("importId").value = importId;
        }
    });
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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
            <h2 class="content-title card-title">ImportProdcts</h2>
            <p></p>
            <div class="mt-3">
                <a href="Import" class="btn btn-secondary">Back to Imports</a>
            </div>
        </div>

        <div class="card">

            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
    <%
        String msg = (String)request.getAttribute("msg");
        if(msg==null) msg="";
    %>
                        <%=msg%>
                        <form action="ImportProduct" method="post">

                            <div class="mb-4">
                                <label for="importId" class="form-label">ImportID</label>
                                <input type="number" class="form-control" id="importId" name="importId" readonly required />

                            </div>
                            <div class="mb-4">
                                <label for="productID" class="form-label">Product</label>
                                <select class="form-control" id="productID" name="productID" required>
                                    <%
                                        List<Product> productList = (List<Product>) request.getAttribute("products");
                                        if (productList != null) {
                                            for (Product pr : productList) {
                                    %>
                                    <option value="<%= pr.getProductID() %>"><%= pr.getName() %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label for="mfg" class="form-label">Manufacturing Time</label>
                                <input type="date" class="form-control" id="mfg" name="mfg" required />
                            </div>
                            <div class="mb-4">
                                <label for="exp" class="form-label">Expiration Time</label>
                                <input type="date" class="form-control" id="exp" name="exp" required />
                            </div>
                            <div class="mb-4">
                                <label for="price" class="form-label">Price</label>
                                <input type="number" class="form-control" id="price" name="price" min="1" required />
                            </div>
                            <div class="mb-4">
                                <label for="quantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="quantity" name="quantity" min="1" required />
                            </div>
                            <div class="mb-4">
                                <label for="inventory" class="form-label">Inventory Quantity</label>
                                <input type="number" class="form-control" id="inventory" name="inventory" min="0" required />
                            </div>
                            <div class="mb-4">
                                <label for="unitID" class="form-label">Unit</label>
                                <select class="form-control" id="unitID" name="unitID" required>
                                    <%
                                        List<Unit> unitList = (List<Unit>) request.getAttribute("units");
                                        if (unitList != null) {
                                            for (Unit un : unitList) {
                                    %>
                                    <option value="<%= un.getUnitID() %>"><%= un.getName() %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="d-grid">

                                <button type="submit" class="btn btn-primary">Import Product</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-9">
                        <div class="table-responsive">

                            <table class="table table-hover">
                                <thead>
                                <tr>

                                    <th>Product Name</th>
                                    <th>MFG Date</th>
                                    <th>EXP Date</th>
                                    <th>Price</th>
                                    <th>Import Quantity</th>
                                    <th>Inventory Quantity</th>
                                    <th>Unit</th>
                                    <th class="text-end">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="imp" items="${list}">
                                    <tr>

                                        <td>${imp.getProductName()}</td>
                                        <td>${imp.getManufactureDate()}</td>
                                        <td>${imp.getExpireDate()}</td>
                                        <td>${imp.getPrice()}</td>
                                        <td>${imp.getImportQuantity()}</td>
                                        <td>${imp.getInventoryQuantity()}</td>
                                        <td>${imp.getUnitName()}</td>
                                        <td class="text-end">

                                            <a href="#" onclick="doDelete('${imp.getImportID()}')" class="btn btn-light rounded btn-sm font-sm">
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