<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CertificateIssuer" %>
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
  <jsp:param name="page" value="certificateissuer"/>
  <jsp:param name="menu" value="product"/>
</jsp:include>
<main class="main-wrap">
  <jsp:include page="header-staff.jsp"></jsp:include>
  <section class="content-main">
    <div class="content-header">
      <div>
        <h2 class="content-title card-title">Certificate Issuers</h2>
        <p>Add, edit or delete a certificate issuer</p>
      </div>
      <div>
        <form action="certificateIssuerSearch" method="post">
          <input type="text" name="searchKeyword" placeholder="Search Certificate Issuers" class="form-control bg-white" />
          <button type="submit" class="btn btn-primary">Search</button>
        </form>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-md-3">
            <form action="certificateIssuerCU" method="post" onsubmit="return validateForm()">
              <div class="mb-4">
                <label for="certificate_name" class="form-label">Name</label>
                <input type="text" placeholder="Type here" class="form-control" id="certificate_name" name="name" required />
                <input type="hidden" id="certificate_issuer_id" name="certificateIssuerID" />
              </div>
              <div class="mb-4">
                <label for="certificate_detail" class="form-label">Detail</label>
                <textarea placeholder="Details here" class="form-control" id="certificate_detail" name="detail" required></textarea>
              </div>
              <div class="d-grid">
                <button type="submit" class="btn btn-primary" id="submit_button">Create certificate issuer</button>
                <button type="button" class="btn btn-secondary mt-2" id="cancel_button" onclick="resetForm()" style="display: none;">Cancel</button>
              </div>
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
                  <th class="text-end">Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<CertificateIssuer> certificateList = (List<CertificateIssuer>) request.getAttribute("certificateList");
                  if (certificateList != null && !certificateList.isEmpty()) {
                    for (CertificateIssuer issuer : certificateList) {
                %>
                <tr>
                  <td onclick="populateForm('<%= issuer.getCertificateIssuerID() %>', '<%= issuer.getName() %>', '<%= issuer.getDetail() %>')"><%= issuer.getCertificateIssuerID() %></td>
                  <td onclick="populateForm('<%= issuer.getCertificateIssuerID() %>', '<%= issuer.getName() %>', '<%= issuer.getDetail() %>')"><b><%= issuer.getName() %></b></td>
                  <td><%= issuer.getDetail() %></td>
                  <td class="text-end">
                    <button class="btn btn-light rounded btn-sm font-sm">
                      <a href="certificateIssuerDelete?certificateIssuerID=<%=issuer.getCertificateIssuerID()%>"><i class="material-icons md-delete"></i>Delete</a>
                    </button>
                  </td>
                </tr>
                <%
                  }
                } else {
                %>
                <tr>
                  <td colspan="4" class="text-center">No certificate issuers found.</td>
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
  <script>
    function populateForm(certificateIssuerID, certificateIssuerName, certificateIssuerDetail) {
        document.getElementById("certificate_name").value = certificateIssuerName;
        document.getElementById("certificate_detail").value = certificateIssuerDetail;
        document.getElementById("certificate_issuer_id").value = certificateIssuerID;
        document.getElementById("submit_button").innerText = "Update certificate issuer"; // Đổi nhãn nút thành "Update"

        // Hiển thị nút Cancel
        document.getElementById("cancel_button").style.display = "block";
      }


      function validateForm() {
      const nameField = document.getElementById("issuer_name");
      const detailField = document.getElementById("issuer_detail");

      if (nameField.value.trim() === "") {
        alert("Please enter a certificate issuer name.");
        return false; // Ngăn gửi form nếu trường tên để trống
      }

      if (detailField.value.trim() === "") {
        alert("Please enter certificate issuer detail.");
        return false; // Ngăn gửi form nếu trường chi tiết để trống
      }

      return true; // Cho phép gửi form nếu tất cả các kiểm tra đều hợp lệ
    }

    function resetForm() {
      document.getElementById("issuer_name").value = "";
      document.getElementById("issuer_detail").value = "";
      document.getElementById("certificate_issuer_id").value = "";
      document.getElementById("submit_button").innerText = "Create certificate issuer"; // Đặt lại nhãn nút về trạng thái ban đầu
      document.getElementById("cancel_button").style.display = "none"; // Ẩn nút Cancel
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
<script src="assets/js/vendors/jquery-3.6.0.min.js"></script>
<script src="assets/js/vendors/bootstrap.bundle.min.js"></script>
<script src="assets/js/vendors/select2.min.js"></script>
<script src="assets/js/vendors/perfect-scrollbar.js"></script>
<script src="assets/js/vendors/jquery.fullscreen.min.js"></script>
<!-- Main Script -->
<script src="assets/js/main.js?v=1.1" type="text/javascript"></script>
</body>
</html>
