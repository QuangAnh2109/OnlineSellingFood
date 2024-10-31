<%--
  Created by IntelliJ IDEA.
  User: anh21
  Date: 10/31/2024
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Nest Dashboard</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:title" content="">
    <meta property="og:type" content="">
    <meta property="og:url" content="">
    <meta property="og:image" content="">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="nest-backend/assets/imgs/theme/favicon.svg">
    <!-- Template CSS -->
    <link href="nest-backend/assets/css/main.css?v=1.1" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="screen-overlay"></div>
<main class="main-wrap">
    <section class="content-main">
        <div class="row">
            <div class="col-6">
                <div class="content-header">
                    <h2 class="content-title">Add New Product</h2>
                    <div>
                        <button class="btn btn-light rounded font-sm mr-5 text-body hover-up">Save to draft</button>
                        <button class="btn btn-md rounded font-sm hover-up">Publich</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <h6>1. General info</h6>
                            </div>
                            <div class="col-md-9">
                                <div class="mb-4">
                                    <label class="form-label">Product title</label>
                                    <input type="text" placeholder="Type here" class="form-control">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Description</label>
                                    <textarea placeholder="Type here" class="form-control" rows="4"></textarea>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">Brand name</label>
                                    <select class="form-select">
                                        <option> Adidas </option>
                                        <option> Nike </option>
                                        <option> Puma </option>
                                    </select>
                                </div>
                            </div> <!-- col.// -->
                        </div> <!-- row.// -->
                        <hr class="mb-4 mt-0">
                        <div class="row">
                            <div class="col-md-3">
                                <h6>2. Pricing</h6>
                            </div>
                            <div class="col-md-9">
                                <div class="mb-4">
                                    <label class="form-label">Cost in USD</label>
                                    <input type="text" placeholder="$00.0" class="form-control">
                                </div>
                            </div> <!-- col.// -->
                        </div> <!-- row.// -->
                        <hr class="mb-4 mt-0">
                        <div class="row">
                            <div class="col-md-3">
                                <h6>3. Media</h6>
                            </div>
                            <div class="col-md-9">
                                <div class="mb-4">
                                    <label class="form-label">Images</label>
                                    <input class="form-control" type="file">
                                </div>
                            </div> <!-- col.// -->
                        </div> <!-- .row end// -->
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section> <!-- content-main end// -->
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