<%@ page import="model.Account" %><%--
  Created by IntelliJ IDEA.
  User: anh21
  Date: 9/30/2024
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    int role = ((Account)session.getAttribute("account")).getRoleID();
    String pageActive = request.getParameter("page"), pageMenuActive = request.getParameter("menu");
%>
<aside class="navbar-aside" id="offcanvas_aside">
    <div class="aside-top">
        <div>
            <button class="btn btn-icon btn-aside-minimize"><i class="text-muted material-icons md-menu_open"></i></button>
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
            <li class="menu-item" id="changepass">
                <a class="menu-link" href="account-changepass-staff.jsp">
                    <i class="icon material-icons md-person"></i>
                    <span class="text">Change Password</span>
                </a>
            </li>
            <%
                if(role==1){
            %>
            <li class="menu-item has-submenu" id="account">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-person"></i>
                    <span class="text">Account</span>
                </a>
                <div class="submenu">
                    <a href="staffList" id="staff">Staff list</a>
                    <a href="customerList" id="customer">Customer list</a>
                    <a href="registerstaff" id="registerstaff">Staff register</a>
                </div>
            </li>
            <li class="menu-item" id="warehouse">
                <a class="menu-link" href="warehouseList">
                    <i class="icon material-icons md-store"></i>
                    <span class="text">Warehouse</span>
                </a>
            </li>
            <li class="menu-item" id="unit">
                <a class="menu-link" href="unitlist">
                    <i class="icon material-icons md-shopping_bag"></i>
                    <span class="text">Unit</span>
                </a>
            </li>
            <li class="menu-item has-submenu" id="manufacter">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-store"></i>
                    <span class="text">Manufacter</span>
                </a>
                <div class="submenu">
                    <a href="manulist" id="manulist">Manufacter list</a>
                    <a href="registerManu" id="addmanu">Add New Manufacter</a>
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

            <li class="menu-item has-submenu" id="product">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-shopping_bag"></i>
                    <span class="text">Products</span>
                </a>
                <div class="submenu">
                    <a href="certificationList" id="certification">Certificate</a>
                    <a href="certificateIssuerList" id="certificateissuer">Certificate Issuer</a>
                    <a href="categoryList" id="category">Category</a>
                    <a href="originList" id="origin">Origin</a>
                    <a href="discount" id="discount">Discount</a>
                </div>
            </li>
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