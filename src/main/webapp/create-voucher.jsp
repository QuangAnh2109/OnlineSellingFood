<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/8/2024
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<script>
    function selectProduct(productID, name, discountPercent, startTime, endTime) {
        // Update the form fields with the product data
        document.getElementById('product_id').value = productID || '';
        document.getElementById('product_discount').value = discountPercent || '';
        document.getElementById('product_start_date').value = startTime || '';
        document.getElementById('product_end_date').value = endTime || '';
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
                <h2 class="content-title card-title">Voucher Products</h2>
                <p>Add, edit or delete a voucher</p>
            </div>

            <div>
                <form action="" method="get">
                    <input type="text" placeholder="Search Categories" name="search" class="form-control bg-white"/>
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>

            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <form method="post" action="discount">
                            <%--                            <div class="mb-4">--%>
                            <%--                                <label for="product_name" class="form-label">Name</label>--%>
                            <%--                                <input type="text" placeholder="Type here" class="form-control" id="product_name" />--%>
                            <%--                            </div>--%>
                            <div class="mb-4">
                                <label for="discountID" class="form-label">DiscountID</label>
                                <input type="number" class="form-control" id="discountID" name="discountID" min="1"
                                       max="100"/>
                            </div>
                            <div class="mb-4">
                                <label for="product_discount" class="form-label">Discount(Percent)</label>
                                <input type="number" class="form-control" id="product_discount" name="discountID"
                                       min="1" max="100"/>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Start Date</label>
                                <input type="datetime-local" class="form-control" id="product_start_date"
                                       name="startDate"/>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">End Date</label>
                                <input type="datetime-local" class="form-control" id="product_end_date" name="endDate"/>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="quantity" name="quantity"/>
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Inventory</label>
                                <input type="number" class="form-control" id="inventory" name="quantity"/>
                            </div>
                            <div class="d-grid">
                                <button class="btn btn-primary" type="submit">Create Voucher</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>

                                    <th>VoucherID</th>
                                    <th>DiscountID</th>
                                    <th>Discount Percent</th>
                                    <th>Start Time</th>
                                    <th>End Time</th>
                                    <th>Quantity</th>
                                    <th>Inventory</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--                                <c:forEach var="d" items="${productDiscount}">--%>


                                <%--                                    <tr onclick="selectProduct('${d.productID}', '${d.name}', '${d.discountPercent}', '${d.startTime}', '${d.endTime}')">--%>
                                <%--                                        <td>${d.productID}</td>--%>
                                <%--                                        <td>${d.name}</td>--%>
                                <%--                                        <td>${d.categoryName}</td>--%>
                                <%--                                        <td>${d.price}</td>--%>
                                <%--                                        <td>${d.discountPercent}</td>--%>
                                <%--                                        <td>${(d.price-(d.price*(d.discountPercent/100)))}</td>--%>
                                <%--                                        <td>${d.startTime}</td>--%>
                                <%--                                        <td>${d.endTime}</td>--%>
                                <%--                                        <td>--%>
                                <%--                                            <div class="col-lg-2 col-sm-2 col-4 col-action text-end">--%>
                                <%--                                                <a href="#" on onclick="doDelete('${d.productID}','${d.discountID}')" class="btn btn-sm font-sm btn-light rounded"> <i class="material-icons md-delete_forever"></i> Delete </a>--%>
                                <%--                                            </div>--%>
                                <%--                                        </td>--%>
                                <%--                                    </tr>--%>
                                <%--                                </c:forEach>--%>
                                </tbody>
                            </table>
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

