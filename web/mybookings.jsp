<%-- 
    Document   : mybookings
    Created on : 13-Aug-2023, 9:51:22 pm
    Author     : gopal
--%>

<%@page import="com.ramaasoft.dao.AdsDao"%>
<%@page import="com.ramaasoft.Entities.AdsEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ramaasoft.Cookies.UserDefinedCookies"%>
<%@page import="com.ramaasoft.dao.AdBuyerDao"%>
<%@page import="com.ramaasoft.Entities.AdBuyerEntity"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String isUserLogin = (String)session.getAttribute("isLogin1");
    if(isUserLogin==null)
        response.sendRedirect("login.jsp");
    UserEntity user = UserDefinedCookies.getUserCookies(request, "userdata");
    List<AdBuyerEntity> adBuyerList = AdBuyerDao.getAllAdBookingByBuyerId(user.getId());
%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="common/head.jsp" %>
    <body>

        <!-- ======= Start Header ======= -->
        <%@include file="./common/header.jsp" %>
        <!-- ======= End Header ======= -->

        <!-- Navbar -->
        <%@include file="./common/navbar.jsp" %>
        <!-- Navbar -->

        <main id="main">
            <!-- ======= Breadcrumbs ======= -->
            <div class="breadcrumbs">
                <% if (adBuyerList.isEmpty()) {%>
                <div class="page-header d-flex align-items-center border-bottom" style="background-image: url('');">
                    <div class="container position-relative">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-6 text-center">
                                <h2>Book Something to See Here</h2>
                                <p>You can Book ads as per your business demand . our experts will help you</p>
                            </div>
                        </div>
                    </div>
                </div>
                <%} else {%>
                <nav>
                    <div class="container">
                        <ol>
                            <li><a href="index.html">Home</a></li>
                            <li>Your Bookings</li>
                        </ol>
                    </div>
                </nav>
            </div><!-- End Breadcrumbs -->

            <section id="blog" class="blog">
                <div class="container" data-aos="fade-up">

                    <div class="row gy-4 posts-list">
                        <%
                            for (AdBuyerEntity adBuyer : adBuyerList) {
                                AdsEntity ads = AdsDao.getAllAdsByAdsId(adBuyer.getProduct_id());
                                if (ads.getAd_id() != 0) {
                        %>

                        <div class="col-xl-12 col-md-12 ">
                            <div class="card  my-box-shadow-1 bg-dark text-white">
                                <div class="row  card-header">
                                    <div class="col-xl-6 col-md-6">
                                        <h5>Title : <%= ads.getAd_title()%></h5>
                                    </div>
                                    <div class="col-xl-6 col-md-6">
                                        <%if(!adBuyer.getIsBooked().equals("cancelled")){%>
                                            <h5>Status : <span class="text-info"><%= adBuyer.getStatus().toUpperCase()%></span></h5>
                                        <%}else{%>
                                            <h5>Status : <span class="text-info"><%= adBuyer.getIsBooked().toUpperCase() %></span></h5>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="row card-body">
                                    <div class="col-xl-6 col-md-6">
                                        <h5 class="card-title"><i class="bi bi-arrow-right"></i> <%= ads.getAd_title()%></h5>
                                        <p class="card-text"><i class="bi bi-arrow-right"></i> <%= ads.getAd_description()%></p>
                                        <p class="card-text"><i class="bi bi-arrow-right"></i> Company Name : <%= adBuyer.getCompany_name()%></p>
                                    </div>
                                    <div class="col-xl-6 col-md-6">
                                        <p class="card-title"><i class="bi bi-arrow-right"></i> Start Date : <%= adBuyer.getStart_date()%></p>
                                        <p class="card-title"><i class="bi bi-arrow-right"></i> End Date : <%= adBuyer.getEnd_date()%></p>
                                        <p class="card-text"><i class="bi bi-arrow-right"></i> Cost / month : <%= ads.getAd_budget()%></p>
                                    </div>
                                     <%if((!adBuyer.getStatus().equals("confirmed")) || adBuyer.getIsBooked().equals("cancelled")){%>
                                        <%if(!adBuyer.getIsBooked().equals("cancelled")){%>
                                           <div class="text-center mt-2"> 
                                                   <button onclick="cancelBooking(<%= adBuyer.getBooking_id() %>)" class="btn btn-outline-danger" data-bs-toggle="tooltip" data-bs-placement="top" title="Cancel Booking"><i class="fa-solid fa-person-circle-xmark fa-xl"></i></button>
                                           </div>
                                       <%}else{%>
                                        <div class="text-center mt-2"> 
                                            <h4 class="text-danger">This order has been cancelled by you</h4>
                                        </div>
                                       <%}%>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <%} else {%>
                        <div class="col-xl-12 col-md-12 ">
                            <div class="card  my-box-shadow-1 bg-dark text-white">
                                <div class="row  card-header">
                                    <div class="col-xl-6 col-md-6">
                                        <h5>Sorry! <span class="text-danger">This product has been removed by seller</span> </h5>
                                    </div>
                                    <div class="col-xl-6 col-md-6">
                                        <h5>Product id : <%= adBuyer.getProduct_id()%></h5>
                                    </div>
                                </div> 
                                <div class="row card-body">
                                    <div class="col-xl-12 col-md-12">
                                        <h5 class="card-title"><i class="bi bi-arrow-right"></i> <%= adBuyer.getAd_title() %></h5>
                                        <p class="card-text"><i class="bi bi-arrow-right"></i> <%= adBuyer.getAd_description()%></p>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <%}}%>
                    </div><!-- End blog posts list -->
                </div>
            </section><!-- End Blog Section -->
            <%}%>
        </main>

        <!-- ======= Footer ======= -->
        <%@include file="common/footer.jsp" %>
        <!-- End Footer -->
        <!-- End Footer -->
        
        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <div id="preloader"></div>
        <script>
            function cancelBooking(bookingid){
                const data = {
                    bookingid : bookingid
                };
                const formData = new URLSearchParams();
                for(const key in data){
                  formData.append(key,data[key]);  
                };
                fetch('CancelBooking',{
                     method : 'POST',
                     headers : {
                         'Content-Type' : 'application/x-www-form-urlencoded'
                     },
                     body : formData.toString()
                }).then(response => response.text())
                        .then(data =>{
                            Swal.fire({
                                icon : 'success',
                                title : data,
                                timer : 3000              
                            }).then((result) => {
                                window.location.href = 'mybookings.jsp'
                            });
                }).catch(error =>{
                    Swal.fire({
                                icon : 'warning',
                                title : error,
                                timer : 3000               
                            });
                });
            };
        </script>
        <%@include file="./common/commonjs.jsp" %>

    </body>

</html>