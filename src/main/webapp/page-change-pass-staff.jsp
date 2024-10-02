<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/25/2024
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/25/2024
  Time: 7:54 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <%
        String msg = (String)request.getAttribute("msg");
        if(msg==null) msg="";
    %>
    <jsp:include page="header-staff.jsp">
        <jsp:param name="accountName" value=""/>
    </jsp:include>
    <section class="content-main mt-80 mb-80">
        <div class="card mx-auto card-login">
            <div class="card-body">
                <h4 class="card-title mb-4">Change Password</h4>
                <form action="changepassstaff" method="post" >
                    <div class="mb-3">
                        <input class="form-control" placeholder="New Password" minlength="8" name="newPassword" type="password" />
                    </div>
                    <!-- form-group// -->
                    <div class="mb-3">
                        <input class="form-control" placeholder="Confirm Password" minlength="8" name="confirmPassword" type="password" />
                    </div>
                    <label style="color: red"><%=msg%></label>
                    <!-- form-group form-check .// -->
                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary w-100">Change Password</button>
                    </div>
                    <!-- form-group// -->
                </form>

            </div>
        </div>
    </section>
</main>
<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>



