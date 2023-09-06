<%@page import="com.ramaasoft.dao.AdminDao"%>
<%@page import="com.ramaasoft.Entities.AdminEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.ramaasoft.dao.AdsDao"%>
<%@page import="com.ramaasoft.Entities.AdsEntity"%>
<!DOCTYPE html>
<%
    session.setAttribute("title", "Show ads");
    
    String isLogin1 = (String)session.getAttribute("isLogin1");
    if(isLogin1==null)
        response.sendRedirect("login.jsp");
        
    int cardsPerPage = 9;
    int totalCards = AdsDao.countOfAds();
//    int totalCards = 1000;
    int totalPages = (int) Math.ceil((double) totalCards / cardsPerPage);
    List<AdsEntity> getAds = AdsDao.getAllAds();

    int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int startIndex = (currentPage - 1) * cardsPerPage;
    List<AdsEntity> cardsToShow = getAds.subList(startIndex, Math.min(startIndex + cardsPerPage, totalCards));
%>
<html lang="en">
    <%@include file="common/head.jsp" %>
    <body>

        <!-- ======= Start Header ======= -->
        <%@include file="common/header.jsp" %>
        <!-- ======= End Header ======= -->
        <!-- navbar -->
        <%@include file="./common/navbar.jsp" %>
        <!-- navbar -->
        <!-- End Header -->

        <main id="main">
            <!-- ======= Breadcrumbs ======= -->
            <div class="breadcrumbs">
                <div class="page-header d-flex align-items-center" style="background-image: url('');">
                    <div class="container position-relative">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-6 text-center">
                                <h2>Show ads</h2>
                                <p>You can see all ads here. which are uploaded by sellers</p>
                            </div>
                        </div>
                    </div>
                </div>
                <nav>
                    <div class="container">
                        <ol>
                            <li><a href="index.html">Home</a></li>
                            <li>Show ads</li>
                        </ol>
                    </div>
                </nav>
            </div><!-- End Breadcrumbs -->

            <!-- ======= Blog Section ======= -->
            <section id="blog" class="blog">
                <div class="container" data-aos="fade-up">

                    <div class="row gy-4 posts-list">
                        <%                            
                            for (AdsEntity ads : cardsToShow) {
                                AdminEntity admin = AdminDao.getAdminByAdminId(ads.getSeller_id());

                        %>
                        <div class="col-xl-4 col-md-6">
                            <article>

                                <div class="post-img">
                                    <img src="./adsuploads/<%= ads.getAds_image()%>" alt="" class="img-fluid">
                                </div>

                                <p class="post-category"><%= ads.getAd_title()%> : <%= ads.getAd_id()%></p>

                                <h2 class="title">
                                    <a href="ads-details.jsp?adsid=<%= ads.getAd_id() %>"><%= ads.getAd_description()%></a>
                                </h2>

                                <div class="d-flex align-items-center">
                                    <img src="Admin/uploads/<%= admin.getImage() %>" alt="" class="img-fluid post-author-img">
                                    <div class="post-meta">
                                        <p class="post-author-list"><%= admin.getCompanyname() %></p>
                                        <p class="post-date">
                                            <time datetime="2022-01-01"><%= ads.getAd_creation_date()%></time>
                                        </p>
                                    </div>
                                </div>

                            </article>
                        </div>
                        <%}%>
                    </div><!-- End blog posts list -->

                    <div class="blog-pagination overflow-x-auto">
                        <ul class="pagination">
                            <li class="page-item<%= currentPage == 1 ? " disabled" : ""%>">
                                <a class="page-link" href="show-ads.jsp?page=<%= currentPage - 1%>">Previous</a>
                            </li>
                            <% for (int i = 1; i <= totalPages; i++) {%>
                            <li class="page-item<%= i == currentPage ? " active " : ""%>">
                                <a class="page-link" href="show-ads.jsp?page=<%= i%>"><%= i%></a>
                            </li>
                            <% }%>
                            <li class="page-item<%= currentPage == totalPages ? " disabled" : ""%>">
                                <a class="page-link" href="show-ads.jsp?page=<%= currentPage + 1%>">Next</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </section><!-- End Blog Section -->

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <%@include file="common/footer.jsp" %>
        <!-- End Footer -->
        
        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <div id="preloader"></div>
        <%@include file="common/commonjs.jsp" %>
        

    </body>

</html>