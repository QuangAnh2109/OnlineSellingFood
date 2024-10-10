<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:param name="page" value="manulist"/>
    <jsp:param name="menu" value="account"/>
</jsp:include>
<main class="main-wrap">
    <jsp:include page="header-staff.jsp"></jsp:include>
    <section class="content-main">
        <div class="content-header">
            <h2 class="content-title">Manufacter</h2>
            <div>
                <a href="registerstaff" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>
            </div>
        </div>
        <div class="card mb-4">
            <header class="card-header">
                <div class="row gx-3">
                    <div class="col-lg-4 col-md-6 me-auto">
                        <input type="text" placeholder="Search..." class="form-control" />
                    </div>
                    <div class="col-lg-2 col-md-3 col-6">
                        <select class="form-select">
                            <option>Status</option>
                            <option>Active</option>
                            <option>Disabled</option>
                            <option>Show all</option>
                        </select>
                    </div>
                    <div class="col-lg-2 col-md-3 col-6">
                        <select class="form-select">
                            <option>Show 20</option>
                            <option>Show 30</option>
                            <option>Show 40</option>
                        </select>
                    </div>
                </div>
            </header>
            <!-- card-header end// -->
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <%--              <th>Email</th>--%>
                            <th>Status</th>
                            <%--              <th>Registered</th>--%>
                            <th class="text-end">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty manuList}">
                                <tr>
                                    <td colspan="3">No manufacturers found.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${manuList}" var="mn">
                                    <tr>
                                        <td width="40%">
                                            <a href="#" class="itemside">
                                                <div class="left">
                                                    <img src="nest-backend/assets/imgs/people/avatar-1.png" class="img-sm img-avatar" alt="Userpic" />
                                                </div>
                                                <div class="info pl-3">
                                                    <h6 class="mb-0 title">${mn.name}</h6>
                                                </div>
                                            </a>
                                        </td>
                                        <td>${mn.introduce}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                    <!-- table-responsive.// -->
                </div>
            </div>
            <!-- card-body end// -->
        </div>
        <!-- card end// -->
        <div class="pagination-area mt-15 mb-50">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-start">
                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                    <li class="page-item"><a class="page-link dot" href="#">...</a></li>
                    <li class="page-item"><a class="page-link" href="#">16</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#"><i class="material-icons md-chevron_right"></i></a>
                    </li>
                </ul>
            </nav>
        </div>
    </section>
    <!-- content-main end// -->
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
<%@ page import="model.Account" %><%--
  Created by IntelliJ IDEA.
  User: anh21
  Date: 9/30/2024
  Time: 10:53 AM
--%>
<%
    Account account = (Account) session.getAttribute("account");
    int role = (account != null) ? account.getRoleID() : 0; // Check if session is null
    String pageActive = request.getParameter("page");
    String pageMenuActive = request.getParameter("menu");
%>
<aside class="navbar-aside" id="offcanvas_aside">
    <div class="aside-top">
        <div>
            <button class="btn btn-icon btn-aside-minimize">
                <i class="text-muted material-icons md-menu_open"></i>
            </button>
        </div>
    </div>
    <nav>
        <ul class="menu-aside">
            <li class="menu-item" id="homepage">
                <a class="menu-link" href="home-page-staff.jsp">
                    <i class="icon material-icons md-home"></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>

            <% if(role == 1) { %>  <!-- Admin Role -->
            <li class="menu-item has-submenu" id="account">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-person"></i>
                    <span class="text">Account</span>
                </a>
                <div class="submenu">
                    <a href="staffList" id="stafflist">Staff list</a>
                    <a href="customerList" id="customerlist">Customer list</a>
                    <a href="registerstaff" id="registerstaff">Staff register</a>
                </div>
            </li>

            <li class="menu-item has-submenu">
                <a class="menu-link" href="page-sellers-cards.html">
                    <i class="icon material-icons md-store"></i>
                    <span class="text">Manufacter</span>
                </a>
                <div class="submenu">

                    <a href="manulist" id="manulist">Manufacter list</a>
                    <a href="page-seller-detail.html">Add New Manufacter</a>
                </div>
            </li>
            <%
            }
            else if(role==2){
            %>
            <%
            }
            else if(role==3){
            %>
            <%
            }
            else if(role==4){
            %>
            <%
            }
            else if(role==5){
            %>
            <%
                }
            %>

        </ul>
        <hr/>
    </nav>
</aside>

<script>
    document.getElementById("<%=pageMenuActive%>").classList.add("active");
    document.getElementById("<%=pageActive%>").classList.add("active");
</script>
