<%@ page import="dto.CustomerDetailRespone" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
                <h4 class="card-title mb-4">Customer Information</h4>
                <form action="updateProfileCustomerForAdmin" method="post">
                    <!-- Hidden field for StaffID and AccountID -->
                    <%--                    <input type="hidden" name="staffID" value="${staff.staffID}" />--%>
                    <%--                    <input type="hidden" name="accountID" value="${staff.account.accountID}" />--%>

                    <div class="mb-3">
                        <label class="form-label">Status Account</label>
                        <select class="form-control" name="statusID" required>
                            <option value="1" ${customerListDetail.statusID == 1 ? 'selected' : ''}>Active</option>
                            <option value="4" ${customerListDetail.statusID == 4 ? 'selected' : ''}>Lock</option>
                        </select>
                    </div>
                    <input type="hidden" value="${accountID}" name="accountId">

                    <div class="mb-3">
                        <label class="form-label">First Name</label>
                        <input class="form-control" name="firstName" value="${customerListDetail.name}" placeholder="First Name" type="text" required readonly />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input class="form-control" name="email" value="${customerListDetail.email}" placeholder="Email" type="email" required readonly />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input class="form-control" name="phone" value="${customerListDetail.phoneNumber}" placeholder="Phone Number" type="text" required readonly/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input class="form-control" name="address" value="${customerListDetail.address}" placeholder="Address" type="text" required readonly/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Birth</label>
                        <%
                            CustomerDetailRespone cdr = (CustomerDetailRespone)request.getAttribute("customerListDetail");
                            String birth = "";
                            if(cdr.getBirth()!=null){
                                birth = cdr.getBirth().format(DateTimeFormatter.ISO_LOCAL_DATE);
                            }
                        %>
                        <input id="datePicker" class="form-control" name="birth" value="<%=birth%>" type="date" readonly/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Point</label>
                        <input class="form-control" name="point" value="${customerListDetail.point}" placeholder="Point" type="text" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Level</label>
                        <input class="form-control" name="level" value="${customerListDetail.level}" placeholder="Level" type="text" required  />
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
<script>document.getElementById("birth").defaultValue = "2014-02-09";</script>
<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>

