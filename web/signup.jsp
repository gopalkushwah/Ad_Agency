<%-- 
    Document   : signup.jsp
    Created on : 28-Jul-2023, 5:54:22 pm
    Author     : gopal
--%>
<%
    String isLogin1 = (String) session.getAttribute("isLogin1");
    System.out.println(isLogin1);
    if (isLogin1 == "Login Successfull....") {
        response.sendRedirect("index.jsp");
    }
    session.setAttribute("title", "Sign Up - Get Started");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="common/head.jsp" %>
    <body>
        <%@include file="./common/header.jsp" %>
        <%@include file="./common/navbar.jsp" %>
        <div class="container p-5 box-shadow mt-3 mb-3 rounded-4 bg-dark-custom text-white">
            <form action="UserServlet" method="post" role="form">
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label class="fs-5">Enter Name <span class="text-danger">*</span> <span id="isName" class="text-secondary" style="font-size: 14px;"></span></label>
                        <input type="text" name="name" class="form-control mb-4" onkeydown="isFullNameRegex()" id="name" placeholder="Your Name" required>
                        <label class="fs-5">Enter Email <span class="text-danger">*</span> <span id="isEmail" class="text-secondary" style="font-size: 14px;"></span></label>
                        <input type="email" name="email" onkeydown="isEmailValid()" class="form-control mb-4" id="email" placeholder="Your Email" required>
                        <label class="fs-5">Enter Mobile <span class="text-danger">*</span> <span class="text-secondary" id="isMobile" style="font-size: 14px;"></span></label>
                        <input type="text" name="mobile" class="form-control mb-4" onkeydown="isMobileValid()" id="mobile" placeholder="Your Mobile" required>
                        <label class="fs-5">Enter Password <span class="text-danger">*</span> <span id="isPassword" class="text-secondary" style="font-size: 14px;"></span></label>
                        <input type="password" class="form-control mb-4" onkeydown="isPasswordValid()" name="password" id="password" placeholder="Your Password" required>
                        <label class="fs-5">Confirm Password <span class="text-danger">*</span> <span id="isConPassword" class="text-secondary" style="font-size: 14px;"></span></label>
                        <input type="password" class="form-control mb-4" onkeydown="isConfPasswordValid()" name="cpassword" id="cpassword" placeholder="Confirm Password" required>
                    </div>
                    <div class="col-md-6 form-group mt-3 mt-md-0">
                        <label class="fs-5">Enter Area <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mb-4" onkeydown="messageCount(4, 50, 'area')" name="area" id="area" placeholder="Your Area" required>
                        <label class="fs-5">Enter City <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mb-4" name="city" onkeydown="messageCount(4, 50, 'city')" id="city" placeholder="Your City" required>
                        <label class="fs-5">Enter State <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mb-4" name="state" onkeydown="messageCount(4, 50, 'state')" id="state" placeholder="Your State" required>
                        <label class="fs-5">Enter address <span class="text-danger">*</span></label>
                        <input type="text" name="address" class="form-control" onkeydown="messageCount(4, 250, 'address')"  id="address" placeholder="Your Address" required>
                    </div>
                </div>
                <div class="text-center"><button type="button" onclick="registerUser()" class="custom-reg-btn pt-2 pb-2 ps-4 pe-4 rounded-5">Sign Up</button></div>
                <div class="text-center mt-3">Already a User <a href="login.jsp" class="text-info">Login</a> | or Go Home <a href="index.jsp" class="text-info">Home</a></div>
            </form>
        </div>

        <%@include file="./common/footer.jsp" %>
        <script>
            function registerUser() {
                const name = document.getElementById("name");
                const email = document.getElementById("email");
                const mobile = document.getElementById("mobile");
                const password = document.getElementById("password");
                const cpassword = document.getElementById("cpassword");
                const area = document.getElementById("area");
                const city = document.getElementById("city");
                const state = document.getElementById("state");
                const address = document.getElementById("address");
                const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
                const mobileRegex = /[6-9]\d{9}$/;
                const passwordRegex = /^(?=.*[A-Z]{1})(?=.*[a-z]{1})(?=.*[!@#$%^&*()_+\-=\[\]{};':\"\\|,.<>\/?]{1})(?=.*\d{1}).{7,25}$/;
                if (mobileRegex.test(mobile.value)) {
                    console.log('mobile tested');
                    if (emailRegex.test(email.value)) {
                        console.log('email tested');
                        if (passwordRegex.test(password.value)) {
                            console.log('password r tested');
                            if (area.value.length > 5) {
                                if (city.value.length > 5) {
                                    if (address.value.length > 5) {
                                        if (state.value.length > 5) {
                                            const data = {
                                                name: name.value,
                                                email: email.value,
                                                mobile: mobile.value,
                                                password: password.value,
                                                area: area.value,
                                                city: city.value,
                                                state: state.value,
                                                address: address.value
                                            };
                                            const formData = new URLSearchParams();
                                            for (const key in data) {
                                                formData.append(key, data[key]);
                                            };
                                            fetch('UserServlet', {
                                                method: 'POST',
                                                headers: {
                                                    'Content-Type': 'application/x-www-form-urlencoded'
                                                },
                                                body: formData.toString()

                                            })
                                                    .then(response => response.text())
                                                    .then(data => {
                                                        Swal.fire({
                                                            title: data,
                                                            timer: 3000
                                                        }).then(result => {
                                                            window.location.href = "login.jsp";
                                                        });
                                                    }).catch(error => {
                                                Swal.fire({
                                                    title: error,
                                                    timer: 3000
                                                });
                                            });
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                };
        </script>
        <div id="preloader"></div>
        <%@include file="./common/commonjs.jsp" %>
    </body>
</html>
