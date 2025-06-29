<%-- 
    Document   : newPassword
    Created on : 3 Jan 2025, 2:29:04 pm
    Author     : M S I
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset Password</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome;
            }

            .custom-control-label::before {
                /*background-color:#f3f3e3;*/
                background-color:#a03939;
                border: #dee2e6;
            }

            /* Custom background color */
            body {
                background-color: whitesmoke; /* Custom background color */
            }
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <div>
            <!-- Container containing all contents -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <!-- White Container -->
                        <div class="container bg-white rounded mt-2 mb-2 px-0">
                            <!-- Main Heading -->
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1><strong>Reset Password</strong></h1>
                            </div>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="NewPasswordServlet" method="POST">
                                    <!-- New Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <!--input type="password" name="password" placeholder="&#xf084; &nbsp; New Password" class="form-control border-info placeicon"-->
                                            <input 
                                                type="password"                    
                                                name="password" 
                                                placeholder="&#xf084; &nbsp; New Password" 
                                                class="form-control border-info placeicon"
                                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}" 
                                                title="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character."
                                                required
                                                > 
                                        </div>
                                    </div>
                                    <!-- Confirm New Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <!--input type="password" name="confPassword" placeholder="&#xf084; &nbsp; Confirm New Password" class="form-control border-info placeicon"-->
                                            <input 
                                                type="password"                    
                                                name="confPassword" 
                                                placeholder="&#xf084; &nbsp; Confirm New Password" 
                                                class="form-control border-info placeicon"
                                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}" 
                                                title="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character."
                                                required
                                                > 
                                        </div>
                                    </div>
                                    <!-- Reset Button -->
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <input type="submit" value="Reset" class="btn btn-block btn-info">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Alternative Login -->
                            <div class="mx-0 px-0 bg-light">
                                <!-- Horizontal Line -->
                                <div class="px-4 pt-5">
                                    <hr>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
    </body>
</html>
