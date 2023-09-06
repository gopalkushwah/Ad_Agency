<%@page import="com.ramaasoft.dao.AdminDao"%>
<%@page import="com.ramaasoft.Entities.AdminEntity"%>
<%@page import="com.ramaasoft.dao.AdsDao"%>
<%@page import="com.ramaasoft.Entities.AdsEntity"%>
<!DOCTYPE html>
<%
    session.setAttribute("title", "Blog Details");
    String isLogin1 = (String) session.getAttribute("isLogin1");
    if (isLogin1 == null) {
        response.sendRedirect("login.jsp");
    }

    int adsId = Integer.parseInt(request.getParameter("adsid"));
    AdsEntity ads = AdsDao.getAllAdsByAdsId(adsId);
    AdminEntity admin = AdminDao.getAdminByAdminId(ads.getSeller_id());
    UserEntity user = new UserEntity();
    if (isLogin1 != null)
        user = (UserEntity) session.getAttribute("user");
%>
<html lang="en">
    <%@include file="common/head.jsp" %>

    <body>

        <!-- ======= Start Header ======= -->
        <%@include file="common/header.jsp" %>
        <!-- ======= End Header ======= -->
        <!-- End Header -->
        <!-- Navbar -->
        <%@include file="./common/navbar.jsp" %>
        <!-- Navbar -->

        <!-- End Header -->

        <main id="main">

            <!-- ======= Breadcrumbs ======= -->
            <div class="breadcrumbs">
                <div class="page-header d-flex align-items-center" style="background-image: url('');">
                    <div class="container position-relative">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-6 text-center">
                                <h2><%= ads.getAd_title()%></h2>
                                <p><%= ads.getAd_description()%></p>
                            </div>
                        </div>
                    </div>
                </div>
                <nav>
                    <div class="container">
                        <ol>
                            <li><a href="index.html">Home</a></li>
                            <li>Ads Details</li>
                        </ol>
                    </div>
                </nav>
            </div><!-- End Breadcrumbs -->
            <!-- ======= Blog Details Section ======= -->
            <section id="blog" class="blog">
                <div class="container" data-aos="fade-up">
                    <div class="row g-5">
                        <div class="col-lg-7">
                            <article class="blog-details">
                                <div class="post-img">
                                    <img src="./adsuploads/<%= ads.getAds_image()%>" alt="" class="img-fluid">
                                </div>
                                <h2 class="title"><%= ads.getAd_title()%></h2>
                                <div class="meta-top">
                                    <ul>
                                        <li class="d-flex align-items-center"><i class="bi bi-person"></i> <%= admin.getFull_name()%></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-clock"></i><time datetime="2020-01-01"><%= ads.getAd_creation_date().toString()%></time></li>
                                    </ul>
                                </div><!-- End meta top -->

                            </article><!-- End blog post -->
                        </div>
                        <div class="col-lg-5">
                            <div class="sidebar">
                                <div class="sidebar-item categories">
                                    <table class="table">
                                        <h3 class="sidebar-title border-bottom">Details</h3>
                                        <thead>
                                            <tr>
                                                <th scope="col">Field</th>
                                                <th scope="col">Value</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Ad Title</td>
                                                <td><%= ads.getAd_title()%></td>
                                            </tr>
                                            <tr>
                                                <td>Ad Type</td>
                                                <td><%= ads.getAd_type()%></td>
                                            </tr>
                                            <tr>
                                                <td>Ad Cost</td>
                                                <td><%= ads.getAd_budget()%> <span style="font-size: 15px" class="text-secondary">for 1 month</span></td>
                                            </tr>
                                            <tr>
                                                <td>Provider Company</td>
                                                <td><%= admin.getCompanyname()%></td>
                                            </tr>
                                            <tr>
                                                <td>Owner Name</td>
                                                <td><%= admin.getFull_name()%></td>
                                            </tr>
                                            <tr>
                                                <td>Ad Status</td>
                                                <%if (ads.getAd_status().equals("Active")) {%>
                                                <td>Available</td>
                                                <%} else {%>
                                                <td class="text-danger"><%= ads.getAd_status()%></td>
                                                <%}%>
                                            </tr>
                                            <tr>
                                                <td>Send Mail to Seller</td>
                                                <td>
                                                    <a href="mailto:<%= admin.getEmail()%>" class="btn btn-primary">Send Mail</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Make Call to Seller</td>
                                                <td>
                                                    <a href="tel:+91 <%= admin.getMobile()%>" class="btn btn-primary">Make call</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div><!-- End sidebar categories-->
                            </div><!-- End Blog Sidebar -->
                        </div>
                    </div>
                </div>
            </section><!-- End Blog Details Section -->
            <section class="container mb-3 blog bg-dark-custom" id="blog">
                <h1 class="card-title text-center text-white">Buy This Ads</h1>
                <div class="col-lg-12 blog-details">
                    <div class="card">
                        <div class="card-body">
                            <form>
                                <div class="row mb-3">
                                    <label for="fullname" class="col-sm-2 col-form-label">Your Name</label>
                                    <div class="col-sm-10">
                                        <input type="text"  value="<%= user.getName()%>"  class="form-control my-box-shadow" id="fullname" required autocomplete="off">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="email" class="col-sm-2 col-form-label">Your Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" value="<%= user.getEmail()%>" class="form-control my-box-shadow" id="email" required autocomplete="off">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="buyerid" class="col-sm-2 col-form-label">Your Id</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="<%= user.getId()%>" class="form-control my-box-shadow" id="buyerid" required autocomplete="off">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="phone" class="col-sm-2 col-form-label">Your Phone</label>
                                    <div class="col-sm-10">
                                        <input type="tel" value="<%= user.getMobile()%>" class="form-control my-box-shadow" id="phone" required autocomplete="off">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="companyname" class="col-sm-2 col-form-label">Company Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="<%= admin.getCompanyname()%>" class="form-control my-box-shadow" id="companyname" required autocomplete="off" readonly>
                                    </div>
                                </div>
                                <div class="row mb-3" hidden>
                                    <label for="adid" class="col-sm-2 col-form-label">Ads id</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="<%= ads.getAd_id()%>" class="form-control my-box-shadow" id="adid" required autocomplete="off" readonly>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="startdate" class="col-sm-2 col-form-label">Start Date</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control my-box-shadow" id="startdate" required autocomplete="off">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="enddate" class="col-sm-2 col-form-label">End Date</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control my-box-shadow" id="enddate" required autocomplete="off">
                                    </div>
                                </div>
                                <div class="row mb-3" hidden>
                                    <label for="sellerid" class="col-sm-2 col-form-label">Seller Id</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="<%= ads.getSeller_id()%>"  class="form-control my-box-shadow" id="sellerid" required autocomplete="off" readonly>
                                    </div>
                                </div>
                                <div class="row mb-3" hidden="true">
                                    <label for="selleremail" class="col-sm-2 col-form-label">Seller Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" value="<%= admin.getEmail()%>" class="form-control my-box-shadow" id="selleremail" required autocomplete="off" readonly>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="password" class="col-sm-2 col-form-label">Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control my-box-shadow" id="password" required autocomplete="off" placeholder="Enter your login password to confirm">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-10 offset-sm-2">
                                        <div class="form-check">
                                            <input class="form-check-input my-box-shadow" type="checkbox" id="confirmBooking">
                                            <label class="form-check-label " for="confirmBooking">
                                                Confirm Booking
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button type="button" onclick="bookAd()" class="btn btn-primary">Submit</button>
                                    <button type="reset" class="btn btn-secondary">Reset</button>
                                </div>
                            </form><!-- End Horizontal Form -->

                        </div>
                    </div>

                </div>
            </section>
        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <%@include file="common/footer.jsp" %>
        <!-- End Footer -->

        <!-- End Footer -->
        <script>
            function bookAd() {
                const full_name = document.getElementById("fullname");
                const email = document.getElementById("email");
                const phone_number = document.getElementById("phone");
                const buyer_id = document.getElementById("buyerid");
                const company_name = document.getElementById("companyname");
                const product_id = document.getElementById("adid");
                const start_date = document.getElementById("startdate");
                const end_date = document.getElementById("enddate");
                const seller_id = document.getElementById("sellerid");
                const seller_email = document.getElementById("selleremail");
                const password = document.getElementById("password");
                const confirmBooking = document.getElementById("confirmBooking").checked;
                if (confirmBooking) {
                    if (start_date.value < end_date.value) {
                        const data = {
                            full_name: full_name.value,
                            email: email.value,
                            phone_number: phone_number.value,
                            buyer_id: buyer_id.value,
                            company_name: company_name.value,
                            product_id: product_id.value,
                            start_date: start_date.value,
                            end_date: end_date.value,
                            seller_id: seller_id.value,
                            seller_email: seller_email.value,
                            password: password.value
                        };
                        const formData = new URLSearchParams();
                        for (const key in data) {
                            formData.append(key, data[key]);
                        }
                        ;
                        fetch('BookAdsServlet', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: formData.toString()
                        }).then(response => response.text())
                                .then(data => {
                                    Swal.fire({
                                        title: data,
                                        timer: 3000
                                    });
                                }).catch(error => {
                            Swal.fire({
                                title: "Something went wrong ! try again",
                                timer: 3000
                            });
                        });
                    }
                }else{
                    Swal.fire({
                        title: "Confirm checkbox",
                        timer: 3000
                    });
                }
            }
        </script>
        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <div id="preloader"></div>
        <%@include file="common/commonjs.jsp" %>


    </body>

</html>