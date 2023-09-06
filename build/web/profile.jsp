<%-- 
    Document   : signup.jsp
    Created on : 28-Jul-2023, 5:54:22 pm
    Author     : gopal
--%>
<%@page import="com.ramaasoft.Cookies.UserDefinedCookies"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ramaasoft.DBconnection.DBConnection"%>
<%@page import="com.ramaasoft.Entities.UserEntity"%>
<%
//    String isUserLogin = UserDefinedCookies.getNormalCookies("isUserLogin", request);
    String isUserLogin = (String)session.getAttribute("isLogin1");
//    System.out.println(isUserLogin);
    if(isUserLogin==null)
        response.sendRedirect("login.jsp");
    UserEntity user1 = (UserEntity) session.getAttribute("user");
    UserEntity user = UserDao.getUserById(user1.getId());
    session.setAttribute("title", "Update Profile");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="common/head.jsp" %>
    <body>
        <%@include file="./common/header.jsp" %>
        <%@include file="./common/navbar.jsp" %>
        <div class="container p-5 box-shadow mt-3 mb-3 rounded-4 bg-dark-custom text-white">
            <form action="UploadProfileServlet" method="post" role="form" enctype="multipart/form-data" class="mb-3">
                <div class="text-center">
                    <img src="./upload/<%= user.getProfile_image() %>" alt="profile" width="100px" height="100px" style="border-radius: 50%;" class="mb-2"/>
                    <br><label class="custom-reg-btn pt-2 pb-2 ps-4 pe-4 rounded-start-5" for="profile">Select Image</label>
                    <input type="file" hidden="true" accept="image/*" name="profile" id="profile">
                    <input type="submit" hidden="true" id="submitfile">
                    <label class="custom-reg-btn pt-2 pb-2 ps-2 pe-2 rounded-end-5" for="submitfile"><i class="fa-solid fa-right-to-bracket"></i></label>
                </div>
            </form>
            <form action="UserProfileUpdateServlet" method="post" role="form" >
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label class="fs-5">Enter Name <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;"><%= user.getName()%></span></label>
                        <input type="text" name="name" value="<%= user.getName()%>" class="form-control mb-4" id="name" placeholder="Your Name" required>
                        <label class="fs-5">Enter Email <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;"><%= user.getEmail()%></span></label>
                        <input type="email" name="email" value="<%= user.getEmail()%>" class="form-control mb-4" id="email" placeholder="Your Email" required>
                        <label class="fs-5">Enter Mobile <span class="text-danger">*</span> 
                            <span class="text-secondary" style="font-size: 14px;"><%= user.getMobile()%></span>
                        </label>
                        <input type="text" name="mobile" value="<%= user.getMobile()%>" class="form-control mb-4" id="mobile" placeholder="Your Mobile" required>
                        <label class="fs-5">Enter Area <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;"><%= user.getArea()%></span></label>
                        <input type="text" class="form-control mb-4" name="area" value="<%= user.getArea()%>" id="email" placeholder="Your Area" required>

                    </div>
                    <div class="col-md-6 form-group mt-3 mt-md-0">
                        <label class="fs-5">Enter City <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;"><%= user.getCity()%></span></label>
                        <input type="text" class="form-control mb-4" name="city" value="<%= user.getCity()%>" id="city" placeholder="Your City" required>
                        <label class="fs-5">Enter State <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;"><%= user.getState()%></span></label>
                        <input type="text" class="form-control mb-4" name="state" value="<%= user.getState()%>" id="state" placeholder="Your State" required>
                        <label class="fs-5">Enter address <span class="text-danger">*</span> <span class="text-secondary" style="font-size: 14px;"><%= user.getAddress()%></span></label>
                        <input type="text" name="address" value="<%= user.getAddress()%>" class="form-control" id="address" placeholder="Your Address" required>
                        <%
                            String isUpdate = (String)session.getAttribute("update");
                            if (isUpdate != null) {
                        %>
                        <div class="alert alert-danger" role="alert" style="padding-top: 6px;padding-bottom:6px; margin-top: 3.3rem">
                            <%= isUpdate%>
                        </div>
                        <%
                            }
                                session.removeAttribute("isUpdate");
                        %>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit"  class="custom-reg-btn pt-2 pb-2 ps-4 pe-4 rounded-5">Update Profile</button>
                    
                </div>
                <div class="text-center mt-3">
                    <a href="LogoutServlet" class="text-info">Logout</a> | <a href="change_password.jsp" class="text-info">Change Password</a>
                </div>
            </form>
        </div>
        <%@include file="./common/footer.jsp" %>
        <div id="preloader"></div>
        <%@include file="./common/commonjs.jsp" %>
    </body>
</html>
