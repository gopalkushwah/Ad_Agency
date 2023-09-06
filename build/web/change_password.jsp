<%-- 
    Document   : signup.jsp
    Created on : 28-Jul-2023, 5:54:22 pm
    Author     : gopal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//    String isLogin1 = (String)session.getAttribute("isLogin1");
//    System.out.println(isLogin1);
//    if(isLogin1!="Login Successfull...."){
//        response.sendRedirect("index.jsp");
//    }
    session.setAttribute("title", "Change Password");

%>

<html>
    <%@include file="common/head.jsp" %>
    <body>
        <%@include file="./common/header.jsp" %>
        <%@include file="./common/navbar.jsp" %>
        <div class="container p-5 box-shadow mt-3 mb-3 rounded-4 bg-dark-custom text-white">
            <form role="form">
                <div class="row">
                    <div class="col-md-6 form-group">
                        <img src="./assets/img/change_pass.svg" alt="alt"/>

                    </div>
                    <div class="col-md-6 form-group mt-3 mt-md-0">
                        <label class="fs-5 mb-2">Old Password <span class="text-danger">*</span></label>
                        <input type="password" name="oldpass" class="form-control mb-4" id="oldpass" placeholder="Your Old Password" required>
                        <label class="fs-5 mb-2">Enter Password <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;">Length >=8 and <= 25</span></label>
                        <input type="password" class="form-control mb-4" name="newpassword" id="newpassword" placeholder="New Password" required>
                        <label class="fs-5 mb-2">Confirm Password <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;">Length >=8 and <= 25</span></label>
                        <input type="password" class="form-control mb-4" name="newconfpassword" id="newconfpassword" placeholder="Confirm Password" required>

                        <div class="text-center"><button type="button" onclick="changePassword()" class="custom-reg-btn pt-2 pb-2 ps-4 pe-4 rounded-5">Change</button></div>
                        <div class="text-center mt-3">Update Profile <a href="profile.jsp" class="text-info">Update Profile</a> | or Go Home <a href="index.jsp" class="text-info">Home</a></div>

                    </div>
                </div>
            </form>
        </div>
        <script>
            function changePassword() {
                const oldpass = document.getElementById("oldpass").value;
                const newpassword = document.getElementById("newpassword").value;
                const newconfpassword = document.getElementById("newconfpassword").value;

                const passwordRegex = /^(?=.*[A-Z]{1})(?=.*[a-z]{1})(?=.*[!@#$%^&*()_+\-=\[\]{};':\"\\|,.<>\/?]{1})(?=.*\d{1}).{7,25}$/;
                if (passwordRegex.test(newpassword) && passwordRegex.test(newconfpassword)) {
                    console.log("first");
                    if (newpassword === newconfpassword) {
                    console.log("second");
                        const data = {
                            oldpass : oldpass,
                            newpassword: newpassword,
                            newconfpassword: newconfpassword
                        };
                        const formData = new URLSearchParams();
                        for (const key in data) {
                            formData.append(key, data[key]);
                        }
                        ;
                        fetch('UserChangePasswordServlet', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: formData.toString()
                        })
                                .then(response => response.text())
                                .then(data => {
                                    Swal.fire({
                                        icon: 'success',
                                        title: data,
                                        timer: 3000
                                    });
                                }).catch(error => {
                            Swal.fire({
                                icon: 'warning',
                                title: error,
                                timer: 3000
                            });
                        });
                    } else {
                        Swal.fire({
                            icon: 'warning',
                            title: "Passwords are not same...",
                            timer: 3000
                        });
                    }
                }else {
                        Swal.fire({
                            icon: 'warning',
                            title: "Password Must contains 2 (uppercase,lowercase,digit and spacial symbols)",
                            timer: 3000
                        });
                    }
            }
        </script>
        <%@include file="./common/footer.jsp" %>
        <%@include file="./common/commonjs.jsp" %>
    </body>
</html>
