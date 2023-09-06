<%--<%@page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" errorPage="pages-error-404.jsp" %>--%>
<!DOCTYPE html>
<%
    session.setAttribute("title", "Admin Signup - get changes");
%>
<html lang="en">
    <%@include file="admin_common/head.jsp" %>
    <body>
        <main>
            <div class="container">
                <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-12    col-md-12 d-flex flex-column align-items-center justify-content-center">

                                <div class="d-flex justify-content-center py-4">
                                    <a href="index.jsp" class="logo d-flex align-items-center w-auto">
                                        <img src="assets/img/logo.png" alt="">
                                        <span class="d-none d-lg-block">AdHeaven Admin</span>
                                    </a>
                                </div><!-- End Logo -->

                                <div class="card mb-3">

                                    <div class="card-body">

                                        <div class="pt-4 pb-2">
                                            <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                                            <p class="text-center small">Enter your personal details to create account</p>
                                        </div>
                                        <form id="AdminRegisterServlet">
                                            <div class="row">
                                                <div class="col-md-6 form-group">
                                                    <label class="fs-5">Enter Name <span class="text-danger">*</span></label>
                                                    <input type="text" name="name" class="form-control mb-4" id="name" placeholder="Your Name" required autocomplete="off">
                                                    <label class="fs-5">Enter Email <span class="text-danger">*</span></label>
                                                    <input type="email" name="email" class="form-control mb-4" id="email" placeholder="Your Email" required autocomplete="off">
                                                    <label class="fs-5">Enter Mobile <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;">Mobile Number length should be 10 and start with 6,7,8,9</span></label>
                                                    <input type="text" name="mobile" class="form-control mb-4" id="mobile" placeholder="Your Mobile" required autocomplete="off">
                                                    <label class="fs-5">Enter Username <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;">Username can have spacial character,digit and any alphabet</span></label>
                                                    <input type="text" name="username" class="form-control mb-4" id="username" placeholder="Your Username" required autocomplete="off">
                                                </div>
                                                <div class="col-md-6 form-group mt-md-0">
                                                    <label class="fs-5">Enter Password <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;">Password must have 2 Uppercase , 2 Lowercase and 2 digit and  Length >=8 and <= 25</span></label>
                                                    <input type="password" class="form-control mb-3" name="password" id="password" placeholder="Your Password" required autocomplete="off">
                                                    <label class="fs-5">Confirm Password <span class="text-danger">*</span></label>
                                                    <input type="password" class="form-control mb-3" name="cpassword" id="cpassword" placeholder="Confirm Password" required autocomplete="off">
                                                    <label class="fs-5">Your Role <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control mb-3" name="role" id="role" placeholder="Your Role" required autocomplete="off" value="Admin"  readonly>
                                                    <label class="fs-5">Enter Company Name <span class="text-danger">*</span></label>
                                                    <input type="text" name="companyname" class="form-control mb-3" id="companyname" placeholder="Your Company Name" required autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="text-center"><button type="button" onclick="registerAdmin()"  class="custom-reg-btn pt-2 pb-2 ps-4 pe-4 rounded-5">Sign Up</button></div>
                                            <div class="text-center mt-3">Already a User <a href="pages-login.jsp" class="text-primary">Login</a> | or Go Home <a href="index.jsp" class="text-primary">Home</a></div>
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
        <!--js files-->
        <script>
            function registerAdmin() {
                const username = document.getElementById("username").value;
                const name = document.getElementById("name").value;
                const password = document.getElementById("password").value;
                const cpassword = document.getElementById("cpassword").value;
                const role = document.getElementById("role").value;
                const mobile = document.getElementById("mobile").value;
                const email = document.getElementById("email").value;
                const companyname = document.getElementById("companyname").value;

                const data = {
                    username : username,
                    name : name,
                    password : password,
                    cpassword : cpassword,
                    role : role,
                    mobile : mobile,
                    email : email,
                    companyname : companyname
                };
                
                const formData = new URLSearchParams();
                for (const key in data) {
                    formData.append(key, data[key]);
                }
                
                fetch("../AdminRegisterServlet", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: formData.toString()
                })
                .then(response => response.text())
                .then(data => {
                    Swal.fire({
                        title: data,
                        timer: 3000
                    });
                })
                .catch(error => {
                    console.error("Error inserting data:", error);
                });
            }
        </script>
        <%@include file="./admin_common/commonjs.jsp" %>
        <!--js files-->
    </body>
</html>