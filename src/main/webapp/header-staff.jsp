<%@ page import="model.Account" %><%--
  Created by IntelliJ IDEA.
  User: anh21
  Date: 9/30/2024
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    Account account = ((Account)request.getSession().getAttribute("account"));
%>
<header class="main-header style-2 navbar">
    <div class="col-brand">
        <a href="home-page-staff.jsp" class="brand-wrap">
            <img src="nest-backend/assets/imgs/theme/logo.svg" class="logo" alt="Nest Dashboard" />
        </a>
    </div>
    <div class="col-nav">
        <%
            if(account==null){
        %>
        <a href="loginstaff">Login</a>
        <%
            }
            else{
        %>
        <ul class="nav">
            <div class="col-nav">
                <ul class="nav">
                    <li class="dropdown nav-item">
                        <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownAccount" aria-expanded="false"> <img class="img-xs rounded-circle" src="nest-backend/assets/imgs/people/avatar-2.png" alt="User" /></a>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownAccount">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="logout"><i class="material-icons md-exit_to_app"></i>Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </ul>
        <%
            }
        %>
    </div>
</header>