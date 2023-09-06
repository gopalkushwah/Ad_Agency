<%@page import="java.util.ArrayList"%>
<%@page import="com.ramaasoft.dao.AdsDao"%>
<%@page import="com.ramaasoft.Entities.AdsEntity"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("title", "Your Ads");
String isAdminLogin1 = UserDefinedCookies.getNormalCookies("isAdminLogin", request);
    if(isAdminLogin1==null)
        response.sendRedirect("pages-login.jsp");
//    getting all ads 
    AdminEntity admin = UserDefinedCookies.getAdminCookies(request, "adminLogin");
    List<AdsEntity> adsList = (ArrayList<AdsEntity>) AdsDao.getAllAdsByAdminId(admin.getAdmin_id());

%>
<!DOCTYPE html>
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
                <h1>Your Ads</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active">Your Ads</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-12">
                        <div class="card recent-sales overflow-auto">
                            <div class="card-body">
                                <h5 class="card-title">Recent Sales <span>| Today</span></h5>
                                <table class="table table-borderless datatable">
                                    <thead>
                                        <tr class="border-bottom">
                                            <th scope="col">Id</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Type</th>
                                            <th scope="col">Format</th>
                                            <th scope="col">Url</th>
                                            <th scope="col">Platform</th>
                                            <th scope="col">Budget</th>
                                            <th scope="col">Creation Date</th>
                                            <th scope="col">Last Update</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                          for (AdsEntity adsData : adsList) {
                                        %>
                                        <tr class="border-bottom">
                                            <th scope="row" class="text-primary"><%= adsData.getAd_id()%></th>
                                            <td><img src="../adsuploads/<%= adsData.getAds_image()%>" alt="<%= adsData.getAds_image()%>" width="50px" height="50px"/></td>
                                            <td><%= adsData.getAd_title()%></td>
                                            <td class="text-primary"><%= adsData.getAd_description()%></td>
                                            <td><%= adsData.getAd_type()%></td>
                                            <td><%= adsData.getAd_format()%></td>
                                            <td><%= adsData.getAd_url()%></td>
                                            <td><%= adsData.getAd_platform()%></td>
                                            <td><%= adsData.getAd_budget()%></td>
                                            <td><%= adsData.getAd_creation_date()%></td>
                                            <td><%= adsData.getAd_last_updated()%></td>
                                            <% if (adsData.getAd_status().equals("Active")) {%>
                                            <td><span class="badge bg-success"><%= adsData.getAd_status()%></span></td>
                                                <% } else {%>
                                            <td><span class="badge bg-danger"><%= adsData.getAd_status()%></span></td>
                                                <%}%>
                                            <td><a href="edit-ads.jsp?adsid=<%= adsData.getAd_id()%>" class="btn btn-sm btn-outline-success" data-bs-toggle="tooltip" data-bs-placement="left" title="Edit"><i class="bi bi-pen"></i></a></td>
                                            <td><a href="../DeleteAdsServlet?adsid=<%= adsData.getAd_id()%>" class="btn btn-sm btn-outline-danger" data-bs-toggle="tooltip" data-bs-placement="left" title="Delete"><i class="bi bi-trash"></i></a></td>
                                        </tr>
                                        <% } %>
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
            <%@include file="./admin_common/commonjs.jsp" %>
        <!--js files-->

    </body>
</html>
