<%@ page import="java.util.List" %>
<%@ page import="model.Unit" %>
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
    <jsp:param name="menu" value="warehouse"/>
</jsp:include>
<%
    List<Unit> units = (List<Unit>) request.getAttribute("units");
%>
<main class="main-wrap">
    <jsp:include page="header-staff.jsp"></jsp:include>
    <section class="content-main">
        <div class="content-header">
            <div>
                <h2 class="content-title card-title">Warehouses</h2>
                <p>Add, edit or delete a warehouse</p>
            </div>
            <div>
                <form action="warehouseList" method="get">
                    <input type="text" name="search" placeholder="Search Warehouses" class="form-control bg-white" />
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <form action="warehouseCU" method="post" onsubmit="return validateForm()">
                            <div class="mb-4">
                                <label for="warehouse_id" class="form-label">Address</label>
                                <input type="text" class="form-control" id="warehouse_id" name="warehouse_id" readonly />
                            </div>
                            <div class="mb-4">
                                <label for="warehouse_name" class="form-label">Name</label>
                                <input type="text" placeholder="Type here" class="form-control" id="warehouse_name" name="name" required />
                            </div>
                            <div class="mb-4">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" placeholder="Type here" class="form-control" id="address" name="address" required />
                            </div>
                            <div class="mb-4">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input type="text" placeholder="Type here" class="form-control" id="phone" name="phone" required />
                            </div>

                            <input type="text" hidden class="form-control" id="contactID" name="contactID"/>
                            <div class="mb-4">
                                <label class="form-label">Base Unit</label>
                                <select class="form-control" name="baseunitid" required>
                                    <%
                                        for (Unit unit : units) {
                                    %>
                                    <option value="<%= unit.getUnitID() %>"><%= unit.getName() %></option>
                                    <%
                                        }
                                    %>
                                </select>



                                
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" id="submit_button">Create Warehouse</button>
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
                                    <th>Address</th>
                                    <th>Phone Number</th>
                                    <th>Status</th>
                                    <%--                  <th class="text-end">Action</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Warehouse> warehouseList = (List<Warehouse>) request.getAttribute("warehouseList");
                                    if (warehouseList != null && !warehouseList.isEmpty()) {
                                        for (Warehouse warehouse : warehouseList) {
                                            ContactInformation contactInfo = (ContactInformation) request.getAttribute("contactInfo_" + warehouse.getContactInformationID());
                                            WarehouseStatus status = (WarehouseStatus) request.getAttribute("status_" + warehouse.getStatusID());
                                %>
                                <tr>
                                    <td onclick="populateForm('<%= warehouse.getWarehouseID() %>', '<%= warehouse.getName() %>', '<%= contactInfo.getAddress() %>', '<%= contactInfo.getPhoneNumber() %>', '<%= status.getStatusID() %>','<%= contactInfo.getContactInformationID() %>')">
                                        <%= warehouse.getWarehouseID() %></td>
                                    <td><%= warehouse.getName() %></td>
                                    <td><%= contactInfo.getAddress() %></td>
                                    <td><%= contactInfo.getPhoneNumber() %></td>
                                    <td><%= status.getDetail() %></td>
                                    <%--                  <td class="text-end">--%>
                                    <%--                    <button class="btn btn-light rounded btn-sm font-sm">--%>
                                    <%--                      <a href="warehouseDelete?warehouseID=<%= warehouse.getWarehouseID() %>"><i class="material-icons md-delete"></i>Delete</a>--%>
                                    <%--                    </button>--%>
                                    <%--                  </td>--%>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="6" class="text-center">No warehouses found.</td>
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
        function populateForm(warehouseID, warehouseName, address, phone, statusID,contactID) {
            document.getElementById("warehouse_name").value = warehouseName;
            document.getElementById("address").value = address;
            document.getElementById("phone").value = phone;
            document.getElementById("status").value = statusID;
            document.getElementById("contactID").value = contactID;
            document.getElementById("warehouse_id").value = warehouseID;
            document.getElementById("submit_button").innerText = "Update Warehouse";

            document.getElementById("cancel_button").style.display = "block";
        }

        function validateForm() {
            const nameField = document.getElementById("warehouse_name");
            if (nameField.value.trim() === "") {
                alert("Please enter a warehouse name.");
                return false;
            }
            return true;
        }

        function resetForm() {
            document.getElementById("warehouse_name").value = "";
            document.getElementById("address").value = "";
            document.getElementById("phone").value = "";
            document.getElementById("status").value = "";
            document.getElementById("warehouse_id").value = "";
            document.getElementById("submit_button").innerText = "Create Warehouse";
            document.getElementById("cancel_button").style.display = "none";
        }
    </script>

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
