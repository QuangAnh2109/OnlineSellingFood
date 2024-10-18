<%@ page import="java.util.List" %>
<%@ page import="model.ContactInformation" %>
<%@ page import="model.WarehouseStatus" %>
<%@ page import="model.Warehouse" %>
<%@ page import="model.Supplier" %>
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
    <jsp:param name="page" value=""/>
    <jsp:param name="menu" value="supplier"/>
</jsp:include>
<main class="main-wrap">
    <jsp:include page="header-staff.jsp"></jsp:include>
    <section class="content-main">
        <div class="content-header">
            <div>
                <h2 class="content-title card-title">Suppliers</h2>
                <p>Add, edit or delete a supplier</p>
            </div>
            <div>
                <form action="supplierList" method="get">
                    <input type="text" name="search" placeholder="Search Suppliers" class="form-control bg-white" />
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <form action="supplierCU" method="post" onsubmit="return validateForm()">
                            <div class="mb-4">
                                <label for="supplier_name" class="form-label">Name</label>
                                <input type="text" placeholder="Type here" class="form-control" id="supplier_name" name="name" required />
                                <input type="hidden" id="supplier_id" name="supplierID" />
                            </div>
                            <div class="mb-4">
                                <label for="note" class="form-label">Note</label>
                                <input type="text" placeholder="Type here" class="form-control" id="note" name="note" required />
                            </div>

                            <input type="text" hidden class="form-control" id="contactID" name="contactID"/>
                            <div class="mb-4">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" placeholder="Type here" class="form-control" id="address" name="address" required />
                            </div>
                            <div class="mb-4">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input type="text" placeholder="Type here" class="form-control" id="phone" name="phone" required />
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" id="submit_button">Create Supplier</button>
                                <button type="button" class="btn btn-secondary mt-2" id="cancel_button" onclick="resetForm()" style="display: none;">Cancel</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Contact Information</th>
                                    <th>Note</th>
                                    <th class="text-end">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Supplier> supplierList = (List<Supplier>) request.getAttribute("supplierList");
                                    if (supplierList != null && !supplierList.isEmpty()) {
                                        for (Supplier supplier : supplierList) {
                                            ContactInformation contactInfo = (ContactInformation) request.getAttribute("contactInfo_" + supplier.getContactInformationID());
                                %>
                                <tr>
                                    <td onclick="populateForm('<%= supplier.getSupplierID() %>', '<%= supplier.getName() %>', '<%= supplier.getNote() %>', '<%= contactInfo.getContactInformationID() %>', '<%= contactInfo.getAddress() %>', '<%= contactInfo.getPhoneNumber() %>')">
                                        <%= supplier.getSupplierID() %></td>
                                    <td><%= supplier.getName() %></td>
                                    <td><%= contactInfo.getAddress() %> - <%= contactInfo.getPhoneNumber() %></td>
                                    <td><%= supplier.getNote() %></td>
                                    <td class="text-end">
                                        <form action="supplierDelete" method="post" style="display: inline;">
                                            <input type="hidden" name="supplierID" value="<%= supplier.getSupplierID() %>">
                                            <button type="submit" class="btn btn-light rounded btn-sm font-sm">
                                                <i class="material-icons md-delete"></i> Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="5" class="text-center">No suppliers found.</td>
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

    <!-- Script to populate the form -->
    <script>
        function populateForm(supplierID, supplierName, note, contactID, address, phone) {
            document.getElementById("supplier_name").value = supplierName;
            document.getElementById("note").value = note;
            document.getElementById("contactID").value = contactID;
            document.getElementById("address").value = address;  // Điền vào trường địa chỉ
            document.getElementById("phone").value = phone;      // Điền vào trường số điện thoại
            document.getElementById("supplier_id").value = supplierID;
            document.getElementById("submit_button").innerText = "Update Supplier";

            document.getElementById("cancel_button").style.display = "block";
        }

        function validateForm() {
            const nameField = document.getElementById("supplier_name");
            if (nameField.value.trim() === "") {
                alert("Please enter a supplier name.");
                return false;
            }
            return true;
        }

        function resetForm() {
            document.getElementById("supplier_name").value = "";
            document.getElementById("note").value = "";
            document.getElementById("contactID").value = "";
            document.getElementById("address").value = "";  // Reset trường địa chỉ
            document.getElementById("phone").value = "";    // Reset trường số điện thoại
            document.getElementById("supplier_id").value = "";
            document.getElementById("submit_button").innerText = "Create Supplier";
            document.getElementById("cancel_button").style.display = "none";
        }
    </script>
</body>

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
