<%-- 
    Document   : coverageArea
    Created on : 13 Jan 2025, 11:37:03 pm
    Author     : M S I
--%>

<%@page import="com.DAO.customerDAO"%>
<%@page import="com.Model.CoverageArea"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    //HttpSession session = request.getSession(false); // Use an existing session
    if (session == null || session.getAttribute("staffName") == null || session.getAttribute("role") == null) {
        // Redirect to login page if session is invalid
        response.sendRedirect("staff_login.jsp");
        return;
    }
    String staffName = (String) session.getAttribute("staffName");
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add coverage</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bootstrap 4 -->
        <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/adminlte.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">

    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">

            <!-- Preloader -->
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
            </div>

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="NewOrderCountServlet" class="nav-link">Home</a>
                    </li>
                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">

                    <li class="nav-item">
                        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                            <i class="fas fa-expand-arrows-alt"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutStaffServlet" role="logout">
                            <i class="fas fa-sign-out-alt"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="manager_dashboard.jsp" class="brand-link">
                    <img src="dist/img/background/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">Coin Laundry</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="info">
                            <a href="staff_profile.jsp" class="d-block">
                                <%= staffName%></a>
                            <span class="d-block" style="color:lightslategrey"><%= role%></span>
                            <!-- nama di dashboard -->
                        </div>
                    </div>

                    <!-- SidebarSearch Form -->
                    <div class="form-inline">
                        <div class="input-group" data-widget="sidebar-search">
                            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-sidebar">
                                    <i class="fas fa-search fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
                                 with font-awesome or any other icon font library -->
                            <li class="nav-item">
                                <a href="NewOrderCountServlet" class="nav-link">
                                    <i class="nav-icon fas fa-home"></i>
                                    <p>
                                        Home
                                    </p>
                                </a>
                            </li>


                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-copy"></i>
                                    <p>
                                        Registration
                                        <i class="fas fa-angle-left right"></i>
                                        <span class="badge badge-info right">2</span>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="staff_register.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Employee Registration</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="listCustomer.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Customer list</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="managePackage.jsp" class="nav-link">
                                    <i class="nav-icon fas fa-th"></i>
                                    <p>
                                        Laundry Package
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="coverageArea.jsp" class="nav-link">
                                    <i class="nav-icon fa fa-location-arrow"></i>
                                    <p>
                                        Coverage Area
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item"> 
                                <a href="view_reports.jsp" class="nav-link">
                                    <i class="nav-icon ion-stats-bars"></i>
                                    <p>
                                        Reports                                       
                                    </p>
                                </a>
                            </li>

                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0">Coverage Area</h1>
                            </div><!-- /.col -->        
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->


                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- left column -->
                            <div class="col-md-8">
                                <!-- Horizontal Form -->
                                <div class="card card-warning">
                                    <div class="card-header">
                                        <h3 class="card-title">Add New Coverage Area Form</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form class="form-horizontal" action="SaveCoverageAreaServlet" method="post">
                                        <div class="card-body">
                                            <div class="form-group row">
                                                <label for="staffName" class="col-sm-2 col-form-label">Postal Code</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="postal_code" name="postal_code" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="staffPhone" class="col-sm-2 col-form-label">Area Name</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="area_name" name="area_name" placeholder="">
                                                </div>
                                            </div>
                                            <!-- /.card-body -->
                                            <div class="card-footer">
                                                <button type="submit" class="btn btn-info" style="background-color: #00ab66">Save</button>
                                                <button type="reset" class="btn btn-default float-right" style="background-color: red; color: white;">Cancel</button>
                                            </div>
                                            <!-- /.card-footer -->
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.card -->

                            <%
                                String message = (String) request.getAttribute("message");
                                if (message != null) {
                            %>
                            <script>
                                alert("<%= message%>");
                            </script>
                            <%
                                }
                            %>


                            <!-- /.row -->

                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">List of Coverage Area</h3>

                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body table-responsive p-0">
                                        <table class="table table-hover text-nowrap">
                                            <%
                                                List<CoverageArea> list = customerDAO.getAllCoverageArea();
                                            %>
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Postal Code</th>
                                                    <th>Area Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (CoverageArea e : list) {
                                                        //out.print("<tr><td>" + e.getStaff_Id() + "</td><td>" + e.getStaff_Name() + "</td><td>" + e.getStaff_Phone() + "</td><td>" + e.getStaff_Email() + "</td><td>" + e.getStaff_Password() + "</td><td>" + e.getRole() + "</td>");
                                                        out.print("<tr><td>" + e.getId() + "</td><td>" + e.getPostal_code() + "</td><td>" + e.getArea_name());
                                                        out.print("<td class='project-actions'>"
                                                                + "<a class='btn btn-info btn-sm' href='EditCoverageAreaServlet?Id=" + e.getId() + "'>"
                                                                + "<i class='fas fa-pencil-alt'></i> Edit"
                                                                + "</a> "
                                                                + "<a class='btn btn-danger btn-sm' href='DeleteCoverageAreaServlet?Id=" + e.getId() + "'>"
                                                                + "<i class='fas fa-trash'></i> Delete"
                                                                + "</a>"
                                                                + "</td>");
                                                    }
                                                %>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>

                        </div>

                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </section>               
            </div>


            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
            All rights reserved.
            <div class="float-right d-none d-sm-inline-block">
                <b>Version</b> 3.2.0
            </div>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
                                $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- ChartJS -->
    <script src="plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="plugins/sparklines/sparkline.js"></script>
    <!-- JQVMap -->
    <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="plugins/moment/moment.min.js"></script>
    <script src="plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.js"></script>
</body>
</html>
