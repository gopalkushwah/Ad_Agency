<%--<%@page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" errorPage="pages-error-404.jsp" %>--%>
<%@page import="com.ramaasoft.Entities.AdminEntity"%>
<%@page import="com.ramaasoft.Cookies.UserDefinedCookies"%>
<!DOCTYPE html>
<%
    session.setAttribute("title", "Admin Login");
    String isAdminLogin = (String)UserDefinedCookies.getNormalCookies("isAdminLogin", request);
    System.out.println(isAdminLogin);
//    if(isAdminLogin!="Login Successfull....")
//        response.sendRedirect("index.jsp");
%>
<html lang="en">
    <%@include file="admin_common/head.jsp" %>
<body>
        <main>
            <div class="container">
                <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">
                                <div class="d-flex justify-content-center py-4">
                                    <a href="index.jsp" class="logo d-flex align-items-center w-auto">
                                        <img src="assets/img/logo.png" alt="">
                                        <span class="d-none d-lg-block">AdHeaven Admin</span>
                                    </a>
                                </div><!-- End Logo -->
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="pt-4 pb-2">
                                            <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                            <p class="text-center small">Enter your email & password to login</p>
                                        </div>
                                        <form id="adminLogin">
                                            <div class="row">
                                                <div class="col-md-6 form-group">
                                                    <img src="./assets/img/login1.svg" alt="alt" class="img-fluid"/>
                                                </div>
                                                <div class="col-md-6 form-group mt-3 mt-md-0">
                                                    <label class="fs-5 mb-2">Enter Email <span class="text-danger">*</span></label>
                                                    <input type="email" name="email" class="form-control mb-4" id="email" placeholder="Your Email" required>
                                                    <label class="fs-5 mb-2">Enter Password <span class="text-danger">*</span></label>
                                                    <input type="password" class="form-control mb-4" name="password" id="password" placeholder="Your Password" required>
                                                    <div class="text-center"><button type="button" onclick="adminLogin()" class="custom-reg-btn pt-2 pb-2 ps-4 pe-4 rounded-5">Login</button></div>
                                                    <div class="text-center mt-3">Sign Up first <a href="signup.jsp" class="text-info">Sign Up</a> | or Go Home <a href="index.jsp" class="text-info">Home</a></div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main><!-- End #main -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <script>
            function adminLogin(){
                const email = document.getElementById("email").value;
                const password = document.getElementById("password").value;
                console.log("clicked");
                fetch("../AdminLoginServlet",{
                    method : "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: "email=" + encodeURIComponent(email) + "&password=" + encodeURIComponent(password)
                })
                .then(response => response.text())
                .then(data => {
                    if(data=="Login Successfull...."){
                        Swal.fire({
                            title: data,
                            timer: 3000
                        }).then(result =>{
                            window.location.href = "index.jsp"
                        });
                    }else{
                        Swal.fire({
                            title: data,
                            timer: 3000
                        })
                    }
                })
                .catch(error => {
                    Swal.fire({
                        title: "Error Login "+ error,
                        timer: 3000
                    });
                });
            }
        </script>
        <%@include file="admin_common/commonjs.jsp" %>
    </body>
</html>