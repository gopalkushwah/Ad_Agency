<%@page import="com.ramaasoft.dao.AdBuyerDao"%>
<%@page import="com.ramaasoft.Entities.AdBuyerEntity"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String isAdminLogin1 = UserDefinedCookies.getNormalCookies("isAdminLogin", request);
    if(isAdminLogin1==null)
        response.sendRedirect("pages-login.jsp");
    AdminEntity admin = UserDefinedCookies.getAdminCookies(request, "adminLogin");
    List<AdBuyerEntity> adBuyerList = AdBuyerDao.getAllAdBookingBySellerId(admin.getAdmin_id());
%>
<html>
    <%@include file="admin_common/head.jsp" %>
    <body>
        <!-- ======= Header ======= -->
        <%@include file="./admin_common/navbar.jsp" %>
        <!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <%@include file="./admin_common/sidebar.jsp" %>
        <!-- End Sidebar-->

        <main id="main" class="main">
            <div class="pagetitle">
                <h1>Your costumers</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active">Your costumers</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-12">
                        <div class="card recent-sales overflow-auto">
                            <div class="card-body">
                                <h5 class="card-title">All Costumers</h5>
                                <table class="table table-borderless datatable">
                                    <thead>
                                        <tr class="border-bottom">
                                            <th scope="col">Id</th>
                                            <th scope="col">Costumer Id</th>
                                            <th scope="col">Costumer Name</th>
                                            <th scope="col">Email </th>
                                            <th scope="col">Phone Number</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Product Id</th>
                                            <th scope="col">Booking Date</th>
                                            <th scope="col">Is Cancelled</th>
                                            <th scope="col">Start Date</th>
                                            <th scope="col">End Date</th>
                                            <th scope="col">Last Update</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (AdBuyerEntity adBuyer : adBuyerList) {%>
                                        <tr class="border-bottom">
                                            <th scope="row" class="text-primary"><%= adBuyer.getBooking_id()%></th>
                                            <td><%= adBuyer.getBuyer_id()%></td>
                                            <td><%= adBuyer.getFull_name()%></td>
                                            <td><%= adBuyer.getEmail()%></td>
                                            <td><%= adBuyer.getPhone_number()%></td>
                                            <%if (adBuyer.getStatus().equals("confirmed")) {%>
                                            <td class="badge bg-success text-white"><%= adBuyer.getStatus()%></td>
                                            <%} else if (adBuyer.getStatus().equals("pending")) {%>
                                            <td class="badge bg-warning text-dark"><%= adBuyer.getStatus()%></td>
                                            <%} else {%>
                                            <td class="badge bg-danger text-white"><%= adBuyer.getStatus()%></td>
                                            <%}%>


                                            <td><%= adBuyer.getProduct_id()%></td>
                                            <td><%= adBuyer.getBooking_date()%></td>
                                            <%if (!adBuyer.getIsBooked().equals("cancelled")) {%>
                                            <td class="badge bg-success text-white"><%= adBuyer.getIsBooked()%></td>
                                            <%} else {%>
                                            <td class="badge bg-danger text-white"><%= adBuyer.getIsBooked()%></td>
                                            <%}%>

                                            <td><%= adBuyer.getStart_date()%></td>
                                            <td><%= adBuyer.getEnd_date()%></td>
                                            <td><%= adBuyer.getUpdated_at()%></td>

                                            <td><button onclick="bookingStatus(<%= adBuyer.getBooking_id()%>,'reviewing')" class="btn btn-sm btn-outline-success" data-bs-toggle="tooltip" data-bs-placement="left" title="Reviewing"><i class="bi bi-clock"></i></button></td>
                                            <td><button onclick="bookingStatus(<%= adBuyer.getBooking_id()%>,'confirmed')" class="btn btn-sm btn-outline-success" data-bs-toggle="tooltip" data-bs-placement="left" title="Confirm Booking"><i class="bi bi-check-lg"></i></button></td>
                                            <td><button onclick="bookingStatus(<%= adBuyer.getBooking_id()%>,'rejected')" class="btn btn-sm btn-outline-danger" data-bs-toggle="tooltip" data-bs-placement="left" title="Reject and Delete"><i class="bi bi-trash"></i></button></td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- End Recent Sales -->
                </div>
            </section>
        </main><!-- End #main -->
        <!-- ======= Footer ======= -->
        <%@include file="./admin_common/footer.jsp" %>
        <!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <script>
            function bookingStatus(bookingid, status) {
                const data = {
                    bookingid : bookingid,
                    status : status
                };
                const formData = new URLSearchParams();
                for (const key in data) {
                    formData.append(key, data[key]);
                }
                ;
                fetch('../BookingStatus', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: formData.toString()
                }).then(response => response.text())
                        .then(data => {
                            Swal.fire({
                                icon: 'success',
                                title: data,
                                timer: 3000
                            }).then(result =>{
                                window.location.href = 'show-bookings.jsp';
                            });
                        }).catch(error =>{
                            Swal.fire({
                                icon: 'warning',
                                title: error,
                                timer: 3000
                            });
                        });
            };
        </script>
        <script>
            function adminAdInsert() {
                const ad_title = document.getElementById("ad_title").value;
                const ad_description = document.getElementById("ad_description").value;
                const ad_budget = document.getElementById("ad_budget").value;
                const ad_platform = document.getElementById("ad_platform").value;
                const ad_type = document.getElementById("ad_type").value;
                const ad_format = document.getElementById("ad_format").value;
                const data = {
                    ad_title: ad_title,
                    ad_description: ad_description,
                    ad_budget: ad_budget,
                    ad_platform: ad_platform,
                    ad_type: ad_type,
                    ad_format: ad_format,
                };
                const formData = new URLSearchParams();
                for (const key in data) {
                    formData.append(key, data[key]);
                }
                ;
                if (ad_type === "Choose ad type" || ad_format === "Choose Ad Format") {
                    Swal.fire({
                        position: 'top',
                        icon: 'error',
                        title: "Please choose anyone from others",
                        confirmButtonColor: '#ff0000',
                        timer: 3000
                    });
                } else {
                    fetch("../InsertAdsServlet", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/x-www-form-urlencoded"
                        },
                        body: formData.toString()
                    })
                            .then(response => response.text())
                            .then(data => {
                                Swal.fire({
                                    position: 'top',
                                    title: data,
                                    timer: 3000
                                });
                            }).catch(error => {
                        Swal.fire({
                            position: 'top',
                            icon: 'error',
                            title: error,
                            confirmButtonColor: '#ff0000',
                            timer: 3000
                        });
                    });
                }
            }
        </script>
        <!--js files-->
        <%@include file="./admin_common/commonjs.jsp" %>
        <!--js files-->

    </body>

</html>