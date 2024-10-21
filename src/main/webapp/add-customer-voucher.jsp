<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/8/2024
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<script>
    function selectVoucher(discountPercent, startTime, endTime, quantity) {
        // Update the form fields with the product data

        document.getElementById('discount_percent').value = discountPercent || '';
        document.getElementById('voucher_start_date').value = startTime || '';
        document.getElementById('voucher_end_date').value = endTime || '';
        document.getElementById('voucher_quantity').value = quantity || '';

    }
</script>
<script type="text/javascript">
    function doDelete(productID, discountID) {
        if (confirm("Are you sure to delete discount with productID=" + productID)) {
            window.location = "deleteDiscount?productID=" + productID + "&discountID=" + discountID;
        }
    }
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Nest Dashboard</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta property="og:title" content=""/>
    <meta property="og:type" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:image" content=""/>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="nest-backend/assets/imgs/theme/favicon.svg"/>
    <!-- Template CSS -->
    <link href="nest-backend/assets/css/main.css?v=1.1" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="screen-overlay"></div>
<jsp:include page="bar-staff.jsp">
    <jsp:param name="page" value=""/>
    <jsp:param name="menu" value="voucher"/>
</jsp:include>
<main class="main-wrap">
    <jsp:include page="header-staff.jsp"></jsp:include>
    <section class="content-main">
        <div class="content-header">
            <div>
                <h2 class="content-title card-title">Add Customer Voucher</h2>
                <p>Add, edit or delete a voucher</p>
            </div>


        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <c:set var="vr" value="${voucher}"></c:set>
                        <!-- Bắt đầu form chính -->
                        <form method="post" action="customervoucher">
                            <!-- Phần thông tin voucher -->
                            <div class="mb-4">
                                <label for="voucher_id" class="form-label">VoucherID</label>
                                <input type="number" class="form-control" id="voucher_id" name="voucherID"
                                       value="${vr.voucherID}" readonly=""/>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">DiscountID</label>
                                <input type="number" class="form-control" id="discount_id"
                                       name="discountID" value="${vr.discountID}" readonly=""/>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Discount(Percent)</label>
                                <input type="number" class="form-control" id="discount_percent" name="discountPercent"
                                       value="${vr.discountPercent}" readonly=""/>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Start Date</label>
                                <input type="datetime-local" class="form-control" id="voucher_start_date"
                                       name="startDate" value="${vr.startTime}" readonly=""/>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">End Date</label>
                                <input type="datetime-local" class="form-control" id="voucher_end_date" name="endDate"
                                       value="${vr.endTime}" readonly=""/>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="voucher_quantity" name="quantity"
                                       value="${vr.quantity}" readonly=""/>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Inventory</label>
                                <input type="number" class="form-control" id="voucher_inventory" name="inventory"
                                       value="${vr.inventory}" readonly=""/>
                            </div>
                    </div>

                    <div class="col-md-9">
                        <!-- Phần danh sách khách hàng với checkbox -->
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>CustomerID</th>
                                    <th>CustomerName</th>
                                    <th>Point</th>
                                    <th>Level</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="cv" items="${customervoucher}">
                                    <tr>
                                        <td>${cv.customerID}</td>
                                        <td>${cv.customerName}</td>
                                        <td>${cv.point}</td>
                                        <td>${cv.level}</td>
                                        <td class="text-center">
                                            <div class="d-flex justify-content-center align-items-center">
                                                <input type="checkbox" name="selectedCustomer"
                                                       value="${cv.customerID}" class="form-check-input"
                                                       style="transform: scale(1.5);"  />
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Nút submit để gửi toàn bộ form -->
                    <div class="d-grid">
                        <button class="btn btn-primary btn-sm" style="width: 24%;" type="submit">Add Customer Voucher</button>
                    </div>
                    </form>
                    <!-- Kết thúc form chính -->
                </div>
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

