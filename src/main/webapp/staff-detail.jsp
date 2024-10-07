<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="dto.StaffDetailRespone" %>
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
<main>
    <jsp:include page="header-staff.jsp"></jsp:include>
    <section class="content-main mt-80 mb-80">
        <div class="card mx-auto card-login">
            <div class="card-body">
                <h4 class="card-title mb-4">Edit Staff Information</h4>
                <form action="updateProfileStaffForAdmin" method="post">
                    <!-- Hidden field for StaffID and AccountID -->
<%--                    <input type="hidden" name="staffID" value="${staff.staffID}" />--%>
<%--                    <input type="hidden" name="accountID" value="${staff.account.accountID}" />--%>

                    <div class="mb-3">
                        <label class="form-label">Role Name</label>
                        <select class="form-control" name="roleID" required>
                            <option value="2" ${staffListDetail.roleID == 2 ? 'selected' : ''}>Delivery Staff</option>
                            <option value="3" ${staffListDetail.roleID == 3 ? 'selected' : ''}>Import Staff</option>
                            <option value="4" ${staffListDetail.roleID == 4 ? 'selected' : ''}>Warehouse Management</option>
                            <option value="5" ${staffListDetail.roleID == 5 ? 'selected' : ''}>Sales Management</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input class="form-control" name="name" value="${staffListDetail.name}" placeholder="First Name" type="text" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Gender</label>
                        <select class="form-control" name="gender" required>
                            <option value="1">Male</option>
                            <option value="2">Female</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input class="form-control" name="email" value="${staffListDetail.email}" placeholder="Email" type="email" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input class="form-control" name="phone" value="${staffListDetail.phoneNumber}" placeholder="Phone Number" type="text" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input class="form-control" name="address" value="${staffListDetail.address}" placeholder="Address" type="text" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Birth</label>
                        <%
                            StaffDetailRespone cdr = (StaffDetailRespone)request.getAttribute("staffListDetail");
                            String birth = "";
                            if(cdr.getBirth()!=null){
                                birth = cdr.getBirth().format(DateTimeFormatter.ISO_LOCAL_DATE);
                            }
                        %>
                        <input class="form-control" name="birth" value="<%=birth%>" type="date"/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Salary</label>
                        <input class="form-control" name="salary" value="${staffListDetail.salary}" placeholder="Salary" type="text" required />
                    </div>
                    <div>
                        <input name="accountID" value="${accountID}" hidden="">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Warehouse Name</label>
                        <select class="form-control" name="warehouseID" required>
                            <option value="1" ${staffListDetail.warehouseID == 1 ? 'selected' : ''}>Kho A</option>
                            <option value="2" ${staffListDetail.warehouseID == 2 ? 'selected' : ''}>Kho B</option>
                            <option value="3" ${staffListDetail.warehouseID == 3 ? 'selected' : ''}>Kho C</option>

                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Status Account</label>
                        <select class="form-control" name="statusID" required>
                            <option value="1" ${staffListDetail.statusID == 1 ? 'selected' : ''}>Activity</option>
<%--                            <option value="2" ${staffListDetail.statusID == 2 ? 'selected' : ''}>No Authenticate</option>--%>
                            <option value="3" ${staffListDetail.statusID == 3 ? 'selected' : ''}>Password change request</option>
                            <option value="4" ${staffListDetail.statusID == 4? 'selected' : ''}>Lock</option>

                        </select>
                    </div>

                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary w-100">Update</button>
                    </div>
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

