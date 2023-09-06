<%-- 
    Document   : signup.jsp
    Created on : 28-Jul-2023, 5:54:22 pm
    Author     : gopal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String isLogin1 = (String)session.getAttribute("isLogin1");
    if(isLogin1=="Login Successfull...."){
        response.sendRedirect("index.jsp");
    }
    session.setAttribute("title", "Login");
    
%>

<html>
   <%@include file="common/head.jsp" %>
    <body>
       <%@include file="./common/header.jsp" %>
        <%@include file="./common/navbar.jsp" %>
        <div class="container p-5 box-shadow mt-3 mb-3 rounded-4 bg-dark-custom text-white">
            <form  role="form">
                <div class="row">
                    <div class="col-md-6 form-group">
                        <img src="./assets/img/login1.svg" alt="alt"/>
                        
                    </div>
                    <div class="col-md-6 form-group mt-3 mt-md-0">
                        <label class="fs-5 mb-2">Enter Email <span class="text-danger">*</span></label>
                        <input type="email" name="email" class="form-control mb-4" id="email" placeholder="Your Email" required autocomplete="off">
                        <label class="fs-5 mb-2">Enter Password <span class="text-danger">*</span></label>
                        <input type="password" class="form-control mb-4" name="password" id="password" placeholder="Your Password" required autocomplete="off">
                        <div class="text-center"><button type="button" onclick="loginUser()" class="custom-reg-btn pt-2 pb-2 ps-4 pe-4 rounded-5">Login</button></div>
                        <div class="text-center mt-3">Sign Up first <a href="signup.jsp" class="text-info">Sign Up</a> | or Go Home <a href="index.jsp" class="text-info">Home</a></div>
            
                    </div>
                </div>
            </form>
        </div>
        <%@include file="./common/footer.jsp" %>
        <script>
            function loginUser() {
                const email = document.getElementById("email").value;
                const password = document.getElementById("password").value;
                
                const data = {
                    email : email,
                    password : password
                };
                const formData = new URLSearchParams();
                for(const key in data){
                    formData.append(key,data[key]);
                };
                fetch('UserLoginServlet', {
                    method : 'POST',
                    headers : {
                        'Content-Type' : 'application/x-www-form-urlencoded'
                    },
                    body : formData.toString()
                    
                })
                .then(response => response.text())
                .then(data => {
                    Swal.fire({
                        title: data,
                        timer: 3000
                    }).then(result =>{
                            window.location.href = "profile.jsp";
                        });
                    
                }).catch(error => {
                    Swal.fire({
                        title: error,
                        timer: 3000
                    });
                });
            };
        </script>
        <%@include file="./common/commonjs.jsp" %>
    </body>
</html>
