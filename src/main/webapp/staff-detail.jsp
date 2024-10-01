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
    <header class="main-header style-2 navbar">
        <div class="col-brand">
            <a href="index.html" class="brand-wrap">
                <img src="nest-backend/assets/imgs/theme/logo.svg" class="logo" alt="Nest Dashboard" />
            </a>
        </div>
        <div class="col-nav">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link btn-icon" href="#">
                        <i class="material-icons md-notifications animation-shake"></i>
                        <span class="badge rounded-pill">3</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn-icon darkmode" href="#"> <i class="material-icons md-nights_stay"></i> </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="requestfullscreen nav-link btn-icon"><i class="material-icons md-cast"></i></a>
                </li>
                <li class="dropdown nav-item">
                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownLanguage" aria-expanded="false"><i class="material-icons md-public"></i></a>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownLanguage">
                        <a class="dropdown-item text-brand" href="#"><img src="nest-backend/assets/imgs/theme/flag-us.png" alt="English" />English</a>
                        <a class="dropdown-item" href="#"><img src="nest-backend/assets/imgs/theme/flag-fr.png" alt="Français" />Français</a>
                        <a class="dropdown-item" href="#"><img src="nest-backend/assets/imgs/theme/flag-jp.png" alt="Français" />日本語</a>
                        <a class="dropdown-item" href="#"><img src="nest-backend/assets/imgs/theme/flag-cn.png" alt="Français" />中国人</a>
                    </div>
                </li>
                <li class="dropdown nav-item">
                    <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownAccount" aria-expanded="false"> <img class="img-xs rounded-circle" src="nest-backend/assets/imgs/people/avatar-2.png" alt="User" /></a>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownAccount">
                        <a class="dropdown-item" href="#"><i class="material-icons md-perm_identity"></i>Edit Profile</a>
                        <a class="dropdown-item" href="#"><i class="material-icons md-settings"></i>Account Settings</a>
                        <a class="dropdown-item" href="#"><i class="material-icons md-account_balance_wallet"></i>Wallet</a>
                        <a class="dropdown-item" href="#"><i class="material-icons md-receipt"></i>Billing</a>
                        <a class="dropdown-item" href="#"><i class="material-icons md-help_outline"></i>Help center</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-danger" href="#"><i class="material-icons md-exit_to_app"></i>Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </header>
    <section class="content-main mt-80 mb-80">
        <div class="card mx-auto card-login">
            <div class="card-body">
                <h4 class="card-title mb-4">Edit Staff Information</h4>
                <form action="staffListDetail">
                    <!-- Hidden field for StaffID and AccountID -->
<%--                    <input type="hidden" name="staffID" value="${staff.staffID}" />--%>
<%--                    <input type="hidden" name="accountID" value="${staff.account.accountID}" />--%>

                    <div class="mb-3">
                        <label class="form-label">Role ID</label>
                        <select class="form-control" name="roleID" required>
                            <option value="2" ${staffListDetail.roleID == 2 ? 'selected' : ''}>Delivery Staff</option>
                            <option value="3" ${staffListDetail.roleID == 3 ? 'selected' : ''}>Import Staff</option>
                            <option value="4" ${staffListDetail.roleID == 4 ? 'selected' : ''}>Warehouse Management</option>
                            <option value="5" ${staffListDetail.roleID == 5 ? 'selected' : ''}>Sales Management</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">First Name</label>
                        <input class="form-control" name="firstName" value="${staffListDetail.firstName}" placeholder="First Name" type="text" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Last Name</label>
                        <input class="form-control" name="lastName" value="${staffListDetail.lastName}" placeholder="Last Name" type="text" required />
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
                        <label class="form-label">Birth Year</label>
                        <input class="form-control" name="birthYear" value="${staffListDetail.yearOfBirth}" placeholder="Year of birth" type="text" required />
                    </div>





                    <div class="mb-3">
                        <label class="form-label">Salary</label>
                        <input class="form-control" name="salary" value="${staffListDetail.salary}" placeholder="Salary" type="text" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Warehouse ID</label>
                        <input class="form-control" name="warehouseID" value="${staffListDetail.nameWarehouse}" placeholder="Warehouse ID" type="text" required />
                    </div>

                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary w-100">Update</button>
                    </div>
                </form>
            </div>
        </div>

    </section>
    <footer class="main-footer text-center">
        <p class="font-xs">
            <script>
                document.write(new Date().getFullYear());
            </script>
            &copy; Nest - HTML Ecommerce Template .
        </p>
        <p class="font-xs mb-30">All rights reserved</p>
    </footer>
</main>
<script src="nest-backend/assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="nest-backend/assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="nest-backend/assets/js/vendors/jquery.fullscreen.min.js"></script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>

