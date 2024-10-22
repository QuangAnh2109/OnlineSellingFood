<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Certification" %>
<%@ page import="model.CertificateIssuer" %>
<%@ page import="dal.ImgDAO" %>
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
    <jsp:param name="page" value="certification"/>
    <jsp:param name="menu" value="product"/>
</jsp:include>
<main class="main-wrap">
    <jsp:include page="header-staff.jsp"></jsp:include>
    <section class="content-main">
        <div class="content-header">
            <div>
                <h2 class="content-title card-title">Certifications</h2>
                <p>Add, edit or delete a certification</p>
            </div>
            <div>
                <form action="certificationSearch" method="post">
                    <input type="text" name="searchKeyword" placeholder="Search Certifications" class="form-control bg-white" />
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <form action="certificationCU" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <div class="mb-4">
                                <label for="certificate_name" class="form-label">Name</label>
                                <input type="text" placeholder="Type here" class="form-control" id="certificate_name" name="name" required />
                                <input type="hidden" id="certification_id" name="certificationID" />
                            </div>
                            <div class="mb-4">
                                <label for="certificate_detail" class="form-label">Detail</label>
                                <input type="text" placeholder="Enter details" class="form-control" id="certificate_detail" name="detail" required />
                            </div>
                            <div class="mb-4">
                                <label for="certificate_issuer" class="form-label">Certificate Issuer</label>
                                <select class="form-control" id="certificate_issuer" name="certificateIssuerID" required>
                                    <%
                                        List<CertificateIssuer> issuerList = (List<CertificateIssuer>) request.getAttribute("issuerList");
                                        if (issuerList != null && !issuerList.isEmpty()) {
                                            for (CertificateIssuer issuer : issuerList) {
                                    %>
                                    <option value="<%= issuer.getCertificateIssuerID() %>"><%= issuer.getName() %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label for="imagefile" class="form-label">Upload Image</label>
                                <input type="file" name="img" id="imagefile" accept="image/gif, image/jpeg, image/png" required />
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" id="submit_button">Create certification</button>
                                <button type="button" class="btn btn-secondary mt-2" id="cancel_button" onclick="resetForm()" style="display: none;">Cancel</button>
                            </div>
                            <input type="text" hidden class="form-control" id="certificationID" name="certificationID"/>
                        </form>

                    </div>
                    <div class="col-md-9">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Detail</th>
                                    <th>Issuer</th>
                                    <th>Image</th>
                                    <th class="text-end">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Certification> certificationList = (List<Certification>) request.getAttribute("certificationList");
                                    if (certificationList != null && !certificationList.isEmpty()) {
                                        ImgDAO imgdao = new ImgDAO();
                                        for (Certification certification : certificationList) {
                                %>
                                <tr>
                                    <td onclick="populateForm('<%= certification.getCertificationID() %>', '<%= certification.getName() %>', '<%= certification.getDetail() %>', '<%= certification.getImgID() %>', '<%= certification.getCertificateIssuerID() %>')"><%= certification.getCertificationID() %></td>
                                    <td onclick="populateForm('<%= certification.getCertificationID() %>', '<%= certification.getName() %>', '<%= certification.getDetail() %>', '<%= certification.getImgID() %>', '<%= certification.getCertificateIssuerID() %>')">
                                        <b><%= certification.getName() %></b></td>
                                    <td><%= certification.getDetail() %></td>
                                    <td><%= certification.getCertificateIssuerID() %></td>
<%--                                 <td><img src="<%= certification.getImgID() %>" alt="Image" style="width: 50px; height: auto;"></td>--%>
                                    <td><img src="Img/<%= imgdao.getImgLinkByID(certification.getImgID()) %>" alt="Image" style="width: 100px; height: auto;"></td>
                                    <td class="text-end">
                                        <button class="btn btn-light rounded btn-sm font-sm">
                                            <a href="certificationDelete?certificationID=<%= certification.getCertificationID() %>"><i class="material-icons md-delete"></i>Delete</a>
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="6" class="text-center">No certifications found.</td>
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
        function populateForm(certificationID, name, detail, imgID, certificateIssuerID) {
            document.getElementById("certificate_name").value = name;
            document.getElementById("certificate_detail").value = detail;
            document.getElementById("certification_id").value = certificationID;
            document.getElementById("certificate_issuer").value = certificateIssuerID;

            // Cập nhật hình ảnh
            const imgTag = document.getElementById("imagefile");
            imgTag.src = imgID;

            document.getElementById("submit_button").innerText = "Update certification";
            document.getElementById("cancel_button").style.display = "block";
        }

        function validateForm() {
            const nameField = document.getElementById("certificate_name");
            const detailField = document.getElementById("certificate_detail");
            if (nameField.value.trim() === "" || detailField.value.trim() === "") {
                alert("Please fill in all required fields.");
                return false; // Prevent form submission if any required field is empty
            }
            return true; // Allow form submission if all checks pass
        }

        function resetForm() {
            document.getElementById("certificate_name").value = "";
            document.getElementById("certificate_detail").value = "";
            document.getElementById("image_link").value = "";
            document.getElementById("certification_id").value = "";
            document.getElementById("submit_button").innerText = "Create certification"; // Reset button label to default
            document.getElementById("cancel_button").style.display = "none"; // Hide Cancel button
        }
    </script>


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
<script src="nest-backend/assets/js/vendors/chart.js"></script>
<!-- Main Script -->
<script src="nest-backend/assets/js/main.js?v=1.1" type="text/javascript"></script>
<script src="nest-backend/assets/js/custom-chart.js" type="text/javascript"></script>
</body>
</html>
